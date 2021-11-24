<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class QuotationPayment extends Model
{
    public function accounts(){
        return $this->belongsTo('App\Permission\Models\Account','id_account');
    }

    public function quotations(){
        return $this->belongsTo('App\Quotation','id_quoation');
    }
}
