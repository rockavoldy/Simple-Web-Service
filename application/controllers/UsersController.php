<?php
require APPPATH . 'libraries/REST_Controller.php';

class UsersController extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('UsersModel');
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
                $response = array(
                    'status' => 200,
                    'message' => 'success',
                    'data' => array(
                        'NIM' => $nimExist['nim'],
                        'Nama' => $nimExist['nama']
                    )
                );
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
