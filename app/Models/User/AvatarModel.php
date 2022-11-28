<?php

namespace App\Models\User;

use CodeIgniter\Model;
use Exception;

class AvatarModel extends Model
{
                  
    public function __construct()
    {

        // $this->group_table = $this->config->item('TBL_GROUPS', 'DB_TABLES');
    }

    public function getAvatar()
    {
        $db      = \Config\Database::connect();
        $query=$db->query("SELECT 'id','name','image' FROM avatars WHERE active=1");
        $res = $query->getResultArray();
        return $res;
    }
}
