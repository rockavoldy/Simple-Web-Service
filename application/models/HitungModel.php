<?php

class HitungModel extends CI_Model
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

    public function getAllByUser($nim)
    {
        $this->db->select('tb_perhitungan.id as id_hitung, tb_mahasiswa.id as id_user, tb_data_motor.tipe as tipe_motor, tb_data_motor.harga as harga_motor');
        $this->db->select('tb_data_cicilan.lama_cicilan as tenor, tb_data_dp.uang_muka as uang_muka');
        $this->db->select('tb_perhitungan.pokok as pokok, tb_perhitungan.bunga as bunga, tb_perhitungan.total as total');
        $this->db->from('tb_mahasiswa');
        $this->db->join('tb_perhitungan', 'tb_mahasiswa.id = tb_perhitungan.id_user', 'left');
        $this->db->join('tb_data_motor', 'tb_perhitungan.id_motor = tb_data_motor.id');
        $this->db->join('tb_data_cicilan', 'tb_perhitungan.id_cicilan = tb_data_cicilan.id');
        $this->db->join('tb_data_dp', 'tb_perhitungan.id_dp = tb_data_dp.id');
        $this->db->where('tb_mahasiswa.nim', $nim);
        $data = $this->db->get();
        return $data->result_array();
    }

    public function postHitung($data)
    {
        if (!$data) {
            return $this->emptyResponse();
        }

        $status = $this->db->insert('tb_perhitungan', $data);
        if ($status) {
            return true;
        } else {
            return false;
        }
    }

    public function updateHitung($id, $data)
    {
        if (!$data || !$id) {
            return $this->emptyResponse();
        }

        $this->db->where('id', $id);
        $status = $this->db->update('tb_perhitungan', $data);
        if ($status) {
            return true;
        } else {
            return false;
        }
    }

    public function deleteHitung($id)
    {
        if (!$id) {
            return $this->emptyResponse();
        }

        $this->db->where('id', $id);
        $status = $this->db->delete('tb_perhitungan');
        if ($this->db->affected_rows() > 0) {
            return true;
        } else {
            return false;
        }
    }
}
