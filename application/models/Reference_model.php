<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reference_model extends CI_Model {
    public function getReference($val = null){
        $query = $this->db->query('SELECT r.*, t.nama_type, g.nama AS grup FROM reference r LEFT JOIN type t ON r.type_id = t.id LEFT JOIN reference_group g ON r.reference_group_id = g.id');
        if(isset($val['reference_group_id']) && $val['reference_group_id']!=null){
            $query = $this->db->query('SELECT r.*, t.nama_type, g.nama AS grup FROM reference r LEFT JOIN type t ON r.type_id = t.id LEFT JOIN reference_group g ON r.reference_group_id = g.id WHERE r.reference_group_id = g.id');
        }
        else if(isset($val['id']) && $val['id']!=null){
            $query = $this->db->query('SELECT r.*, t.nama_type, g.nama AS grup FROM reference r LEFT JOIN type t ON r.type_id = t.id LEFT JOIN reference_group g ON r.reference_group_id = g.id WHERE r.id = "'.$val['id'].'"');
        }
        
        return $query->result();
    }

    public function addReference($val){
        $current_time = date('Y-m-d H:i:s',time());
        $reference_group_id = 'NULL';
        $id = 'R-'.time();
        if(!empty($val['reference_group_id'])) $reference_group_id = '"'.$val['reference_group_id'].'"';
        if(!empty($val['id'])) $id = $val['id'];
        if(!empty($val)){
            $this->db->query('INSERT INTO reference(id, reference_group_id, type_id, content, date_created, user) VALUES ("'.$id.'", '.$reference_group_id.', "'.$val['type_id'].'", "'.$val['content'].'", "'.$current_time.'", "'.$val['user'].'") ON DUPLICATE KEY UPDATE type_id="'.$val['type_id'].'", content="'.$val['content'].'", reference_group_id='.$reference_group_id);
        }
    }

    public function delReference($val){
        $this->db->query('DELETE FROM reference WHERE reference.id = "'.$val['id'].'"');
    }
}

?>