<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ReferenceGroup_model extends CI_Model {
    public function getGroup($val = null){
        if(empty($val) || $val==null){
            $query = $this->db->query('SELECT rg.*, count(r.id) AS jml_referensi FROM reference_group rg LEFT JOIN reference r ON rg.id = r.reference_group_id GROUP BY id');
        }
        else{
            $query = $this->db->get_where('reference_group', array('id' => $val['id']));
        }
        
        return $query->result();
    }

    public function addGroup($val){
        $current_time = date('Y-m-d H:i:s',time());
        if(!empty($val)){
            $this->db->query('INSERT INTO reference_group(id, nama, date_created, date_last_changed, user) VALUES ("GR-'.time().'", "'.$val['nama'].'", "'.$current_time.'", "'.$current_time.'", "'.$val['user'].'")');
        }
        
    }

    public function delGroup($val){
        if(!empty($val)){
            $this->db->query('DELETE FROM reference_group WHERE reference_group.id = "'.$val['id'].'"');
        }
    }
}

?>