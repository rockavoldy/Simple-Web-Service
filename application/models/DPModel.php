<?php

class DPModel extends CI_Model
{
    public function getUangMuka()
    {
        $this->db->select('id, uang_muka');
        $this->db->from('tb_data_dp');
        $data = $this->db->get();
        return $data->result_array();
    }
}
