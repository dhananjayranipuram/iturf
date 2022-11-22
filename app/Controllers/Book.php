<?php

namespace App\Controllers;

use App\Models\AuthModel;
use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;
use \Firebase\JWT\JWT;

class Book extends BaseController
{
    use ResponseTrait;

    public function book(){
        // $header = $this->request->getServer('HTTP_AUTHORIZATION');

        // if(!$header) return $this->failUnauthorized('Token Required');
        // print_r($header);exit;
        echo 123;exit;
    }

}
