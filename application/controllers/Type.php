<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Type extends CI_Controller {

    public function getType(){
        $type = $this->type_model->getType($_GET);
        echo json_encode($type);
    }
}
