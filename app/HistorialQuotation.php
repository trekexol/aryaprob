<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HistorialQuotation extends Model
{
    public function quotations(){
        return $this->belongsTo('App\Quotation','id_quotation');
    }

    public function users(){
        return $this->belongsTo('App\User','id_user');
    }
}
