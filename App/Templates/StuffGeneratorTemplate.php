<?php
namespace App\Templates;

use App\Classes\AbstractTemplate;

class StuffGeneratorTemplate extends AbstractTemplate
{
    public function render() {
        ?>
        <html>
        <form method="POST" action="">
            <h1>Генератор предметов DND alpha</h1>
            <p>
                <h2>Типы предметов необходимых для генерации</h2>
                <?php foreach($this->data['types'] as $type):?>
                    <div class="type_checkbox">
                        <?php $checked = in_array($type['id'], $this->data['requested_types']) ? "checked" : "";?>
                        <label><input type="checkbox" name="types[]" value="<?=$type['id']?>" <?=$checked?>> <?=$type['name']?></label>
                    </div>
                <?php endforeach;?>
            </p>
            <p class="actions_panel">
                <!-- TODO: сделать чтобы работало -->
                <a href="" class="quick_link">Выбрать все</a> <a href="" class="quick_link">Убрать все</a>
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
            <p>
                <h3 class="result_item"><?= $item['name'] ?></h3>
                <div><?= $item['type_name'] ?> - <?= $item['category_name'] ?></div>
                <div>
                    <?php foreach ($this->data['rarity'] as $rarity): ?>
                        <!-- TODO: сделать выбор в виде кубиков разных цветов и при выборе заголовок подсвечиваля нужным
                            Заюзайте <?=$rarity['code']?> в яваскрипте для css-классов нужного цвета
                        -->
                        <a href="" class="quick_link"><?=$rarity['name']?></a>,
                    <?php endforeach;?>
                </div>
            </p>
        <?php endforeach;?>

        <style>
            body {
                padding: 50px;
            }
            .send_button {
                width: 180px; height: 50px; display: block;
            }
            .number_input {
                height: 50px;
                display:block;
                width: 50px;
                text-align: center;
            }
            .type_checkbox {
                font-size: 18px;
            }
            .result_item {
                margin-bottom: 0;
            }
            a.quick_link {
                color: #1e90ff;
                text-decoration: none;
                border-bottom: 1px dashed #1e90ff;
            }
            .actions_panel .quick_link {
                margin-right: 10px;
            }
        </style>
        </html>
        <?php
    }
}