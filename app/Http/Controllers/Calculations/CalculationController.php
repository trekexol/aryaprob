<?php

namespace App\Http\Controllers\Calculations;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App;
use App\Account;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class CalculationController extends Controller
{
    public function calculate_account($account,$coin,$date_begin,$date_end){
       
        if(isset($coin) && $coin == 'bolivares'){
            return $this->verificateAccount($account,$date_begin,$date_end);
        }else{
            return $this->verificateAccountDolar($account,$date_begin,$date_end);
        }
    }

    public function calculate_account_all($account,$coin){
       
        if(isset($coin) && $coin == 'bolivares'){
            return $this->verificateAccountAll($account);
        }else{
            return $this->verificateAccountDolarAll($account);
        }
    }
    
    public function verificateAccount($account,$date_begin,$date_end)
    {

        if($account->code_one != 0)
        {                      
            if($account->code_two != 0)
            {
                if($account->code_three != 0)
                {
                    if($account->code_four != 0)
                    {
                        if($account->code_five != 0)
                        {
                                    //Calculo de superavit
                                    if(($account->code_one == 3) && ($account->code_two == 2) && ($account->code_three == 1) && 
                                    ($account->code_four == 1) && ($account->code_five == 1) ){
                                        $account = $this->calculation_superavit($account,4,'bolivares',$date_begin,$date_end);
                                    }else{
                                        /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */                                                   
                                        $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                        ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                        ->where('accounts.code_one', $account->code_one)
                                        ->where('accounts.code_two', $account->code_two)
                                        ->where('accounts.code_three', $account->code_three)
                                        ->where('accounts.code_four', $account->code_four)
                                        ->where('accounts.code_five', $account->code_five)
                                        ->where('detail_vouchers.status', 'C')
                    
                                        ->whereRaw(
                                        "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                        [$date_begin, $date_end])
                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();
                                        
                                    

                                        $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                        ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                        ->where('accounts.code_one', $account->code_one)
                                        ->where('accounts.code_two', $account->code_two)
                                        ->where('accounts.code_three', $account->code_three)
                                        ->where('accounts.code_four', $account->code_four)
                                        ->where('accounts.code_five', $account->code_five)
                                        ->where('detail_vouchers.status', 'C')
                    
                                        ->whereRaw(
                                        "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                        [$date_begin, $date_end])
                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(haber) as total'))->first();   

                                        
                                        /*---------------------------------------------------*/

                                

                                        $account->debe = $total_debe->total;
                                        $account->haber = $total_haber->total;
                                    }
                                }else
                                {
                                    if(($account->code_one == 3) && ($account->code_two == 2) && ($account->code_three == 1) && 
                                    ($account->code_four == 1)){
                                        $account = $this->calculation_superavit($account,4,'bolivares',$date_begin,$date_end);
                                    }else{
                                            /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */                                                   
                                            $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                                ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                                ->where('accounts.code_one', $account->code_one)
                                                                ->where('accounts.code_two', $account->code_two)
                                                                ->where('accounts.code_three', $account->code_three)
                                                                ->where('accounts.code_four', $account->code_four)
                                                                ->where('detail_vouchers.status', 'C')
                                            
                                                                ->whereRaw(
                                            "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                            [$date_begin, $date_end])
                                                                ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();
            
                                            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                                ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                                ->where('accounts.code_one', $account->code_one)
                                                                ->where('accounts.code_two', $account->code_two)
                                                                ->where('accounts.code_three', $account->code_three)
                                                                ->where('accounts.code_four', $account->code_four)
                                                                ->where('detail_vouchers.status', 'C')
                                            
                                                                ->whereRaw(
                                            "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                            [$date_begin, $date_end])
                                                                ->select(DB::connection(Auth::user()->database_name)->raw('SUM(haber) as total'))->first();   

                                            $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                ->where('accounts.code_one', $account->code_one)
                                                                ->where('accounts.code_two', $account->code_two)
                                                                ->where('accounts.code_three', $account->code_three)
                                                                ->where('accounts.code_four', $account->code_four)
                                                                ->sum('balance_previus');   
                                            /*---------------------------------------------------*/

                                

                                            $account->debe = $total_debe->total;
                                            $account->haber = $total_haber->total;
                                            $account->balance_previus = $total_balance;

                                        }
                                    }                          

                            }else{
                            
                                if(($account->code_one == 3) && ($account->code_two == 2) && ($account->code_three == 1)){
                                    $account = $this->calculation_superavit($account,4,'bolivares',$date_begin,$date_end);
                                }else{
                        
                                    /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */ 
                                        $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                        ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                        ->where('accounts.code_one', $account->code_one)
                                                        ->where('accounts.code_two', $account->code_two)
                                                        ->where('accounts.code_three', $account->code_three)
                                                        ->where('detail_vouchers.status', 'C')
                                    
                                                        ->whereRaw(
                                                        "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                                        [$date_begin, $date_end])
                                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();
                
                                        $total_haber =  DB::connection(Auth::user()->database_name)->table('accounts')
                                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                        ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                        ->where('accounts.code_one', $account->code_one)
                                                        ->where('accounts.code_two', $account->code_two)
                                                        ->where('accounts.code_three', $account->code_three)
                                                        ->where('detail_vouchers.status', 'C')
                                                        ->whereRaw(
                                                        "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                                        [$date_begin, $date_end])
                                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(haber) as total'))->first();    
                                                        
                                                        $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                                        ->where('accounts.code_one', $account->code_one)
                                                        ->where('accounts.code_two', $account->code_two)
                                                        ->where('accounts.code_three', $account->code_three)
                                                        ->sum('balance_previus');   
                                    /*---------------------------------------------------*/                               
            
                                    
            
                                    $account->debe = $total_debe->total;
                                    $account->haber = $total_haber->total;      
                                    $account->balance_previus = $total_balance;
                                
                                }
                                }
                }else{
                    
                    if(($account->code_one == 3) && ($account->code_two == 2)){
                        $account = $this->calculation_superavit($account,4,'bolivares',$date_begin,$date_end);
                    }else{
                        /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */                                   
                            $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                            ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                            ->where('accounts.code_one', $account->code_one)
                                                            ->where('accounts.code_two', $account->code_two)
                                                            ->where('detail_vouchers.status', 'C')
                                                            ->whereRaw(
                                                            "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                                            [$date_begin, $date_end])
                                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();

                        
                            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                            ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                            ->where('accounts.code_one', $account->code_one)
                                                            ->where('accounts.code_two', $account->code_two)
                                                            ->where('detail_vouchers.status', 'C')
                                                            ->whereRaw(
                                                            "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                                            [$date_begin, $date_end])
                                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(haber) as total'))->first();

                            $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                                            ->where('accounts.code_one', $account->code_one)
                                                            ->where('accounts.code_two', $account->code_two)
                                                            ->sum('balance_previus'); 
                        /*---------------------------------------------------*/
                        
                        $account->debe = $total_debe->total;
                        $account->haber = $total_haber->total;
                        $account->balance_previus = $total_balance;
                    }                                       
                }
            }else{
                
            //Cuentas NIVEL 2 EJEMPLO 1.0.0.0
            /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */
            if($account->code_one == 3){
                $account = $this->calculation_capital($account,'bolivares',$date_begin,$date_end);

            }else{
                $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                            ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                            ->where('accounts.code_one', $account->code_one)
                                            ->where('detail_vouchers.status', 'C')
                                            ->whereRaw(
                                            "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                            [$date_begin, $date_end])
                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();



                $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                            ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                            ->where('accounts.code_one', $account->code_one)
                                            ->where('detail_vouchers.status', 'C')
                                            ->whereRaw(
                                            "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                            [$date_begin, $date_end])
                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(haber) as total'))->first();
                $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                            ->where('accounts.code_one', $account->code_one)
                                            ->sum('balance_previus'); 
                /*---------------------------------------------------*/
                                           

                $account->debe = $total_debe->total;
                $account->haber = $total_haber->total;           
                $account->balance_previus = $total_balance;
                
            }
            }

            $account_new = new Account();
            
            $account_new->debe = $account->debe;
            $account_new->haber = $account->haber;           
            $account_new->balance_previus = $account->balance_previus;

            return $account_new;
        }else{
            return redirect('/accounts')->withDanger('El codigo uno es igual a cero!');
        }
    }

    public function verificateAccountDolar($account,$date_begin,$date_end)
    {

        if($account->code_one != 0)
        {                      
            if($account->code_two != 0)
            {
                if($account->code_three != 0)
                {
                    if($account->code_four != 0)
                    {
                        if($account->code_five != 0)
                        {
                                    //Calculo de superavit
                                    if(($account->code_one == 3) && ($account->code_two == 2) && ($account->code_three == 1) && 
                                    ($account->code_four == 1) && ($account->code_five == 1) ){
                                        $account = $this->calculation_superavit($account,4,'dolares',$date_begin,$date_end);
                                    }else{
                                        /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */                                                   
                                        $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                        ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                        ->where('accounts.code_one', $account->code_one)
                                        ->where('accounts.code_two', $account->code_two)
                                        ->where('accounts.code_three', $account->code_three)
                                        ->where('accounts.code_four', $account->code_four)
                                        ->where('accounts.code_five', $account->code_five)
                                        ->where('detail_vouchers.status', 'C')
                                        ->whereRaw(
                                        "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                        [$date_begin, $date_end])
                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.debe/detail_vouchers.tasa) as total'))->first();
                                        
                                    

                                        $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                        ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                        ->where('accounts.code_one', $account->code_one)
                                        ->where('accounts.code_two', $account->code_two)
                                        ->where('accounts.code_three', $account->code_three)
                                        ->where('accounts.code_four', $account->code_four)
                                        ->where('accounts.code_five', $account->code_five)
                                        ->where('detail_vouchers.status', 'C')
                                        ->whereRaw(
                                        "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                        [$date_begin, $date_end])
                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.haber/detail_vouchers.tasa) as total'))->first();   

                                        
                                        /*---------------------------------------------------*/

                                

                                        $account->debe = $total_debe->total;
                                        $account->haber = $total_haber->total;
                                    }
                                }else
                                {
                                    if(($account->code_one == 3) && ($account->code_two == 2) && ($account->code_three == 1) && 
                                    ($account->code_four == 1)){
                                        $account = $this->calculation_superavit($account,4,'dolares',$date_begin,$date_end);
                                    }else{
                                            /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */                                                   
                                            $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                                ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                                ->where('accounts.code_one', $account->code_one)
                                                                ->where('accounts.code_two', $account->code_two)
                                                                ->where('accounts.code_three', $account->code_three)
                                                                ->where('accounts.code_four', $account->code_four)
                                                                ->where('detail_vouchers.status', 'C')
                                                                ->whereRaw(
                                            "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                            [$date_begin, $date_end])
                                                                ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.debe/detail_vouchers.tasa) as total'))->first();
            
                                            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                                ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                                ->where('accounts.code_one', $account->code_one)
                                                                ->where('accounts.code_two', $account->code_two)
                                                                ->where('accounts.code_three', $account->code_three)
                                                                ->where('accounts.code_four', $account->code_four)
                                                                ->where('detail_vouchers.status', 'C')
                                                                ->whereRaw(
                                            "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                            [$date_begin, $date_end])
                                                                ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.haber/detail_vouchers.tasa) as total'))->first();   

                                            $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                ->where('accounts.code_one', $account->code_one)
                                                                ->where('accounts.code_two', $account->code_two)
                                                                ->where('accounts.code_three', $account->code_three)
                                                                ->where('accounts.code_four', $account->code_four)
                                                                ->select(DB::connection(Auth::user()->database_name)->raw('SUM(balance_previus/rate) as total'))->first(); 
                                            /*---------------------------------------------------*/

                                

                                            $account->debe = $total_debe->total;
                                            $account->haber = $total_haber->total;
                                            $account->balance_previus = $total_balance->total;

                                        }
                                    }                          

                            }else{
                            
                                if(($account->code_one == 3) && ($account->code_two == 2) && ($account->code_three == 1)){
                                    $account = $this->calculation_superavit($account,4,'dolares',$date_begin,$date_end);
                                }else{
                        
                                    /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */ 
                                        $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                        ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                        ->where('accounts.code_one', $account->code_one)
                                                        ->where('accounts.code_two', $account->code_two)
                                                        ->where('accounts.code_three', $account->code_three)
                                                        ->where('detail_vouchers.status', 'C')
                                                        ->whereRaw(
                                                        "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                                        [$date_begin, $date_end])
                                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.debe/detail_vouchers.tasa) as total'))->first();
                
                                        $total_haber =  DB::connection(Auth::user()->database_name)->table('accounts')
                                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                        ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                        ->where('accounts.code_one', $account->code_one)
                                                        ->where('accounts.code_two', $account->code_two)
                                                        ->where('accounts.code_three', $account->code_three)
                                                        ->where('detail_vouchers.status', 'C')
                                                        ->whereRaw(
                                                        "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                                        [$date_begin, $date_end])
                                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.haber/detail_vouchers.tasa) as total'))->first();    
                                                        
                                                        $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                                        ->where('accounts.code_one', $account->code_one)
                                                        ->where('accounts.code_two', $account->code_two)
                                                        ->where('accounts.code_three', $account->code_three)
                                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(balance_previus/rate) as total'))->first();
                                    /*---------------------------------------------------*/                               
            
                                    
            
                                    $account->debe = $total_debe->total;
                                    $account->haber = $total_haber->total;      
                                    $account->balance_previus = $total_balance->total;
                                
                                }
                                }
                }else{
                    
                    if(($account->code_one == 3) && ($account->code_two == 2)){
                        $account = $this->calculation_superavit($account,4,'dolares',$date_begin,$date_end);
                    }else{
                        /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */                                   
                            $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                            ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                            ->where('accounts.code_one', $account->code_one)
                                                            ->where('accounts.code_two', $account->code_two)
                                                            ->where('detail_vouchers.status', 'C')
                                                            ->whereRaw(
                                                            "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                                            [$date_begin, $date_end])
                                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.debe/detail_vouchers.tasa) as total'))->first();

                        
                            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                            ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                            ->where('accounts.code_one', $account->code_one)
                                                            ->where('accounts.code_two', $account->code_two)
                                                            ->where('detail_vouchers.status', 'C')
                                                            ->whereRaw(
                                                            "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                                            [$date_begin, $date_end])
                                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.haber/detail_vouchers.tasa) as total'))->first();

                            $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                                            ->where('accounts.code_one', $account->code_one)
                                                            ->where('accounts.code_two', $account->code_two)
                                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(balance_previus/rate) as total'))->first();
                        /*---------------------------------------------------*/
                        
                        $account->debe = $total_debe->total;
                        $account->haber = $total_haber->total;
                        $account->balance_previus = $total_balance->total;
                    }                                       
                }
            }else{
                
            //Cuentas NIVEL 2 EJEMPLO 1.0.0.0
            /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */
            if($account->code_one == 3){
                $account = $this->calculation_capital($account,'dolares',$date_begin,$date_end);

            }else{
                $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                            ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                            ->where('accounts.code_one', $account->code_one)
                                            ->where('detail_vouchers.status', 'C')
                                            ->whereRaw(
                                            "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                            [$date_begin, $date_end])
                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.debe/detail_vouchers.tasa) as total'))->first();

                $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                            ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                            ->where('accounts.code_one', $account->code_one)
                                            ->where('detail_vouchers.status', 'C')
                                            ->whereRaw(
                                            "(DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') >= ? AND DATE_FORMAT(header_vouchers.date, '%Y-%m-%d') <= ?)", 
                                            [$date_begin, $date_end])
                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.haber/detail_vouchers.tasa) as total'))->first();

                $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                            ->where('accounts.code_one', $account->code_one)
                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(balance_previus/rate) as total'))->first();
                /*---------------------------------------------------*/


                $account->debe = $total_debe->total;
                $account->haber = $total_haber->total;           
                $account->balance_previus = $total_balance->total;
                
            }
            }

            $account_new = new Account();
            
            $account_new->debe = $account->debe;
            $account_new->haber = $account->haber;           
            $account_new->balance_previus = $account->balance_previus;

            return $account_new;
        }else{
            return redirect('/accounts')->withDanger('El codigo uno es igual a cero!');
        }
    }

    public function verificateAccountAll($account)
    {

        if($account->code_one != 0)
        {                      
            if($account->code_two != 0)
            {
                if($account->code_three != 0)
                {
                    if($account->code_four != 0)
                    {
                        if($account->code_five != 0)
                        {
                                    //Calculo de superavit
                                    if(($account->code_one == 3) && ($account->code_two == 2) && ($account->code_three == 1) && 
                                    ($account->code_four == 1) && ($account->code_five == 1) ){
                                        $account = $this->calculation_superavit_all($account,4,'bolivares');
                                    }else{
                                        /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */                                                   
                                        $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                        ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                        ->where('accounts.code_one', $account->code_one)
                                        ->where('accounts.code_two', $account->code_two)
                                        ->where('accounts.code_three', $account->code_three)
                                        ->where('accounts.code_four', $account->code_four)
                                        ->where('accounts.code_five', $account->code_five)
                                        ->where('detail_vouchers.status', 'C')
                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();
                                        
                                    

                                        $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                        ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                        ->where('accounts.code_one', $account->code_one)
                                        ->where('accounts.code_two', $account->code_two)
                                        ->where('accounts.code_three', $account->code_three)
                                        ->where('accounts.code_four', $account->code_four)
                                        ->where('accounts.code_five', $account->code_five)
                                        ->where('detail_vouchers.status', 'C')
                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(haber) as total'))->first();   

                                        
                                        /*---------------------------------------------------*/

                                

                                        $account->debe = $total_debe->total;
                                        $account->haber = $total_haber->total;
                                    }
                                }else
                                {
                                    if(($account->code_one == 3) && ($account->code_two == 2) && ($account->code_three == 1) && 
                                    ($account->code_four == 1)){
                                        $account = $this->calculation_superavit_all($account,4,'bolivares');
                                    }else{
                                            /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */                                                   
                                            $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                                ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                                ->where('accounts.code_one', $account->code_one)
                                                                ->where('accounts.code_two', $account->code_two)
                                                                ->where('accounts.code_three', $account->code_three)
                                                                ->where('accounts.code_four', $account->code_four)
                                                                ->where('detail_vouchers.status', 'C')
                                                                ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();
            
                                            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                                ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                                ->where('accounts.code_one', $account->code_one)
                                                                ->where('accounts.code_two', $account->code_two)
                                                                ->where('accounts.code_three', $account->code_three)
                                                                ->where('accounts.code_four', $account->code_four)
                                                                ->where('detail_vouchers.status', 'C')
                                                                ->select(DB::connection(Auth::user()->database_name)->raw('SUM(haber) as total'))->first();   

                                            $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                ->where('accounts.code_one', $account->code_one)
                                                                ->where('accounts.code_two', $account->code_two)
                                                                ->where('accounts.code_three', $account->code_three)
                                                                ->where('accounts.code_four', $account->code_four)
                                                                ->sum('balance_previus');   
                                            /*---------------------------------------------------*/

                                

                                            $account->debe = $total_debe->total;
                                            $account->haber = $total_haber->total;
                                            $account->balance_previus = $total_balance;

                                        }
                                    }                          

                            }else{
                            
                                if(($account->code_one == 3) && ($account->code_two == 2) && ($account->code_three == 1)){
                                    $account = $this->calculation_superavit_all($account,4,'bolivares');
                                }else{
                        
                                    /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */ 
                                        $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                        ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                        ->where('accounts.code_one', $account->code_one)
                                                        ->where('accounts.code_two', $account->code_two)
                                                        ->where('accounts.code_three', $account->code_three)
                                                        ->where('detail_vouchers.status', 'C')
                                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();
                
                                        $total_haber =  DB::connection(Auth::user()->database_name)->table('accounts')
                                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                        ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                        ->where('accounts.code_one', $account->code_one)
                                                        ->where('accounts.code_two', $account->code_two)
                                                        ->where('accounts.code_three', $account->code_three)
                                                        ->where('detail_vouchers.status', 'C')
                                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(haber) as total'))->first();    
                                                        
                                                        $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                                        ->where('accounts.code_one', $account->code_one)
                                                        ->where('accounts.code_two', $account->code_two)
                                                        ->where('accounts.code_three', $account->code_three)
                                                        ->sum('balance_previus');   
                                    /*---------------------------------------------------*/                               
            
                                    
            
                                    $account->debe = $total_debe->total;
                                    $account->haber = $total_haber->total;      
                                    $account->balance_previus = $total_balance;
                                
                                }
                                }
                }else{
                    
                    if(($account->code_one == 3) && ($account->code_two == 2)){
                        $account = $this->calculation_superavit_all($account,4,'bolivares');
                    }else{
                        /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */                                   
                            $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                            ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                            ->where('accounts.code_one', $account->code_one)
                                                            ->where('accounts.code_two', $account->code_two)
                                                            ->where('detail_vouchers.status', 'C')
                                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();

                        
                            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                            ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                            ->where('accounts.code_one', $account->code_one)
                                                            ->where('accounts.code_two', $account->code_two)
                                                            ->where('detail_vouchers.status', 'C')
                                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(haber) as total'))->first();

                            $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                                            ->where('accounts.code_one', $account->code_one)
                                                            ->where('accounts.code_two', $account->code_two)
                                                            ->sum('balance_previus'); 
                        /*---------------------------------------------------*/
                        
                        $account->debe = $total_debe->total;
                        $account->haber = $total_haber->total;
                        $account->balance_previus = $total_balance;
                    }                                       
                }
            }else{
                
            //Cuentas NIVEL 2 EJEMPLO 1.0.0.0
            /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */
            if($account->code_one == 3){
                $account = $this->calculation_capital_all($account,'bolivares');

            }else{
                $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                            ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                            ->where('accounts.code_one', $account->code_one)
                                            ->where('detail_vouchers.status', 'C')
                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();



                $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                            ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                            ->where('accounts.code_one', $account->code_one)
                                            ->where('detail_vouchers.status', 'C')
                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(haber) as total'))->first();
                $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                            ->where('accounts.code_one', $account->code_one)
                                            ->sum('balance_previus'); 
                /*---------------------------------------------------*/
                                           

                $account->debe = $total_debe->total;
                $account->haber = $total_haber->total;           
                $account->balance_previus = $total_balance;
                
            }
            }

            $account_new = new Account();
            
            $account_new->debe = $account->debe;
            $account_new->haber = $account->haber;           
            $account_new->balance_previus = $account->balance_previus;

            return $account_new;
        }else{
            return redirect('/accounts')->withDanger('El codigo uno es igual a cero!');
        }
    }

    public function verificateAccountDolarAll($account)
    {

        if($account->code_one != 0)
        {                      
            if($account->code_two != 0)
            {
                if($account->code_three != 0)
                {
                    if($account->code_four != 0)
                    {
                        if($account->code_five != 0)
                        {
                                    //Calculo de superavit
                                    if(($account->code_one == 3) && ($account->code_two == 2) && ($account->code_three == 1) && 
                                    ($account->code_four == 1) && ($account->code_five == 1) ){
                                        $account = $this->calculation_superavit_all($account,4,'dolares');
                                    }else{
                                        /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */                                                   
                                        $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                        ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                        ->where('accounts.code_one', $account->code_one)
                                        ->where('accounts.code_two', $account->code_two)
                                        ->where('accounts.code_three', $account->code_three)
                                        ->where('accounts.code_four', $account->code_four)
                                        ->where('accounts.code_five', $account->code_five)
                                        ->where('detail_vouchers.status', 'C')
                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.debe/detail_vouchers.tasa) as total'))->first();
                                        
                                    

                                        $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                        ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                        ->where('accounts.code_one', $account->code_one)
                                        ->where('accounts.code_two', $account->code_two)
                                        ->where('accounts.code_three', $account->code_three)
                                        ->where('accounts.code_four', $account->code_four)
                                        ->where('accounts.code_five', $account->code_five)
                                        ->where('detail_vouchers.status', 'C')
                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.haber/detail_vouchers.tasa) as total'))->first();   

                                        
                                        /*---------------------------------------------------*/

                                

                                        $account->debe = $total_debe->total;
                                        $account->haber = $total_haber->total;
                                    }
                                }else
                                {
                                    if(($account->code_one == 3) && ($account->code_two == 2) && ($account->code_three == 1) && 
                                    ($account->code_four == 1)){
                                        $account = $this->calculation_superavit_all($account,4,'dolares');
                                    }else{
                                            /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */                                                   
                                            $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                                ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                                ->where('accounts.code_one', $account->code_one)
                                                                ->where('accounts.code_two', $account->code_two)
                                                                ->where('accounts.code_three', $account->code_three)
                                                                ->where('accounts.code_four', $account->code_four)
                                                                ->where('detail_vouchers.status', 'C')
                                                                ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.debe/detail_vouchers.tasa) as total'))->first();
            
                                            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                                ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                                ->where('accounts.code_one', $account->code_one)
                                                                ->where('accounts.code_two', $account->code_two)
                                                                ->where('accounts.code_three', $account->code_three)
                                                                ->where('accounts.code_four', $account->code_four)
                                                                ->where('detail_vouchers.status', 'C')
                                                                ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.haber/detail_vouchers.tasa) as total'))->first();   

                                            $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                ->where('accounts.code_one', $account->code_one)
                                                                ->where('accounts.code_two', $account->code_two)
                                                                ->where('accounts.code_three', $account->code_three)
                                                                ->where('accounts.code_four', $account->code_four)
                                                                ->select(DB::connection(Auth::user()->database_name)->raw('SUM(balance_previus/rate) as total'))->first(); 
                                            /*---------------------------------------------------*/

                                

                                            $account->debe = $total_debe->total;
                                            $account->haber = $total_haber->total;
                                            $account->balance_previus = $total_balance->total;

                                        }
                                    }                          

                            }else{
                            
                                if(($account->code_one == 3) && ($account->code_two == 2) && ($account->code_three == 1)){
                                    $account = $this->calculation_superavit_all($account,4,'dolares');
                                }else{
                        
                                    /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */ 
                                        $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                        ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                        ->where('accounts.code_one', $account->code_one)
                                                        ->where('accounts.code_two', $account->code_two)
                                                        ->where('accounts.code_three', $account->code_three)
                                                        ->where('detail_vouchers.status', 'C')
                                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.debe/detail_vouchers.tasa) as total'))->first();
                
                                        $total_haber =  DB::connection(Auth::user()->database_name)->table('accounts')
                                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                        ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                        ->where('accounts.code_one', $account->code_one)
                                                        ->where('accounts.code_two', $account->code_two)
                                                        ->where('accounts.code_three', $account->code_three)
                                                        ->where('detail_vouchers.status', 'C')
                                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.haber/detail_vouchers.tasa) as total'))->first();    
                                                        
                                                        $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                                        ->where('accounts.code_one', $account->code_one)
                                                        ->where('accounts.code_two', $account->code_two)
                                                        ->where('accounts.code_three', $account->code_three)
                                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(balance_previus/rate) as total'))->first();
                                    /*---------------------------------------------------*/                               
            
                                    
            
                                    $account->debe = $total_debe->total;
                                    $account->haber = $total_haber->total;      
                                    $account->balance_previus = $total_balance->total;
                                
                                }
                                }
                }else{
                    
                    if(($account->code_one == 3) && ($account->code_two == 2)){
                        $account = $this->calculation_superavit_all($account,4,'dolares');
                    }else{
                        /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */                                   
                            $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                            ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                            ->where('accounts.code_one', $account->code_one)
                                                            ->where('accounts.code_two', $account->code_two)
                                                            ->where('detail_vouchers.status', 'C')
                                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.debe/detail_vouchers.tasa) as total'))->first();

                        
                            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                            ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                                            ->where('accounts.code_one', $account->code_one)
                                                            ->where('accounts.code_two', $account->code_two)
                                                            ->where('detail_vouchers.status', 'C')
                                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.haber/detail_vouchers.tasa) as total'))->first();

                            $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                                            ->where('accounts.code_one', $account->code_one)
                                                            ->where('accounts.code_two', $account->code_two)
                                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(balance_previus/rate) as total'))->first();
                        /*---------------------------------------------------*/
                        
                        $account->debe = $total_debe->total;
                        $account->haber = $total_haber->total;
                        $account->balance_previus = $total_balance->total;
                    }                                       
                }
            }else{
                
            //Cuentas NIVEL 2 EJEMPLO 1.0.0.0
            /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */
            if($account->code_one == 3){
                $account = $this->calculation_capital_all($account,'dolares');

            }else{
                $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                            ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                            ->where('accounts.code_one', $account->code_one)
                                            ->where('detail_vouchers.status', 'C')
                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.debe/detail_vouchers.tasa) as total'))->first();

                $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                            ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                                            ->where('accounts.code_one', $account->code_one)
                                            ->where('detail_vouchers.status', 'C')
                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.haber/detail_vouchers.tasa) as total'))->first();

                $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                            ->where('accounts.code_one', $account->code_one)
                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(balance_previus/rate) as total'))->first();
                /*---------------------------------------------------*/


                $account->debe = $total_debe->total;
                $account->haber = $total_haber->total;           
                $account->balance_previus = $total_balance->total;
                
            }
            }

            $account_new = new Account();
            
            $account_new->debe = $account->debe;
            $account_new->haber = $account->haber;           
            $account_new->balance_previus = $account->balance_previus;

            return $account_new;
        }else{
            return redirect('/accounts')->withDanger('El codigo uno es igual a cero!');
        }
    }

    
     public function calculation_capital($var,$coin,$date_begin,$date_end)
     {
        if($coin == 'bolivares')
        {
            $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                        ->where('accounts.code_one','>=', $var->code_one)
                        ->where('detail_vouchers.status', 'C')
                        ->whereRaw(
                        "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                        [$date_begin, $date_end])
                         ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();

            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                        ->where('accounts.code_one','>=', $var->code_one)
                        ->where('detail_vouchers.status', 'C')
                        ->whereRaw(
                        "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                        [$date_begin, $date_end])
                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(haber) as total'))->first();

            $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                        ->where('accounts.code_one', $var->code_one)
                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(balance_previus) as total'))->first();

        }else{
            $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                        ->where('accounts.code_one','>=', $var->code_one)
                        ->where('detail_vouchers.status', 'C')
                        ->whereRaw(
                        "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                        [$date_begin, $date_end])
                         ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.debe/detail_vouchers.tasa) as total'))->first();

            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                        ->where('accounts.code_one','>=', $var->code_one)
                        ->where('detail_vouchers.status', 'C')
                        ->whereRaw(
                        "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                        [$date_begin, $date_end])
                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.haber/detail_vouchers.tasa) as total'))->first();

            $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                        ->where('accounts.code_one', $var->code_one)
                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(balance_previus/rate) as total'))->first();
         }

        
         /*---------------------------------------------------*/
 
     
         $var->debe = $total_debe->total;
         $var->haber = $total_haber->total;           
         $var->balance_previus = $total_balance->total;
 
         return $var;
     }
 
     public function calculation_superavit($var,$code,$coin,$date_begin,$date_end)
     {
        if($coin == 'bolivares'){
            $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                            ->where('accounts.code_one','>=', $code)
                            ->where('detail_vouchers.status', 'C')
                            ->whereRaw(
                            "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                            [$date_begin, $date_end])
                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();



            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                            ->where('accounts.code_one','>=', $code)
                            ->where('detail_vouchers.status', 'C')
                            ->whereRaw(
                            "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                            [$date_begin, $date_end])
                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(haber) as total'))->first();

        }else{
            $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                            ->where('accounts.code_one','>=', $code)
                            ->where('detail_vouchers.status', 'C')
                            ->whereRaw(
                            "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                            [$date_begin, $date_end])
                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.debe/detail_vouchers.tasa) as total'))->first();



            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                            ->where('accounts.code_one','>=', $code)
                            ->where('detail_vouchers.status', 'C')
                            ->whereRaw(
                            "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                            [$date_begin, $date_end])
                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.haber/detail_vouchers.tasa) as total'))->first();
        }
        
 
         $var->debe = $total_debe->total;
         $var->haber = $total_haber->total;    
         //asi cuadra el balance
         $var->balance_previus = 0;   
  
          return $var;
  
     }

     public function calculation_capital_all($var,$coin)
     {
        if($coin == 'bolivares')
        {
            $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                        ->where('accounts.code_one','>=', $var->code_one)
                        ->where('detail_vouchers.status', 'C')
                         ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();

            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                        ->where('accounts.code_one','>=', $var->code_one)
                        ->where('detail_vouchers.status', 'C')
                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(haber) as total'))->first();

            $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                        ->where('accounts.code_one', $var->code_one)
                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(balance_previus) as total'))->first();

        }else{
            $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                        ->where('accounts.code_one','>=', $var->code_one)
                        ->where('detail_vouchers.status', 'C')
                         ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.debe/detail_vouchers.tasa) as total'))->first();

            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                        ->where('accounts.code_one','>=', $var->code_one)
                        ->where('detail_vouchers.status', 'C')
                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.haber/detail_vouchers.tasa) as total'))->first();

            $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                        ->where('accounts.code_one', $var->code_one)
                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(balance_previus/rate) as total'))->first();
         }

        
         /*---------------------------------------------------*/
 
     
         $var->debe = $total_debe->total;
         $var->haber = $total_haber->total;           
         $var->balance_previus = $total_balance->total;
 
         return $var;
     }
 
     public function calculation_superavit_all($var,$code,$coin)
     {
        if($coin == 'bolivares'){
            $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                            ->where('accounts.code_one','>=', $code)
                            ->where('detail_vouchers.status', 'C')
                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();



            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                            ->where('accounts.code_one','>=', $code)
                            ->where('detail_vouchers.status', 'C')
                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(haber) as total'))->first();

        }else{
            $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                            ->where('accounts.code_one','>=', $code)
                            ->where('detail_vouchers.status', 'C')
                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.debe/detail_vouchers.tasa) as total'))->first();



            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                            ->where('accounts.code_one','>=', $code)
                            ->where('detail_vouchers.status', 'C')
                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(detail_vouchers.haber/detail_vouchers.tasa) as total'))->first();
        }
        
 
         $var->debe = $total_debe->total;
         $var->haber = $total_haber->total;    
         //asi cuadra el balance
         $var->balance_previus = 0;   
  
          return $var;
  
     }
}
