<?php

use App\Classes\DB;
use App\Handlers\StuffGeneratorHandler;
use App\Templates\ApiDataTemplate;
use App\Templates\StuffGeneratorTemplate;
use App\Handlers\StartInfoHandler;

require_once __DIR__ . "/../App/Core.php";
new Core();

$db = new DB;
$db->connect();

switch ($_SERVER["REQUEST_URI"]) {
    case "/getStartInfo/":
        $templateData = (new StartInfoHandler($db))->run();
        $template = new ApiDataTemplate($templateData);
        $template->render();
        break;
    case "/getItems/":
        $handler = new StuffGeneratorHandler($db);
        $templateData = $handler->run();
        $template = new ApiDataTemplate($templateData);
        $template->render();
        break;
    default:
        $template = new StuffGeneratorTemplate([]);
        $template->render();
        break;
}
