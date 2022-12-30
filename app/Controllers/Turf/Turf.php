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
        // try{
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

            // $input = $this->getRequestInput($this->request);
            if (1) { 

                // $input['events'] = implode(',',$input['events']);
                // $input['facilities'] = implode(',',$input['facilities']);

                // $input['image_link'] = [];
                // if(!empty($input['images'])){
                //     // md5(uniqid(time()));exit;
                //     foreach ($input['images'] as $key => $value) {
                //         $baseFolder = WRITEPATH .'uploads/turfimages/';
                //         if (!file_exists($baseFolder)) {
                //             mkdir($baseFolder, 777, true);
                //         }
                //         $filename = $baseFolder . md5(uniqid(time())) .'.'.explode('/', mime_content_type($value))[1];
                //         $data = base64_decode(trim(explode(',', explode(';', $value)[1])[1]));
                //         file_put_contents($filename,$data);
                //         array_push($input['image_link'],str_replace("\\",'/',$filename));
                //     }
                // }
                // print_r($input);exit;
                
                $input = array(
                    'user_id' => "3",
                    'name' => "ST FransisTurf",
                    'address' => "ABC Building,lorem street",
                    'rate' => "150",
                    'events' => "E1,E2,E3",
                    'facilities' => "F1,F2,F3",
                    'lat' => "10.011104",
                    'lon' => "76.343877",
                    'available_from_date' => "2022-12-02",
                    'available_to_date' => "2023-12-31",
                    'working_hr_from' => "06:00:00",
                    'working_hr_to' => "12:30:00",
                    'image_link' => [
                            "C:/wamp64/www/iturf/writable/uploads/turfimages/3f3fde8c2ff3ff59bc7125ec90f51925.jpeg",
                            "C:/wamp64/www/iturf/writable/uploads/turfimages/c10bd594c366ac2ca56f535c762d9f36.jpeg"
                        ]
                );

                // print_r($input);exit;


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
        // }catch(Exception $e){
        //     $response = [
        //         'code' => 500,
        //         'errors' => $e,
        //         'message' => 'Something went wrong.'
        //     ];
        //     return $this->respond($response , 200);
        // }

    }

    public function getVendorDetails(){
        try{
            $rules = [
                'user_id' => 'required'
            ];
            $input = $this->getRequestInput($this->request);
            if ($this->validateRequest($input, $rules)) { 
                $res = $this->turfModel->getVendorData($input);
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
