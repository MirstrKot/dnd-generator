<?php
namespace App\Templates;

use App\Classes\AbstractTemplate;
use \Core;

class StuffGeneratorTemplate extends AbstractTemplate
{
    public function render()
    {
        ?>
        <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
            <title>Генератор предметов DND alpha</title>
        </head>
        <body>
            <div id="app"></div>
            <script src="/bundles/app.min.js?v=<?=filemtime(Core::$root . "/bundles/app.min.js")?>"></script>
        </body>
        </html>
        <?php
}
}