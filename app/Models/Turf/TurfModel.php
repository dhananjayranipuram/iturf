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
        $sql = "INSERT INTO turf_details (user_id,name,address,rate,events,facilities,available_from_date,available_to_date,working_hr_from,working_hr_to,lat,lon) VALUES ('$data[user_id]','$data[name]','$data[address]','$data[rate]','$data[events]','$data[facilities]','$data[available_from_date]','$data[available_to_date]','$data[working_hr_from]','$data[working_hr_to]','$data[lat]','$data[lon]');";
        $query=$db->query($sql);
        return $query;
    }

    public function getVendorData(){
       
    }
}
