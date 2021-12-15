<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Account extends Model
{
    protected $fillable = ['id','code_one','code_two','code_three',
    'code_four','code_five','period','description','type','level',
    'balance_previus','rate','coin','status','created_at','updated_at'];

    public function accounthistorial()
    {
        return $this->hasMany('App\AccountHistorial');
    }
}
