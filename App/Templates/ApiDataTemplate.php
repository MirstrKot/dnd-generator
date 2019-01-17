<?PHP
namespace App\Templates;

use App\Classes\AbstractTemplate;

class ApiDataTemplate extends AbstractTemplate
{

    protected function setContentType()
    {
        header('Content-Type: application/json; charset=utf-8');
    }

    public function render()
    {
        echo json_encode($this->data);
    }
}
