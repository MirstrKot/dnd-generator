<?php

namespace App\Classes;

abstract class AbstractTemplate
{
    protected $data;

    public function __construct(array $data)
    {
        $this->data = $data;
        $this->setContentType();
    }

    protected function setContentType() {
        header('Content-Type: text/html; charset=utf-8');
    }

    abstract function render();
}