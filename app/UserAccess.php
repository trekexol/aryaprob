<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserAccess extends Model
{
   
    protected $connection = 'logins';

    protected $table = 'user_access';

}
