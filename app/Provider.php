<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Provider extends Model
{
    protected $fillable = ['id','code_provider','razon_social','direction',
    'city','country','phone1','phone2','has_credit','days_credit',
    'amount_max_credit','porc_retencion_iva','porc_retencion_islr',
    'balance','status','created_at','updated_at'];

    public function anticipo(){
        return $this->hasMany('App\Anticipo');
    }
}
