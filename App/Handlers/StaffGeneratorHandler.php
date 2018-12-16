<?php

namespace App\Handlers;

use App\Classes\DB;

class StaffGeneratorHandler
{

    protected $db;

    protected $count;
    protected $types;
    protected $result;

    protected $templateData = [];

    const MIN_COUNT = 1;
    const MAX_COUNT = 100;

    public function __construct(DB $db)
    {
        $this->db = $db;
    }

    public function run(): array
    {
        $this->getDataFromPost()
            ->validate()
            ->generateItems()
            ->getTemplateData();
        return $this->templateData;
    }

    private function getDataFromPost(): self
    {
        $this->count = $this->getFromPost('count');
        $this->types = $this->getFromPost('types');
        return $this;
    }

    private function validate(): self
    {
        if ($this->count < self::MIN_COUNT) {
            $this->count = self::MIN_COUNT;
        } elseif ($this->count > self::MAX_COUNT) {
            $this->count = self::MAX_COUNT;
        }
        return $this;
    }

    private function generateItems(): self
    {
        $this->result = [];
        if ($this->count && $this->types) {
            for ($i = 1; $i <= $this->count; $i++) {
                $this->result[] = $this->itemsQuery();
            }
        }
        return $this;
    }

    private function getTemplateData(): self
    {
        $allTypes = $this->typesQuery();
        $this->templateData['types'] = $allTypes;
        $this->templateData['count'] = $this->count;
        $this->templateData['rarity'] = $this->rarityQuery();

        if ($this->types) {
            $types = $this->types;
        } else {
            $types = [];
            foreach ($allTypes as $type) {
                $types[] = $type['id'];
            }
        }
        $this->templateData['requested_types'] = $types;
        $this->templateData['result'] = $this->result;
        return $this;
    }

    private function getFromPost($field)
    {
        return isset($_POST[$field]) ? $_POST[$field] : null;
    }

    private function typesQuery(): array
    {
        $sql = 'SELECT id, name FROM stuff_type ORDER BY id';
        return $this->db->getAllRows($sql) ?: [];
    }

    private function rarityQuery(): array
    {
        $sql = 'SELECT id, name, code FROM stuff_rarity ORDER BY id';
        return $this->db->getAllRows($sql) ?: [];
    }

    private function itemsQuery(): array
    {
        $sql = 'SELECT stuff.id, stuff.name, stuff_category.name as category_name, stuff_type.name as type_name FROM 
                    stuff
                    LEFT JOIN stuff_category ON stuff_category.id = stuff.category_id
                    LEFT JOIN stuff_type ON stuff_type.id = stuff_category.stuff_type_id
                    WHERE stuff.category_id = (SELECT id 
                        FROM stuff_category 
                        WHERE stuff_type_id IN (' . $this->db->getPlaceholdersString($this->types) . ')
                        ORDER BY RANDOM() 
                        LIMIT 1
                    )
                    ORDER BY RANDOM()
                    LIMIT 1';
        return $this->db->getOneRow($sql, $this->types) ?: [];
    }
}