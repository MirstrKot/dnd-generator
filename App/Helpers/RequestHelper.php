<?php
namespace App\Helpers;

class RequestHelper
{
    public static function getFromPost($field, $default = null)
    {
        return isset($_POST[$field]) ? $_POST[$field] : $default;
    }

}