<?php

namespace App\Classes;

abstract class AbstractTemplate
{
    protected $data;

    public function __construct(array $data)
    {
        $this->data = $data;
        header('Content-Type: text/html; charset=utf-8');
    }

    abstract function render();
}