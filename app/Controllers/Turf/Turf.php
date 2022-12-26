<?php

namespace App\Controllers\Turf;

use App\Models\Turf\TurfModel;
use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;
use \Firebase\JWT\JWT;

class Turf extends BaseController
{
    use ResponseTrait;

    public function registerTurf(){
        
        $rules = [
            'user_id' => 'required',
            'name' => 'required',
            'address' => 'required',
            'rate' => 'required',
            'events' => 'required',
            'facilities' => 'required',
            'lat' => 'required',
            'lon'=> 'required',
            'available_from_date' => 'required',
            'available_to_date' => 'required',
            'working_hr_from' => 'required',
            'working_hr_to' => 'required'
        ];

        $input = $this->getRequestInput($this->request);
        if ($this->validateRequest($input, $rules)) { 

            $input['events'] = implode(',',$input['events']);
            $input['facilities'] = implode(',',$input['facilities']);
            
            $turfModel = new TurfModel();

            
            if(!empty($input['images'])){
                // md5(uniqid(time()));exit;
                foreach ($input['images'] as $key => $value) {
                    $baseFolder = ROOTPATH .'writable/uploads/turfimages/';
                    if (!file_exists($baseFolder)) {
                        mkdir($baseFolder, 777, true);
                    }
                    $filename = $baseFolder . md5(uniqid(time())) .'.'.explode('/', mime_content_type($value))[1];
                    $data = base64_decode(trim(explode(',', explode(';', $value)[1])[1]));
                    file_put_contents($filename,$data);
                }echo 123;exit;
            }

            // $decoded=base64_decode($base64Image);
            // file_put_contents('newImage.JPG',$decoded);
            if($turfModel->insertTurfDetails($input)){
                $response = [
                    'message' => 'Successfully saved.'
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

    public function getVendorDetails(){
        
        $rules = [
            'user_id' => 'required'
        ];
        $input = $this->request->getGet();
        if ($this->validateRequest($input, $rules)) { 

        }else{
            
        }
        $turfModel = new TurfModel();
        $res = $turfModel->getVendorData();
        $response = [
            'data' => $res,
            'message' => 'Success'
        ];
        return $this->respond($response, 200);

    }

}
