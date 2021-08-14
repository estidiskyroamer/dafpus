<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Bibliography extends CI_Controller {
	public function generateBibliography() {
        $param = $_POST;
        if(!empty($param)) {
            $references = $this->reference_model->getReference($param);
            $referencesArr = json_decode(json_encode($references), true);
            $formats = $this->format_model->getFormat($param);
            $formatsArr = json_decode(json_encode($formats), true);
            $style = $this->style_model->getStyle(array('id'=>$param['style_id']));
            $bib = array();
            foreach($referencesArr as $ref) {
                $content_type = $ref['type_id'];
                $ref_content = json_decode($ref['content'], true);
                $type_id = array_search($content_type, array_column($formatsArr, 'type_id'));
                $content_format = $formatsArr[$type_id]['content'];
                $temp = $content_format;

                foreach($ref_content as $i=>$c) {
                    if($i == 'penulis') {
                        if(strpos($content_format, $i.'_initial') !== false) {
                            $content_format = str_replace('_initial', '', $content_format);
                            $c = $this->penulis_initial(($c));
                            $temp = str_replace("{".$i."_initial}", $c, $temp);
                        }
                    }
                    if(strpos($content_format, $i.'_italic') !== false) {
                        $content_format = str_replace('_italic', '', $content_format);
                        $temp = str_replace("{".$i."_italic}", "<i>".$c."</i>", $temp);
                    }
                    $temp = str_replace("{".$i."}", $c, $temp);
                }
                $temp = $this->cleanup($temp);
                array_push($bib, $temp);
            }
            sort($bib);
            $result = array('bib'=> $bib, 'style'=>$style[0]);
            echo json_encode($result);
        }
        else echo json_encode(null);
    }

    function penulis_initial($list){
        $penulis_array = explode("; ", $list);
        $temp_penulis = '';
        foreach($penulis_array as $i=>$penulis) {            
            if(strpos($penulis, '-corporate') === false) { //non-corporate author
                $penulis_arr = explode(' ', $penulis);
                $temp_depan_penulis = '';
                $last_key = count($penulis_arr)-1;
                
                foreach($penulis_arr as $j=>$arr) { //format names
                    if($j < $last_key) { //not last element
                        $penulis_arr[$j] = substr($penulis_arr[$j], 0, 1).'.';
                        $temp_depan_penulis.= $penulis_arr[$j];
                    }
                }            
                $penulis = $penulis_arr[$last_key].', '.$temp_depan_penulis;

                if($i == count($penulis_array)-2) {
                    $temp_penulis.= $penulis.' & ';
                }
                else if($i < count($penulis_array)-1) {
                    $temp_penulis.= $penulis.', ';
                }
                else{
                    $temp_penulis.= $penulis;
                }
            }
            else{ //corporate author
                $temp_penulis.= str_replace("-corporate", "", $penulis).'.';
            }
        }
        $temp_penulis = substr($temp_penulis, 0, -1);
        return $temp_penulis;
    }

    function cleanup($content){
        $temp = str_replace(". .", ".", $content);
        return $temp;
    }
}
