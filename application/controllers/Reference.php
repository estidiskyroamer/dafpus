<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reference extends CI_Controller {
	public function index($param = null){
		if($param!=null){
			$data['reference_group'] = $this->referencegroup_model->getGroup(array('id'=>$param));
		}
		$data['type'] = $this->type_model->getType();
		$data['style'] = $this->style_model->getStyle();
		$data['all_group'] = $this->referencegroup_model->getGroup();
		
		$this->load->view('common/header');
		$this->load->view('reference/index', $data);
	}

    public function addReference(){
        $this->reference_model->addReference($_POST);
    }

    public function getReference(){
        $reference = $this->reference_model->getReference($_POST);
		$referenceArr = json_decode(json_encode($reference), true);
		foreach($referenceArr as $i=>$ref) {
			$content = json_decode($ref['content'], true);
			if(isset($content['judul'])){
				$referenceArr[$i]['referensi'] = $content['judul'];
			}
			else{
				$referenceArr[$i]['referensi'] = $content['url'];
			}			
		}
        echo json_encode($referenceArr);
    }

    public function delReference(){
        $this->reference_model->delReference($_POST);
    }
}
