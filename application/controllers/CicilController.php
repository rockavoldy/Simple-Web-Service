<?php
require APPPATH . 'libraries/REST_Controller.php';

class CicilController extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('UsersModel');
        $this->load->model('CicilModel');
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
                $data_cicil = $this->CicilModel->getCicil();
                $response = array(
                    'status' => 200,
                    'message' => 'success'
                );

                foreach ($data_cicil as $cicil) {
                    $response['data'][] = array(
                        'id_cicil' => $cicil['id'],
                        'tenor' => $cicil['lama_cicilan'],
                        'bunga' => $cicil['bunga_cicilan']
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
