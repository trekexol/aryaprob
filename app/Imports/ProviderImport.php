<?php

namespace App\Imports;

use App\Client;
use App\ExpensesDetail;
use App\Product;
use App\Provider;
use Carbon\Carbon;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\SkipsOnError;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithValidation;
use Illuminate\Support\Facades\Auth;

class ProviderImport implements ToModel,WithHeadingRow, SkipsOnError
{
    use Importable;
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        $user       =   auth()->user();
        $date = Carbon::now();

       
        $Provider = new Provider([
            
            'id'                        => $row['id'],
            'code_provider'             => $row['code_provider'], 
            'razon_social'              => $row['razon_social'], 
            'direction'                 => $row['direction'], 
            'city'                      => $row['city'], 
            'country'                   => $row['country'], 
            'phone1'                    => $row['phone1'], 
            'phone2'                    => $row['phone2'], 
            'has_credit'                => $row['has_credit'],
            'days_credit'               => $row['days_credit'],
            'amount_max_credit'         => $row['amount_max_credit'], 
            'porc_retencion_iva'        => $row['porc_retencion_iva'], 
            'porc_retencion_islr'       => $row['porc_retencion_islr'],  
            'balance'                   => $row['balance'],  
            'status'                    => '1',
            'created_at'                => $date,
            'updated_at'                => $date,
        ]);

        $Provider->setConnection(Auth::user()->database_name);

        return $Provider;

    }

    public function onError(\Throwable $e)
    {
        // Handle the exception how you'd like.
    }
}
