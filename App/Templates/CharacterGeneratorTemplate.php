<?php
namespace App\Templates;

use App\Classes\AbstractTemplate;

class CharacterGeneratorTemplate extends AbstractTemplate
{
    public function render()
    {
        ?>
        <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
            <title>Генератор персонажей DND alpha</title>
        </head>
        <body>
            <form method="POST" action="">
                <input type="hidden" name="generate" value="1">
                <div>Уровень <input type="number" value="10" name="level"></div>
                <div>Сколько дают статов за уровень (для более сильных мобов)
                    <select name="levelMultiplier">
                        <option value="1">1 - слабак</option>
                        <option value="2">2 - обычный</option>
                        <option value="3">3 - сильный</option>
                        <option value="4">4 - крутой</option>
                        <option value="5">5 - имба</option>
                    </select>
                </div>
                <?php foreach($this->data['score_types'] as $score_type => $name):?>
                    <h2><?=$name?></h2>
                    <div>
                        <label style="margin-right: 25px;">
                            Обычный <input type="radio" name="<?=$score_type?>" value="normal" checked="checked">
                        </label>
                        <label style="margin-right: 25px;">
                            Низкий <input type="radio" name="<?=$score_type?>" value="low">
                        </label>
                        <label style="margin-right: 25px;">
                            Высокий <input type="radio" name="<?=$score_type?>" value="high">
                        </label>
                        <label style="margin-right: 25px;">
                            Оверпулл <input type="radio" name="<?=$score_type?>" value="overpull">
                        </label>
                    </div>
                <?php endforeach;?>
                <div style="margin-top: 30px;"><button type="submit" style="height: 50px; width: 300px;">Генерировать</button></div>
            </form>
            <?php if(!empty($this->data['commonInfo'])):?>
                <h2>Уровневые показатели</h2>
                <?php foreach($this->data['commonInfo'] as $scoreData):?>
                    <p><?=$scoreData['name']?>: <b><?=$scoreData['value']?></b></p>
                <?php endforeach;?>
            <?php endif;?>
            <?php if(!empty($this->data['scores'])):?>
                <h2>Статы:</h2>
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th>Параметр</th>
                            <th>Очки</th>
                            <th>К броску</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($this->data['scores'] as $scoreData):?>
                        <tr>
                            <td><?=strtoupper($scoreData['type'])?></td>
                            <td><?=$scoreData['name']?></td>
                            <td><?=$scoreData['value']?></td>
                            <td>+<?=$scoreData['roll']?></td>
                        </tr>
                        <?php endforeach;?>
                    </tbody>
                </table>
            <?php endif;?>
            <?php if(!empty($this->data['computed'])):?>
                <h2>Вычисляемые показатели:</h2>
                <table>
                    <thead>
                    <tr>
                        <th></th>
                        <th>Параметр</th>
                        <th>Очки</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach($this->data['computed'] as $scoreData):?>
                        <tr>
                            <td><?=strtoupper($scoreData['type'])?></td>
                            <td><?=$scoreData['name']?></td>
                            <td><?=$scoreData['value']?></td>
                        </tr>
                    <?php endforeach;?>
                    </tbody>
                </table>
            <?php endif;?>
            <?php if(!empty($this->data['killExp'])):?>
                <h2>Опыт за убийство:</h2>
                <table>
                    <thead>
                    <tr>
                        <th>Тип</th>
                        <th>Опыт</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach($this->data['killExp'] as $type => $exp):?>
                        <tr>
                            <td><?=$type?></td>
                            <td><?=$exp?></td>
                        </tr>
                    <?php endforeach;?>
                    </tbody>
                </table>
            <?php endif;?>
        </body>
        </html>
        <?php
}
}