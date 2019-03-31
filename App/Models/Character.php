<?php
namespace App\Models;

class Character
{
    protected $level;
    /** @var ScoresSet */
    protected $scoresSet;

    public function __construct($level, $scoresSet)
    {
        $this->level = $level;
        $this->scoresSet = $scoresSet;
    }

    public function hp() {
        return floor((3.5 * $this->scoresSet->con) + (10 * $this->scoresSet->vit));
    }

    public function mp()
    {
        return floor((10 * $this->scoresSet->int) + (1.5 * $this->scoresSet->acc));
    }

    public function stp()
    {
        return floor((2 * $this->scoresSet->str) - (0.5 * $this->scoresSet->con) + (4 * $this->scoresSet->vit) + (4 * $this->scoresSet->agi));
    }

    public function exp()
    {
        return $this->level * ($this->level - 1) * 500;
    }

    public function init()
    {
        return floor(0.5 * ($this->scoresSet->str + $this->scoresSet->int + $this->scoresSet->agi)) - $this->scoresSet->con;
    }

    public function killExp()
    {
        return [
            'kill' => $this->exp() * 0.1,
            'crit' => $this->exp() * 0.09,
            'hit' => $this->exp() * 0.07,
            'wound' => $this->exp() * 0.05,
            'support' => $this->exp() * 0.03,
            'touch' => $this->exp() * 0.02,
        ];
    }
}