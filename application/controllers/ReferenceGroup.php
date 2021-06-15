<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ReferenceGroup extends CI_Controller {
	public function index(){
		$this->load->view('common/header');
		$this->load->view('referenceGroup/index');
	}

    public function addGroup(){
        $this->referencegroup_model->addGroup($_POST);
    }

    public function getGroup(){
        $referenceGroup = $this->referencegroup_model->getGroup();
        echo json_encode($referenceGroup);
    }

    public function delGroup(){
        $this->referencegroup_model->delGroup($_POST);
    }
}
