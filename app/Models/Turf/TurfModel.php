<?php

namespace App\Models\Turf;

use CodeIgniter\Model;
use Exception;

class TurfModel extends Model
{
                  
    public function __construct()
    {

        // $this->group_table = $this->config->item('TBL_GROUPS', 'DB_TABLES');
    }

    public function insertTurfDetails($data)
    {       

        $db      = \Config\Database::connect();
        $db->transStart();


        $sql = "INSERT INTO turf_details (user_id,name,address,rate,events,facilities,available_from_date,available_to_date,working_hr_from,working_hr_to,lat,lon) VALUES ('$data[user_id]','$data[name]','$data[address]','$data[rate]','$data[events]','$data[facilities]','$data[available_from_date]','$data[available_to_date]','$data[working_hr_from]','$data[working_hr_to]','$data[lat]','$data[lon]');";
        $query=$db->query($sql);
        $turf_id = $db->insertId();
        
        $sql = "INSERT INTO turf_details_images (turf_id,image_link) VALUES ";
        foreach($data['image_link'] as $key=>$value){
            $sql .= "($turf_id,'$value')".",";
        }
        $sql = trim($sql,',');
        $query=$db->query($sql);

        $db->transComplete();
        if ($db->transStatus() === FALSE) {
            $db->transRollback();
            return FALSE;
        } 
        else {
            $db->transCommit();
            return TRUE;
        }

    }

    public function getVendorData($data){
        $db      = \Config\Database::connect();
        $sql = "SELECT 
                    id,
                    user_id,
                    name,
                    address,
                    rate,
                    events,
                    facilities,
                    available_from_date,
                    available_to_date,
                    working_hr_from,
                    working_hr_to
                FROM
                    turf_details
                where
                    user_id = $data[user_id]";
        $query=$db->query($sql);
        $res = $query->getRow();
        return $res;
    }

    public function getTurfData($data){
        $db      = \Config\Database::connect();
        $lat = $data['lon'];
        $lon = $data['lat'];
        $sql = "SELECT 
                    id,
                    user_id,
                    name,
                    address,
                    rate,
                    events,
                    facilities,
                    available_from_date,
                    available_to_date,
                    working_hr_from,
                    working_hr_to,
                    (3959 * ACOS(COS(RADIANS($lat)) * COS(RADIANS(lat)) * COS(RADIANS(lon) - RADIANS($lon)) + SIN(RADIANS($lat)) * SIN(RADIANS(lat)))) AS distance
                FROM
                    turf_details
                HAVING distance < 50
                ORDER BY distance";
        $query=$db->query($sql);
        $res = $query->getRow();
        return $res;
    }
}
