<?php

namespace App\Classes;

abstract class AbstractTemplate
{
    protected $data;

    public function __construct(array $data)
    {
        $this->data = $data;
    }

    abstract function render();
}