<?php

class Core
{
    protected static $config = [];

    public function __construct()
    {
        spl_autoload_register('self::autoLoader');
    }

    public static function autoLoader($class)
    {
        $file = __DIR__ . '/../' . str_replace('\\', '/', $class) . '.php';

        // if the file exists, require it
        if (file_exists($file)) {
            require_once($file);
        }
    }

    /**
     * @return mixed
     * @throws Exception
     */
    public static function config($field, $defaultValue = null)
    {
        if (empty(self::$config)) {
            self::loadConfig();
        }
        return array_key_exists($field, self::$config) ? self::$config[$field] : $defaultValue;
    }

    /**
     * @throws Exception
     */
    private static function loadConfig()
    {
        $file = __DIR__ . '/../env.php';
        if (file_exists($file)) {
            self::$config = require_once $file;
        }
        else {
            throw new Exception("Создайте файл env.php в корне проекта, пример в env.php.example");
        }
    }
}