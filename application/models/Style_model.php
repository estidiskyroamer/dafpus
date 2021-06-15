<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Style_model extends CI_Model {
    public function getStyle($val = null){
        if(empty($val) || $val==null){
            $query = $this->db->get('style');
        }
        else{
            $query = $this->db->get_where('style', array('id' => $val['id']));
        }
        
        return $query->result();
    }

    public function addStyle($val){
        $current_time = date('Y-m-d H:i:s',time());
        if(!empty($val)){
            $query = $this->db->query('INSERT INTO style(id, nama_style, timestamp, user) VALUES ("", "'.$val['nama_style'].'", "'.$current_time.'", "'.$val['user'].'")');
        }
        
    }
}

?>