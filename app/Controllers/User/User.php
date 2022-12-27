<?php

namespace App\Controllers\User;

use App\Models\User\AuthModel;
use App\Models\User\AvatarModel;
use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;
use \Firebase\JWT\JWT;

class User extends BaseController
{
    use ResponseTrait;

    public function __construct()
    {
        // $this->auth = new AuthModel();
        $this->auth = new \App\Models\User\AuthModel();
    }

    public function login(){
        
        try{
            $rules = [
                'mobile' => 'required|min_length[10]',
                'password' => 'required'
            ];
            $input = $this->getRequestInput($this->request);

            if ($this->validateRequest($input, $rules)) {
                $res = $this->auth->verify_user($input);
                // print_r($res);exit;
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
                        'code' => 200,
                        'message' => 'Login Succesful',
                        'token' => $token
                    ];
                    if($this->auth->insertToken($input,$token))
                        return $this->respond($response, 200);
                }else{
                    $response = [
                        'code' => 401,
                        'message' => 'Invalid user',
                    ];
                    return $this->respond($response, 401);
                }
            }else{
                $response = [
                    'code' => 409,
                    'errors' => $this->validator->getErrors(),
                    'message' => 'Invalid Inputs'
                ];
                return $this->respond($response , 409);
            }
        }catch(Exception $e){
            $response = [
                'code' => 500,
                'errors' => $e,
                'message' => 'Something went wrong.'
            ];
            return $this->respond($response , 500);
        }

    }

    public function getAvatar(){
        
        $authModel = new AvatarModel();
        $res = $authModel->getAvatar();
        $response = [
            'code' => 200,
            'data' => $res,
            'message' => 'Success'
        ];
        return $this->respond($response, 200);

    }

    public function register(){
        
        $rules = [
            'name' => 'required',
            'mobile' => 'required|min_length[10]',
            'user_name' => 'required',
            'address' => 'required',
            'district' => 'required',
            'user_type'=> 'required',
            'pincode' => 'required|min_length[6]',
            'avatar' => 'required',
            'password' => 'required|min_length[8]'
        ];

        $input = $this->getRequestInput($this->request);
        if ($this->validateRequest($input, $rules)) {
            
            $inputData = [];
            $inputData['name'] = $input['name']; 
            $inputData['mobile_number'] = $input['mobile']; 
            $inputData['user_name'] = $input['user_name']; 
            $inputData['user_type'] = $input['user_type']; 
            $inputData['address'] = $input['address']; 
            $inputData['district'] = $input['district']; 
            $inputData['pin_code'] = $input['pincode']; 
            $inputData['avatar'] = $input['avatar']; 
            $inputData['password'] = $input['password']; 

            $authModel = new AuthModel();
            $res = $this->auth->insertUser($inputData);
            if($res){
                $response = [
                    'status' => 200,
                    'message' => 'Successfully saved.',
                    'user_id' => $res
                ];
                return $this->respond($response, 200);
            }else{
                $response = [
                    'message' => 'User already exist',
                ];
                return $this->fail($response, 403);
            }
        }else{
            $response = [
                'errors' => $this->validator->getErrors(),
                'message' => 'Invalid Inputs'
            ];
            return $this->fail($response , 409);
        }

    }

    public function sendOtp(){

        $response = [
            'message' => 'Success'
        ];
        return $this->respond($response, 200);
    }

    public function verifyOtp(){

        $res = [];
        $res = 'valid otp';
        $response = [
            'data' => $res,
            'message' => 'Success'
        ];
        return $this->respond($response, 200);
    }

}
