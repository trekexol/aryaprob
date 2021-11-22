<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HistorialExpense extends Model
{
    public function expenses(){
        return $this->belongsTo('App\ExpensesAndPurchase','id_expense');
    }

    public function users(){
        return $this->belongsTo('App\User','id_user');
    }
}
