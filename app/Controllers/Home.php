<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;
use \Firebase\JWT\JWT;

class Home extends BaseController
{
    use ResponseTrait;
    
    public function index()
    {
        // echo phpinfo();exit;
        return view('welcome_message');
    }

    public function sample(){

        $key = "123";
        $iat = time(); // current timestamp value
        $exp = $iat + 3600;
 
        $payload = array(
            "iss" => "Dhananjay",
            "aud" => "Robert",
            "sub" => "User session",
            "iat" => $iat, //Time the JWT issued at
            "exp" => $exp, // Expiration time of token
            "email" => "dhananjayranipuram@gmail.com",
        );
         
        $token = JWT::encode($payload, $key, 'HS256');
        $response = [
            'message' => 'Login Succesful',
            'token' => $token
        ];
         
        return $this->respond($response, 200);
        echo $token;exit;
        echo 123;exit;
    }
}
