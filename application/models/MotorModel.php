<?php

class MotorModel extends CI_Model
{
    public function getMotor()
    {
        $this->db->select('id, tipe, harga');
        $this->db->from('tb_data_motor');
        $data = $this->db->get();
        return $data->result_array();
    }
}
