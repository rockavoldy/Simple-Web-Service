<?php
require APPPATH . 'libraries/REST_Controller.php';

class HitungController extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('UsersModel');
        $this->load->model('HitungModel');
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
                $data_masuk = $this->HitungModel->getAllByUser($nim);
                $response = array(
                    'status' => 200,
                    'message' => 'success'
                );
                $response['data']['nim_sales'] = $nimExist['nim'];
                $response['data']['nama_sales'] = $nimExist['nama'];
                foreach ($data_masuk as $data) {
                    $response['data']['terjual'][] = array(
                        'id_penjualan' => $data['id_hitung'],
                        'tipe_motor' => $data['tipe_motor'],
                        'harga_motor' => $data['harga_motor'],
                        'tenor' => $data['tenor'],
                        'uang_muka' => $data['uang_muka'],
                        'cicilan_pokok' => $data['pokok'],
                        'cicilan_bunga' => $data['bunga'],
                        'cicilan_total' => $data['total']
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

    public function index_post()
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
                $this->form_validation->set_rules('id_motor', 'ID Motor', 'required', array('required' => '%s harus ada !'));
                $this->form_validation->set_rules('id_cicil', 'ID Cicilan', 'required', array('required' => '%s harus ada !'));
                $this->form_validation->set_rules('id_uang_muka', 'ID Uang Muka', 'required', array('required' => '%s harus ada !'));
                $this->form_validation->set_rules('cicilan_pokok', 'Pokok Cicilan', 'required', array('required' => '%s harus ada !'));
                $this->form_validation->set_rules('cicilan_bunga', 'Bunga Cicilan', 'required', array('required' => '%s harus ada !'));
                $this->form_validation->set_rules('cicilan_total', 'Total Cicilan', 'required', array('required' => '%s harus ada !'));
                if ($this->form_validation->run() == FALSE) {
                    $response = array(
                        'status' => 403,
                        'error' => true,
                        'message' => validation_errors()
                    );
                } else {
                    $data['id_user'] = $nimExist['id'];
                    $data['id_motor'] = $this->post('id_motor', true);
                    $data['id_cicilan'] = $this->post('id_cicil', true);
                    $data['id_dp'] = $this->post('id_uang_muka', true);
                    $data['pokok'] = $this->post('cicilan_pokok', true);
                    $data['bunga'] = $this->post('cicilan_bunga', true);
                    $data['total'] = $this->post('cicilan_total', true);

                    if ($this->HitungModel->postHitung($data)) {
                        $response = array(
                            'status' => 201,
                            'message' => 'Berhasil disimpan !'
                        );
                    } else {
                        $response = array(
                            'status' => 400,
                            'error' => true,
                            'message' => 'Gagal disimpan !'
                        );
                    }
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

    public function index_put($id_hitung)
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
                // $id_hitung = $this->get('id');
                // $data['id_user'] = $nimExist['id'];
                if ($this->put('id_motor') !== null) {
                    $data['id_motor'] = $this->put('id_motor');
                }

                if ($this->put('id_cicil') !== null) {
                    $data['id_cicilan'] = $this->put('id_cicil');
                }

                if ($this->put('id_uang_muka') !== null) {
                    $data['id_dp'] = $this->put('id_uang_muka');
                }

                if ($this->put('cicilan_pokok') !== null) {
                    $data['pokok'] = $this->put('cicilan_pokok');
                }

                if ($this->put('cicilan_bunga') !== null) {
                    $data['bunga'] = $this->put('cicilan_bunga');
                }

                if ($this->put('cicilan_total') !== null) {
                    $data['total'] = $this->put('cicilan_total');
                }

                if ($this->HitungModel->updateHitung($id_hitung, $data)) {
                    $response = array(
                        'status' => 201,
                        'message' => 'Berhasil diupdate !'
                    );
                } else {
                    $response = array(
                        'status' => 400,
                        'error' => true,
                        'message' => 'Gagal diupdate !'
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

    public function index_delete($id_hitung)
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
                if ($this->HitungModel->deleteHitung($id_hitung)) {
                    $response = array(
                        'status' => 200,
                        'message' => 'Berhasil dihapus !'
                    );
                } else {
                    $response = array(
                        'status' => 400,
                        'message' => 'Gagal dihapus !'
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
