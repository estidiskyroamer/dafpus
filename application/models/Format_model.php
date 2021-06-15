<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Format_model extends CI_Model {
    public function getFormat($val = null){
        $query = $this->db->get('format');
        if(isset($val['id']) && $val['id']){
            $query = $this->db->get_where('format', array('id' => $val['id']));
        }
        else if(isset($val['style_id']) && $val['style_id']){
            $query = $this->db->get_where('format', array('style_id' => $val['style_id']));
        }
        
        return $query->result();
    }
}

?>