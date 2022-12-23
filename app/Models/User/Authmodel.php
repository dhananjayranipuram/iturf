<?php

namespace App\Models\User;

use CodeIgniter\Model;
use Exception;

class AuthModel extends Model
{
                  
    public function __construct()
    {
        echo 123;exit;
        $conn = new mysqli('iturf.cumgvnhqdtiz.ap-south-1.rds.amazonaws.com', 'iturfnew', 'Dhananjay123');
        print_r($conn);exit;
        // $this->group_table = $this->config->item('TBL_GROUPS', 'DB_TABLES');
    }

    public function verify_user($data)
    {
        $db      = \Config\Database::connect();
        print_r($db);exit;
        $query=$db->query("SELECT * FROM users WHERE mobile_number=$data[mobile] AND password=$data[password]");
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

    public function insertUser($data){

        $db      = \Config\Database::connect();
        $query=$db->query("SELECT name FROM users WHERE mobile_number=$data[mobile_number]");
        if($query->getNumRows()<1){
            $db      = \Config\Database::connect();
            $sql = "INSERT INTO users (name,user_name,mobile_number,password,user_type,district,address,pin_code,avatar) VALUES ('$data[name]','$data[user_name]','$data[mobile_number]','$data[password]','$data[user_type]','$data[district]','$data[address]','$data[pin_code]','$data[avatar]' ) ;";

            $query=$db->query($sql);
            $user_id = $db->insertId();
            return $user_id;
        }else{
            return false;
        }
    }
}
