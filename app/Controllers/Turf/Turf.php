<?php

namespace App\Controllers\Turf;

use App\Models\Turf\TurfModel;
use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;
use \Firebase\JWT\JWT;

class Turf extends BaseController
{
    use ResponseTrait;

    public function __construct()
    {
        $this->turfModel = new \App\Models\Turf\TurfModel();
    }

    public function registerTurf(){
        try{
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

                $input['image_link'] = [];
                if(!empty($input['images'])){
                    // md5(uniqid(time()));exit;
                    foreach ($input['images'] as $key => $value) {
                        $baseFolder = WRITEPATH .'uploads/turfimages/';
                        if (!file_exists($baseFolder)) {
                            mkdir($baseFolder, 777, true);
                        }
                        $filename = $baseFolder . md5(uniqid(time())) .'.'.explode('/', mime_content_type($value))[1];
                        $data = base64_decode(trim(explode(',', explode(';', $value)[1])[1]));
                        file_put_contents($filename,$data);
                        array_push($input['image_link'],str_replace("\\",'/',$filename));
                    }
                }
                // print_r($input['image_link']);exit;
                if($this->turfModel->insertTurfDetails($input)){
                    $response = [
                        'code' => 200,
                        'message' => 'Successfully saved.'
                    ];
                    return $this->respond($response, 200);
                }else{
                    $response = [
                        'code' => 403,
                        'message' => 'User already exist',
                    ];
                    return $this->respond($response, 403);
                }
            }else{
                $response = [
                    'code' => 409,
                    'errors' => $this->validator->getErrors(),
                    'message' => 'Invalid Inputs'
                ];
                return $this->respond($response , 200);
            }
        }catch(Exception $e){
            $response = [
                'code' => 500,
                'errors' => $e,
                'message' => 'Something went wrong.'
            ];
            return $this->respond($response , 200);
        }

    }

    public function getVendorDetails(){
        try{
            $rules = [
                'user_id' => 'required'
            ];
            $input = $this->getRequestInput($this->request);
            if ($this->validateRequest($input, $rules)) { 
                $res = $this->turfModel->getVendorData($input);
                $eventInput = "'".str_replace(",","','",$res->events)."'";
                $facilitiesInput = "'".str_replace(",","','",$res->facilities)."'";
                $res->facilities = $this->turfModel->getfacilitiesData($facilitiesInput);
                $res->images = $this->turfModel->getTurfImages($res->id);
                $res->events = $this->turfModel->geteventsData($eventInput);
                
                $response = [
                    'data' => $res,
                    'message' => 'Success'
                ];
            }else{
                $response = [
                    'data' => $res,
                    'message' => 'No record found.'
                ];
            }
            
            return $this->respond($response, 200);

        }catch(Exception $e){
            $response = [
                'code' => 500,
                'errors' => $e,
                'message' => 'Something went wrong.'
            ];
            return $this->respond($response , 500);
        }

    }

    public function getTurfSearch(){
        try{
            $rules = [
                'lat' => 'required',
                'lon' => 'required'
            ];
            $input = $this->getRequestInput($this->request);
            if ($this->validateRequest($input, $rules)) { 
                $res = $this->turfModel->getTurfData($input);
                if(!empty($res)){
                    $eventInput = "'".str_replace(",","','",$res->events)."'";
                    $facilitiesInput = "'".str_replace(",","','",$res->facilities)."'";
                    $res->facilities = $this->turfModel->getfacilitiesData($facilitiesInput);
                    $res->images = $this->turfModel->getTurfImages($res->id);
                    $res->events = $this->turfModel->geteventsData($eventInput);
                    $response = [
                        'data' => $res,
                        'message' => 'Success'
                    ];
                }else{
                    $response = [
                        'data' => [],
                        'message' => 'No record found.'
                    ];
                }
                
            }else{
                $response = [
                    'data' => [],
                    'message' => 'Invalid inputs.'
                ];
            }
            
            return $this->respond($response, 200);
            
        }catch(Exception $e){
            $response = [
                'code' => 500,
                'errors' => $e,
                'message' => 'Something went wrong.'
            ];
            return $this->respond($response , 200);
        }

    }

}
