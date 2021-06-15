<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Type_model extends CI_Model {
    public function getType($val = null){
        if(empty($val) || $val==null){
            $query = $this->db->get('type');
        }
        else{
            $query = $this->db->get_where('type', array('id' => $val['id']));
        }
        
        return $query->result();
    }
}

?>