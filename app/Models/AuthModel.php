<?php

namespace App\Models;

use CodeIgniter\Model;
use Exception;

class AuthModel extends Model
{
                  
    public function __construct()
    {

        // $this->group_table = $this->config->item('TBL_GROUPS', 'DB_TABLES');
    }

    public function verify_user($data)
    {
        $db      = \Config\Database::connect();
        $query=$db->query("SELECT * FROM users WHERE mobile_number=$data[mobile] AND password=$data[password]");
        // $res = $query->getResultArray();
        $res = $query->getNumRows();
        if($res==0)
            return false;
        else
            true;

    }

    public function insertToken($data,$token){

        $db      = \Config\Database::connect();
        $query=$db->query("SELECT * FROM users WHERE mobile_number=$data[mobile] AND password=$data[password]");
        $res = $query->getRow();

        $db      = \Config\Database::connect();
        $query=$db->query("INSERT INTO auth_tokens (user_id,user_token) VALUES ('$res->id','$token');");
        return $query;
    }
}
