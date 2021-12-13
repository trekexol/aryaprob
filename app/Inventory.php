<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Inventory extends Model
{
    protected $fillable = ['id','product_id','id_user','code','amount','status','created_at','updated_at'];


    public function products(){
        return $this->belongsTo('App\Permission\Models\Product','product_id');
    }

    
    
}
