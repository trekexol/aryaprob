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

    public function calculationOneAccount($account,$date_begin,$date_end)
    {
       
       return $this->verificateAccount($account,$date_begin,$date_end);

    }



    public function verificateAccount($account,$date_begin,$date_end){

        
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
                                        ->where('accounts.code_one', $account->code_one)
                                        ->where('accounts.code_two', $account->code_two)
                                        ->where('accounts.code_three', $account->code_three)
                                        ->where('accounts.code_four', $account->code_four)
                                        ->where('accounts.code_five', $account->code_five)
                                        ->where('detail_vouchers.status', 'C')
                    
                                        ->whereRaw(
                                        "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                        [$date_begin, $date_end])
                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();
                                        
                                    

                                        $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                        ->where('accounts.code_one', $account->code_one)
                                        ->where('accounts.code_two', $account->code_two)
                                        ->where('accounts.code_three', $account->code_three)
                                        ->where('accounts.code_four', $account->code_four)
                                        ->where('accounts.code_five', $account->code_five)
                                        ->where('detail_vouchers.status', 'C')
                    
                                        ->whereRaw(
                                        "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
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
                                                                ->where('accounts.code_one', $account->code_one)
                                                                ->where('accounts.code_two', $account->code_two)
                                                                ->where('accounts.code_three', $account->code_three)
                                                                ->where('accounts.code_four', $account->code_four)
                                                                ->where('detail_vouchers.status', 'C')
                                            
                                                                ->whereRaw(
                                            "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                            [$date_begin, $date_end])
                                                                ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();
            
                                            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                                ->where('accounts.code_one', $account->code_one)
                                                                ->where('accounts.code_two', $account->code_two)
                                                                ->where('accounts.code_three', $account->code_three)
                                                                ->where('accounts.code_four', $account->code_four)
                                                                ->where('detail_vouchers.status', 'C')
                                            
                                                                ->whereRaw(
                                            "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
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
                                                        ->where('accounts.code_one', $account->code_one)
                                                        ->where('accounts.code_two', $account->code_two)
                                                        ->where('accounts.code_three', $account->code_three)
                                                        ->where('detail_vouchers.status', 'C')
                                    
                                                        ->whereRaw(
                                                        "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                                        [$date_begin, $date_end])
                                                        ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();
                
                                        $total_haber =  DB::connection(Auth::user()->database_name)->table('accounts')
                                                        ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                        ->where('accounts.code_one', $account->code_one)
                                                        ->where('accounts.code_two', $account->code_two)
                                                        ->where('accounts.code_three', $account->code_three)
                                                        ->where('detail_vouchers.status', 'C')
                                    
                                                        ->whereRaw(
                                                        "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
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
                                                            ->where('accounts.code_one', $account->code_one)
                                                            ->where('accounts.code_two', $account->code_two)
                                                            ->where('detail_vouchers.status', 'C')
                                        
                                                            ->whereRaw(
                                                            "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                                            [$date_begin, $date_end])
                                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();

                        
                            $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                            ->where('accounts.code_one', $account->code_one)
                                                            ->where('accounts.code_two', $account->code_two)
                                                            ->where('detail_vouchers.status', 'C')
                                        
                                                            ->whereRaw(
                                                            "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
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
                                            ->where('accounts.code_one', $account->code_one)
                                            ->where('detail_vouchers.status', 'C')
                        
                                            ->whereRaw(
                                            "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                            [$date_begin, $date_end])
                                            ->select(DB::connection(Auth::user()->database_name)->raw('SUM(debe) as total'))->first();



                $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                            ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                            ->where('accounts.code_one', $account->code_one)
                                            ->where('detail_vouchers.status', 'C')
                        
                                            ->whereRaw(
                                            "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
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




     //agregar que retorne el monto en dolares
     public function calculation($date_begin,$date_end)
     {
         
         //dd($date_begin);
         $accounts = Account::on(Auth::user()->database_name)->orderBy('code_one', 'asc')
                          ->orderBy('code_two', 'asc')
                          ->orderBy('code_three', 'asc')
                          ->orderBy('code_four', 'asc')
                          ->orderBy('code_five', 'asc')
                          ->get();
 
                        
                          if(isset($accounts)) {
                             foreach ($accounts as $var) {
                  
                                     
                                 if($var->code_one != 0){
                                     
                                     if($var->code_two != 0){
                     
                     
                                         if($var->code_three != 0){
                     
                     
                                             if($var->code_four != 0){
 
                                                 if($var->code_five != 0){
                                                     //Calculo de superavit
                                                     if(($var->code_one == 3) && ($var->code_two == 2) && ($var->code_three == 1) && 
                                                     ($var->code_four == 1) && ($var->code_five == 1) ){
                                                         $var = $this->calculation_superavit($var,4,'bolivares',$date_begin,$date_end);
                                                     }else{
                                                         /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */                                                   
                                                         $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                         ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                         ->where('accounts.code_one', $var->code_one)
                                                         ->where('accounts.code_two', $var->code_two)
                                                         ->where('accounts.code_three', $var->code_three)
                                                         ->where('accounts.code_four', $var->code_four)
                                                         ->where('accounts.code_five', $var->code_five)
                                                         ->where('detail_vouchers.status', 'C')
                                        
                                                         ->whereRaw(
                                                         "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                                         [$date_begin, $date_end])
                                                         ->sum('debe');
                                                         
                                                        
 
                                                         $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                                         ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                         ->where('accounts.code_one', $var->code_one)
                                                         ->where('accounts.code_two', $var->code_two)
                                                         ->where('accounts.code_three', $var->code_three)
                                                         ->where('accounts.code_four', $var->code_four)
                                                         ->where('accounts.code_five', $var->code_five)
                                                         ->where('detail_vouchers.status', 'C')
                                        
                                                         ->whereRaw(
                                                         "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                                         [$date_begin, $date_end])
                                                         ->sum('haber');   
 
                                                         
                                                         /*---------------------------------------------------*/
 
                                                 
 
                                                         $var->debe = $total_debe;
                                                         $var->haber = $total_haber;
                                                     }
                                                 }else
                                                 {
                                                     if(($var->code_one == 3) && ($var->code_two == 2) && ($var->code_three == 1) && 
                                                     ($var->code_four == 1)){
                                                         $var = $this->calculation_superavit($var,4,'bolivares',$date_begin,$date_end);
                                                     }else{
                                                             /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */                                                   
                                                             $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                                 ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                                                 ->where('accounts.code_one', $var->code_one)
                                                                                 ->where('accounts.code_two', $var->code_two)
                                                                                 ->where('accounts.code_three', $var->code_three)
                                                                                 ->where('accounts.code_four', $var->code_four)
                                                                                 ->where('detail_vouchers.status', 'C')
                                                                
                                                                                 ->whereRaw(
                                                             "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                                             [$date_begin, $date_end])
                                                                                 ->sum('debe');
                             
                                                             $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                                 ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                                                 ->where('accounts.code_one', $var->code_one)
                                                                                 ->where('accounts.code_two', $var->code_two)
                                                                                 ->where('accounts.code_three', $var->code_three)
                                                                                 ->where('accounts.code_four', $var->code_four)
                                                                                 ->where('detail_vouchers.status', 'C')
                                                                
                                                                                 ->whereRaw(
                                                             "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                                             [$date_begin, $date_end])
                                                                                 ->sum('haber');   
 
                                                             $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                                 ->where('accounts.code_one', $var->code_one)
                                                                                 ->where('accounts.code_two', $var->code_two)
                                                                                 ->where('accounts.code_three', $var->code_three)
                                                                                 ->where('accounts.code_four', $var->code_four)
                                                                                 ->sum('balance_previus');   
                                                             /*---------------------------------------------------*/
                         
                                                 
                         
                                                             $var->debe = $total_debe;
                                                             $var->haber = $total_haber;
                                                             $var->balance_previus = $total_balance;
                         
                                                         }
                                                     }                          
                     
                                             }else{
                                                
                                                 if(($var->code_one == 3) && ($var->code_two == 2) && ($var->code_three == 1)){
                                                     $var = $this->calculation_superavit($var,4,'bolivares',$date_begin,$date_end);
                                                 }else{
                                           
                                                     /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */ 
                                                         $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                         ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                                         ->where('accounts.code_one', $var->code_one)
                                                                         ->where('accounts.code_two', $var->code_two)
                                                                         ->where('accounts.code_three', $var->code_three)
                                                                         ->where('detail_vouchers.status', 'C')
                                                        
                                                                         ->whereRaw(
                                                                         "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                                                         [$date_begin, $date_end])
                                                                         ->sum('debe');
                                 
                                                         $total_haber =  DB::connection(Auth::user()->database_name)->table('accounts')
                                                                         ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                                         ->where('accounts.code_one', $var->code_one)
                                                                         ->where('accounts.code_two', $var->code_two)
                                                                         ->where('accounts.code_three', $var->code_three)
                                                                         ->where('detail_vouchers.status', 'C')
                                                        
                                                                         ->whereRaw(
                                                                         "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                                                         [$date_begin, $date_end])
                                                                         ->sum('haber');    
                                                                         
                                                                         $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                         ->where('accounts.code_one', $var->code_one)
                                                                         ->where('accounts.code_two', $var->code_two)
                                                                         ->where('accounts.code_three', $var->code_three)
                                                                         ->sum('balance_previus');   
                                                     /*---------------------------------------------------*/                               
                             
                                                     
                             
                                                     $var->debe = $total_debe;
                                                     $var->haber = $total_haber;       
                                                     $var->balance_previus = $total_balance;
                                                 
                                                    }
                                                 }
                                 }else{
                                     
                                     if(($var->code_one == 3) && ($var->code_two == 2)){
                                         $var = $this->calculation_superavit($var,4,'bolivares',$date_begin,$date_end);
                                     }else{
                                         /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */                                   
                                             $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                             ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                                             ->where('accounts.code_one', $var->code_one)
                                                                             ->where('accounts.code_two', $var->code_two)
                                                                             ->where('detail_vouchers.status', 'C')
                                                            
                                                                             ->whereRaw(
                                                                             "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                                                             [$date_begin, $date_end])
                                                                             ->sum('debe');
                     
                                         
                                             $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                             ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                                             ->where('accounts.code_one', $var->code_one)
                                                                             ->where('accounts.code_two', $var->code_two)
                                                                             ->where('detail_vouchers.status', 'C')
                                                            
                                                                             ->whereRaw(
                                                                             "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                                                             [$date_begin, $date_end])
                                                                             ->sum('haber');
 
                                             $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                                                             ->where('accounts.code_one', $var->code_one)
                                                                             ->where('accounts.code_two', $var->code_two)
                                                                             ->sum('balance_previus'); 
                                         /*---------------------------------------------------*/
                                         
                                         $var->debe = $total_debe;
                                         $var->haber = $total_haber;
                                         $var->balance_previus = $total_balance;
                                     }                                       
                                 }
                     }else{
                         //Cuentas NIVEL 2 EJEMPLO 1.0.0.0
                         /*CALCULA LOS SALDOS DESDE DETALLE COMPROBANTE */
                         if($var->code_one == 3){
                             $var = $this->calculation_capital($var,'bolivares',$date_begin,$date_end);
                         
                         }else{
                             $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                                         ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                         ->where('accounts.code_one', $var->code_one)
                                                         ->where('detail_vouchers.status', 'C')
                                        
                                                         ->whereRaw(
                                                         "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                                         [$date_begin, $date_end])
                                                         ->sum('debe');
     
                         
                         
                             $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                                         ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                                         ->where('accounts.code_one', $var->code_one)
                                                         ->where('detail_vouchers.status', 'C')
                                        
                                                         ->whereRaw(
                                                         "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                                         [$date_begin, $date_end])
                                                         ->sum('haber');
                             $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                                         ->where('accounts.code_one', $var->code_one)
                                                         ->sum('balance_previus'); 
                             /*---------------------------------------------------*/
 
                         
                             $var->debe = $total_debe;
                             $var->haber = $total_haber;           
                             $var->balance_previus = $total_balance;
                         }
                     }
                 }else{
                     return redirect('/accounts')->withDanger('El codigo uno es igual a cero!');
                 }
             } 
         }  else{
             return redirect('/accounts')->withDanger('No hay Cuentas');
         }              
 
        
         
          return $accounts;
     }
 
 
     public function calculation_capital($var,$coin,$date_begin,$date_end)
     {
         $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                                     ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                     ->where('accounts.code_one','>=', $var->code_one)
                                     ->where('detail_vouchers.status', 'C')
                    
                                     ->whereRaw(
                                     "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                     [$date_begin, $date_end])
                                     ->sum('debe');
 
     
     
         $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                                     ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                                     ->where('accounts.code_one','>=', $var->code_one)
                                     ->where('detail_vouchers.status', 'C')
                    
                                     ->whereRaw(
                                     "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                                     [$date_begin, $date_end])
                                     ->sum('haber');
         $total_balance = DB::connection(Auth::user()->database_name)->table('accounts')
                                     ->where('accounts.code_one', $var->code_one)
                                     ->sum('balance_previus'); 
         /*---------------------------------------------------*/
 
     
         $var->debe = $total_debe;
         $var->haber = $total_haber;           
         $var->balance_previus = $total_balance;
 
         return $var;
     }
 
     public function calculation_superavit($var,$code,$coin,$date_begin,$date_end)
     {
         $total_debe = DB::connection(Auth::user()->database_name)->table('accounts')
                 ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                 ->where('accounts.code_one','>=', $code)
                 ->where('detail_vouchers.status', 'C')
                 ->whereRaw(
                 "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                 [$date_begin, $date_end])
                 ->sum('debe');
 
 
 
         $total_haber = DB::connection(Auth::user()->database_name)->table('accounts')
                 ->join('detail_vouchers', 'detail_vouchers.id_account', '=', 'accounts.id')
                 ->where('accounts.code_one','>=', $code)
                 ->where('detail_vouchers.status', 'C')

                 ->whereRaw(
                 "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                 [$date_begin, $date_end])
                 ->sum('haber');
 
 
         $var->debe = $total_debe;
         $var->haber = $total_haber;    
         //asi cuadra el balance
         $var->balance_previus = 0;   
  
          return $var;
  
     }
}
