<?php

namespace App\Controllers;

use App\Models\AuthModel;
use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;
use \Firebase\JWT\JWT;

class Login extends BaseController
{
    use ResponseTrait;

    public function login(){
        
        $rules = [
            'mobile' => 'required|min_length[10]',
            'password' => 'required'
        ];
        $input = $this->getRequestInput($this->request);
        if ($this->validateRequest($input, $rules)) {

            $authModel = new AuthModel();
            $res = $authModel->verify_user($input);
            if ($res !== false) {


                $key = "kodombelur";
                $iat = time(); // current timestamp value
                $exp = $iat + 3600;
        
                $payload = array(
                    "iss" => "Dhananjay",
                    "aud" => "Robert",
                    "sub" => "User session",
                    "iat" => $iat, //Time the JWT issued at
                    "exp" => $exp, // Expiration time of token
                    "mobile" => "9496185143",
                );
                
                $token = JWT::encode($payload, $key, 'HS256');

                $response = [
                    'message' => 'Login Succesful',
                    'token' => $token
                ];
                if($authModel->insertToken($input,$token))
                    return $this->respond($response, 200);
            }else{
                $response = [
                    'message' => 'Invalid user',
                ];
                return $this->fail($response, 101);
            }
        }else{
            $response = [
                'errors' => $this->validator->getErrors(),
                'message' => 'Invalid Inputs'
            ];
            return $this->fail($response , 409);
        }

    }

}
