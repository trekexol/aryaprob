<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HistorialAnticipo extends Model
{
    public function anticipos(){
        return $this->belongsTo('App\Anticipo','id_anticipo');
    }

    public function users(){
        return $this->belongsTo('App\User','id_user');
    }
}
