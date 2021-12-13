<?php

namespace App\Imports;

use App\Client;
use App\ExpensesDetail;
use App\Product;
use Carbon\Carbon;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\SkipsOnError;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithValidation;
use Illuminate\Support\Facades\Auth;

class ClientImport implements ToModel,WithHeadingRow, SkipsOnError
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

        $Client = new Client([
            
            'id'                        => $row['id'],
            'id_vendor'                 => $row['id_vendor'], 
            'id_user'                   => $user->id,
            'type_code'                 => $row['type_code'], 
            'name'                      => $row['name'], 
            'cedula_rif'                => $row['cedula_rif'], 
            'direction'                 => $row['direction'], 
            'city'                      => $row['city'], 
            'country'                   => $row['country'], 
            'phone1'                    => $row['phone1'], 
            'phone2'                    => $row['phone2'], 
            'days_credit'               => $row['days_credit'],
            'amount_max_credit'         => $row['amount_max_credit'], 
            'percentage_retencion_iva'  => $row['percentage_retencion_iva'], 
            'percentage_retencion_islr' => $row['percentage_retencion_islr'],  
            'status'                    => '1',
            'created_at'                => $date,
            'updated_at'                => $date,
        ]);

        $Client->setConnection(Auth::user()->database_name);

        return $Client;

    }

    public function onError(\Throwable $e)
    {
        // Handle the exception how you'd like.
    }
}
