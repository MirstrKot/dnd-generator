<?php

class Core
{
    protected static $config = [];
    public static $root;

    public function __construct()
    {
        spl_autoload_register('self::autoLoader');
        self::$root = getcwd();
    }

    public static function autoLoader($class)
    {
        $file_handler = __DIR__ . '/../' . str_replace('\\', '/', $class) . '.php';

        // if the file exists, require it
        if (file_exists($file_handler)) {
            require_once $file_handler;
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
        $file_path = __DIR__ . '/../env.ini';
        if (file_exists($file_path)) {
            self::$config = parse_ini_file($file_path, true);
        } else {
            throw new Exception("Создайте файл env.php в корне проекта, пример в env.php.example");
        }
    }
}
