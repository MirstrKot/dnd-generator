<?php

use App\Classes\DB;
use App\Classes\StaffGeneratorHandler;
use App\Templates\StuffGeneratorTemplate;

require_once(__DIR__ . "/../App/Core.php");
new Core();

$db = new DB;
$db->connect();

$handler = new StaffGeneratorHandler($db);
$template = new StuffGeneratorTemplate($handler->run());
$template->render();