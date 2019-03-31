<?php

namespace App\Classes\Character;

use App\Models\ScoresSet;

class ScoresGenerator
{
    protected $level;
    protected $levelMultiplier;
    protected $highScores;
    protected $lowScores;
    protected $overPullScores;

    public static $scoreTypes = [
        'str' => 'Сила',
        'con' => 'Конституция',
        'vit' => 'Живучесть',
        'agi' => 'Ловкость',
        'acc' => 'Точность',
        'int' => 'Интеллект',
        'cha' => 'Харизма',
        'luk' => 'Удача'
    ];

    protected $baseGenerationPoints = [
        self::GENERATION_TYPE_LOW => [
            'min' => 5,
            'max' => 12
        ],
        self::GENERATION_TYPE_NORMAL => [
            'min' => 5,
            'max' => 18
        ],
        self::GENERATION_TYPE_HIGH => [
            'min' => 15,
            'max' => 20
        ],
        self::GENERATION_TYPE_OVERPULL => [
            'min' => 15,
            'max' => 40
        ],
    ];

    /**
     * @var ScoresSet
     */
    protected $resultScoreSet;

    const GENERATION_TYPE_HIGH = 'high';
    const GENERATION_TYPE_NORMAL = 'normal';
    const GENERATION_TYPE_LOW = 'low';
    const GENERATION_TYPE_OVERPULL = 'overpull';

    public function __construct($level, $highScores, $lowScores, $overPullScores, $levelMultiplier)
    {
        $this->resultScoreSet = new ScoresSet();
        $this->level = $level;
        $this->highScores = $highScores;
        $this->lowScores = $lowScores;
        $this->overPullScores = $overPullScores;
        $this->levelMultiplier = $levelMultiplier;
    }

    /**
     * @return ScoresSet
     */
    public function generateScoreSet()
    {
        $this->generateBaseCharacterScores();
        $this->generateLevelCharacterScores();
        return $this->resultScoreSet;
    }

    /**
     * Очки которые персонаж получил при 1 уровне. Расу не учитываем, считаем, что она и так заложена в рандом.
     */
    protected function generateBaseCharacterScores()
    {
        foreach (self::$scoreTypes as $scoreType => $name) {
            if (in_array($scoreType, $this->overPullScores)) {
                $weightType = self::GENERATION_TYPE_OVERPULL;
            } elseif (in_array($scoreType, $this->highScores)) {
                $weightType = self::GENERATION_TYPE_HIGH;
            } elseif (in_array($scoreType, $this->lowScores)) {
                $weightType = self::GENERATION_TYPE_LOW;
            } else {
                $weightType = self::GENERATION_TYPE_NORMAL;
            }
            $this->resultScoreSet->$scoreType = $this->generateBaseScore($weightType);
        }
    }

    /**
     * Очки которые персонаж получил за достижение уровня. 1 уровень - 1 очко.
     */
    protected function generateLevelCharacterScores()
    {
        $this->resultScoreSet->mainScoreTypes = $this->getMainScoreTypes();
        $levelScoresLeft = $this->level;
        if ($levelScoresLeft && $this->levelMultiplier > 0) {
            while ($levelScoresLeft > 0) {
                //накидываем добавил ли он или нет очко
                $willAdd = rand(0, 1);
                if ($willAdd) {
                    //накидываем в случайную из 3 основную характеристику
                    $addTo = $this->resultScoreSet->mainScoreTypes[array_rand($this->resultScoreSet->mainScoreTypes)];
                    $this->resultScoreSet->$addTo = $this->resultScoreSet->$addTo + $this->levelMultiplier;
                    $levelScoresLeft--;
                }
            }
        }
    }

    /**
     * @param string $generationType
     * @return int
     */
    protected function generateBaseScore($generationType = self::GENERATION_TYPE_NORMAL)
    {
        return rand(
            $this->baseGenerationPoints[$generationType]['min'],
            $this->baseGenerationPoints[$generationType]['max']
        );
    }

    /**
     * определяем основные 3 характеристики, которые мог бы качать персонаж
     * @return array
     */
    protected function getMainScoreTypes()
    {
        $mainScoreTypes = [];
        $count = 3;
        if (!empty($this->overPullScores)) {
            shuffle($this->overPullScores);
            foreach ($this->overPullScores as $scoreType) {
                $mainScoreTypes[] = $scoreType;
                if (count($mainScoreTypes) >= $count) {
                    return $mainScoreTypes;
                }
            }
        }
        if (!empty($this->highScores)) {
            shuffle($this->highScores);
            foreach ($this->highScores as $scoreType) {
                $mainScoreTypes[] = $scoreType;
                if (count($mainScoreTypes) >= $count) {
                    return $mainScoreTypes;
                }
            }
        }
        //если не смогли набрать 3 штуки из оверпулл и высоких, то берем из оставшихся случайным образом, но исключая низкие
        $restTypes = array_keys(self::$scoreTypes);
        if (!empty($this->lowScores)) {
            foreach ($this->lowScores as $scoreType) {
                $key = array_search($scoreType, $restTypes);
                if ($key !== false) {
                    unset($restTypes[$key]);
                }
            }
        }
        //если все параметры низкоприоритетные, то считаем, что  качает все что угодно
        if (empty($restTypes)) {
            $restTypes = array_keys(self::$scoreTypes);
        }

        shuffle($restTypes);
        foreach ($restTypes as $scoreType) {
            $mainScoreTypes[] = $scoreType;
            if (count($mainScoreTypes) >= $count) {
                return $mainScoreTypes;
            }
        }

        return $mainScoreTypes;
    }
}