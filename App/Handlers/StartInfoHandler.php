<?PHP

namespace App\Handlers;

use App\Handlers\IHandler;
use App\Classes\DB;

class StartInfoHandler implements IHandler
{
    private $db;

    public function __construct(DB $db)
    {
        $this->db = $db;
    }

    public function run() {
        return [
            'types' => $this->typesQuery()
        ];
    }

    private function typesQuery(): array
    {
        $sql = 'SELECT id, name FROM stuff_type ORDER BY id';
        return $this->db->getAllRows($sql) ?: [];
    }

}
