<?php
namespace App\Classes;

use Core;
use PDO;
use PDOException;

class DB
{
    protected $host;
    protected $db;
    protected $username;
    protected $password;
    protected $port;
    protected $type;

    /** @var PDO */
    protected $connection;

    public function __construct()
    {
        $this->host = Core::config('DB_HOST');
        $this->db = Core::config('DB_NAME');
        $this->username = Core::config('DB_USER');
        $this->password = Core::config('DB_PASSWORD');
        $this->port = Core::config('DB_PORT');
        $this->type = Core::config('DB_TYPE');
    }

    public function connect()
    {
        $dsn = $this->type.":host=$this->host;port=$this->port;dbname=$this->db";
        try {
            $this->connection = new PDO($dsn, $this->username, $this->password);
            return true;
        } catch (PDOException $e) {
            echo $e->getMessage();
            return false;
        }

    }

    public function query($statement, $params = [])
    {
        $this->replaceCompatibilityStrings($statement);
        $statementObj = $this->connection->prepare($statement);
        $statementObj->execute($params);
        return $statementObj;
    }

    public function getOneRow($statement, $params = [])
    {
        $statementObj = $this->query($statement, $params);
        return $statementObj->fetch();
    }

    public function getAllRows($statement, $params = [])
    {
        $statementObj = $this->query($statement, $params);
        return $statementObj->fetchAll();
    }

    public function getPlaceholdersString($value)
    {
        if (is_array($value)) {
            $placeholdersArray = [];
            foreach($value as $v) {
                $placeholdersArray[] =  "?";
            }
            return implode(",", $placeholdersArray);
        }
        else {
            return "?";
        }
    }

    private function replaceCompatibilityStrings(&$statement)
    {
        if ($this->type == "mysql") {
            $statement = str_replace("ORDER BY RANDOM", "ORDER BY RAND", $statement);
        }
    }
}