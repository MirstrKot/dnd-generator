<?php

namespace App\Handlers;


use App\Classes\Character\ScoresGenerator;
use App\Helpers\RequestHelper;
use App\Models\Character;
use App\Models\ScoresSet;

class CharacterGeneratorHandler implements IHandler
{
    /**
     * @var ScoresGenerator
     */
    protected $scoresGenerator;
    /**
     * @var ScoresSet
     */
    protected $scoresSet;
    /**
     * @var Character
     */
    protected $character;
    /**
     * @var int
     */
    protected $level;
    protected $levelMultiplier;
    protected $overPullScores = [];
    protected $highScores = [];
    protected $lowScores = [];

    protected $templateData = [];

    public function run()
    {
        $this->templateData['score_types'] = ScoresGenerator::$scoreTypes;
        if (!RequestHelper::getFromPost('generate')) {
            return $this->templateData;
        }
        $this
            ->getPostData()
            ->initScoreGenerator()
            ->generateScoresSet()
            ->makeCharacter()
            ->makeTemplateData();
        return $this->templateData;
    }

    private function getPostData()
    {
        $this->level = RequestHelper::getFromPost('level');
        $this->levelMultiplier = RequestHelper::getFromPost('levelMultiplier');
        foreach(ScoresGenerator::$scoreTypes as $scoreType => $name) {
            switch (RequestHelper::getFromPost($scoreType)) {
                case "overpull":
                    $this->overPullScores[] = $scoreType;
                    break;
                case "low":
                    $this->lowScores[] = $scoreType;
                    break;
                case "high":
                    $this->highScores[] = $scoreType;
                    break;
            }
        }
        return $this;
    }

    private function initScoreGenerator()
    {
        $this->scoresGenerator = new ScoresGenerator(
            $this->level,
            $this->highScores,
            $this->lowScores,
            $this->overPullScores,
            $this->levelMultiplier
        );
        return $this;
    }

    private function generateScoresSet()
    {
        $this->scoresSet = $this->scoresGenerator->generateScoreSet();
        return $this;
    }

    private function makeCharacter()
    {
        $this->character = new Character($this->level, $this->scoresSet);
        return $this;
    }

    private function makeTemplateData()
    {
        foreach (ScoresGenerator::$scoreTypes as $scoreType => $name) {
            $this->templateData['scores'][] = [
                'type' => $scoreType,
                'name' => $name,
                'value' => $this->scoresSet->$scoreType,
                'roll' => floor($this->scoresSet->$scoreType / 5)
            ];
        }
        $this->templateData['computed'] = [
            [
                'type' => 'hp',
                'name' => 'Здоровье',
                'value' => $this->character->hp()
            ],
            [
                'type' => 'mp',
                'name' => 'Мана',
                'value' => $this->character->mp()
            ],
            [
                'type' => 'stp',
                'name' => 'Стамина',
                'value' => $this->character->stp()
            ],
            [
                'type' => 'exp',
                'name' => 'Опыт',
                'value' => $this->character->exp()
            ],
            [
                'type' => 'init',
                'name' => 'Инициатива',
                'value' => $this->character->init()
            ],
        ];
        $this->templateData['killExp'] = $this->character->killExp();
        $this->templateData['commonInfo'] = [
            [
                'type' => 'level',
                'name' => 'Уровень',
                'value' => $this->level
            ],
            [
                'type' => 'levelMultipler',
                'name' => 'Статов за 1 уровень',
                'value' => $this->levelMultiplier
            ],
            [
                'type' => 'mainScoresTypes',
                'name' => 'Основные статы, которые он качал засчет уровня',
                'value' => implode(", ", $this->scoresSet->mainScoreTypes)
            ]
        ];
        return $this;
    }
}