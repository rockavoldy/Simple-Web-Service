<?php

class UsersModel extends CI_Model
{
    public function getUsers($nim)
    {
        $this->db->select('id, nim, nama');
        $this->db->from('tb_mahasiswa');
        $this->db->limit(1);
        $this->db->where('nim', $nim);
        $data = $this->db->get();
        return $data->row_array();
    }
}
