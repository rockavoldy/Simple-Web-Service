<?php

class CicilModel extends CI_Model
{
    private function emptyResponse()
    {
        $response = array(
            'status' => 502,
            'error' => true,
            'message' => 'Field tidak boleh kosong!'
        );

        return $response;
    }

    public function getCicil()
    {
        $this->db->select('id, lama_cicilan, bunga_cicilan');
        $this->db->from('tb_data_cicilan');
        $data = $this->db->get();
        return $data->result_array();
    }
}
