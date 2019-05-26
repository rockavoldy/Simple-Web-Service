<?php
require APPPATH . 'libraries/REST_Controller.php';

class DPController extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('UsersModel');
        $this->load->model('DPModel');
    }

    public function index_get()
    {
        if (isset($_SERVER['HTTP_X_NIM'])) {
            $nim = $_SERVER['HTTP_X_NIM'];
        } else {
            $nim = false;
            $response = array(
                'status' => 403,
                'error' => true,
                'message' => 'Tidak semudah itu fergusso !'
            );
        }
        if ($nim) {
            $nimExist = $this->UsersModel->getUsers($nim);
            if ($nimExist) {
                $data_uang_muka = $this->DPModel->getUangMuka();
                $response = array(
                    'status' => 200,
                    'message' => 'success'
                );

                foreach ($data_uang_muka as $uang_muka) {
                    $response['data'][] = array(
                        'id_uang_muka' => $uang_muka['id'],
                        'uang_muka' => $uang_muka['uang_muka']
                    );
                }
            } else {
                $response = array(
                    'status' => 401,
                    'error' => true,
                    'message' => 'NIM Anda tidak terdaftar, jika ini adalah kesalahan, silahkan hubungi asisten.'
                );
            }
        }

        $this->response($response, $response['status']);
    }
}
