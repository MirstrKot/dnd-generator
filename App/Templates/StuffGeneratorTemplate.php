<?php
namespace App\Templates;

use App\Classes\AbstractTemplate;

class StuffGeneratorTemplate extends AbstractTemplate
{
    public function render() {
        ?>
        <html>
        <head>
            <link rel="stylesheet" href="/styles.css">
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
            <title>Генератор предметов DND alpha</title>
        </head>
        <body class="generator_body">
            <form method="POST" action="">
                <h1>Генератор предметов DND alpha</h1>
                <p>
                    <h2>Типы предметов необходимых для генерации</h2>
                    <?php foreach($this->data['types'] as $type):?>
                        <div class="type_checkbox">
                            <?php $checked = in_array($type['id'], $this->data['requested_types']) ? "checked" : "";?>
                            <label>
                                <input type="checkbox"
                                       class="type_checkbox_input"
                                       name="types[]"
                                       value="<?=$type['id']?>"
                                       <?=$checked?>>
                                <?=$type['name']?>
                            </label>
                        </div>
                    <?php endforeach;?>
                </p>
                <p class="actions_panel">
                    <a href="" class="quick_link" id="check_all_types_button">Выбрать все</a>
                    <a href="" class="quick_link" id="uncheck_all_types_button">Убрать все</a>
                </p>
                <p>
                <h2>Количество предметов для генерации</h2>
                <div>
                    <input type="number" name="count" value="<?=$this->data['count']?>" class="number_input">
                </div>
                </p>
                <p>
                    <button class="send_button">Сгенерировать</button>
                </p>
            </form>
            <?php foreach ($this->data['result'] as $item): ?>
                <div class="result_item_panel">
                    <div class="result_item">
                        <h3 class="result_item_header"><?= $item['name'] ?></h3>
                        <div><?= $item['type_name'] ?> - <?= $item['category_name'] ?></div>
                    </div>
                    <div class="rarity_panel">
                        <?php foreach ($this->data['rarity'] as $rarity): ?>
                            <button class="rarity_item <?=$rarity['code']?>" title="<?=$rarity['name']?>"></button>
                        <?php endforeach;?>
                    </div>
                </div>
            <?php endforeach;?>
            <script type="application/javascript" src="/generator.js"></script>
        </body>
        </html>
        <?php
    }
}