<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Client;
use App\Provider;
use App\Vendor;
use App;

class ReportPaymentController extends Controller
{
    public function index_payment($typeperson,$id = null)
    {
        
        $user       =   auth()->user();
        $users_role =   $user->role_id;
        if($users_role == '1'){
            $date = Carbon::now();
            $datenow = $date->format('Y-m-d');   
            $client = null; 
            $provider = null; 


            if(isset($typeperson) && $typeperson == 'Cliente'){
                if(isset($id)){
                    $client     = Client::on(Auth::user()->database_name)->find($id);
                }
            }else if (isset($typeperson) && $typeperson == 'Proveedor'){
                if(isset($id)){
                    $provider   = Provider::on(Auth::user()->database_name)->find($id);
                }
            }
            
        }elseif($users_role == '2'){
            return view('admin.index');
        }

        return view('admin.reports_payment.index_payment',compact('client','datenow','typeperson','provider'));
      
    }

    public function store_payment(Request $request)
    {
        $date_begin = request('date_begin');
        $date_end = request('date_end');
        $type = request('type');
        $id_client = request('id_client');
        $id_provider = request('id_provider');
        $coin = request('coin');
        $client = null;
        $provider = null;
        $typeperson = 'ninguno';

        $date = Carbon::now();
        $datenow = $date->format('Y-m-d');   

        if($type != 'todo'){
            if(isset($id_client)){
                $client    = Client::on(Auth::user()->database_name)->find($id_client);
                $typeperson = 'Cliente';
            }
            if(isset($id_provider)){
                $provider    = Provider::on(Auth::user()->database_name)->find($id_provider);
                $typeperson = 'Proveedor';
            }
        }

        return view('admin.reports_payment.index_payment',compact('datenow','coin','date_begin','date_end','client','provider','typeperson'));
    }

    function payment_pdf($coin,$date_begin,$date_end,$typeperson,$id_client_or_provider = null)
    {
        
        $pdf = App::make('dompdf.wrapper');
        $quotations = null;
        
        $date = Carbon::now();
        $datenow = $date->format('d-m-Y'); 

        $global = new GlobalController();

        if(empty($date_end)){
            $date_end = $datenow;

            $date_end_consult = $date->format('Y-m-d'); 
        }else{
            $date_end = Carbon::parse($date_end)->format('d-m-Y');

            $date_end_consult = Carbon::parse($date_end)->format('Y-m-d');
        }

        if(isset($date_begin)){
            $date_begin = Carbon::parse($date_begin)->format('Y-m-d');
        }
        
        $period = $date->format('Y'); 

        $client = null;
        $provider = null;
        

        if(isset($typeperson) && ($typeperson == 'Cliente')){
           
            $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
            ->join('clients', 'clients.id','=','quotations.id_client')
            ->join('quotation_payments', 'quotation_payments.id_quotation','=','quotations.id')
            ->where('quotations.status','C')
            ->whereRaw("(DATE_FORMAT(quotation_payments.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(quotation_payments.created_at, '%Y-%m-%d') <= ?)", 
                [$date_begin, $date_end_consult])
            ->where('quotations.id_client',$id_client_or_provider)
            ->select('quotation_payments.*')
            ->get();

            $client = Client::on(Auth::user()->database_name)->find($id_client_or_provider);
            
        }if(isset($typeperson) && ($typeperson == 'Proveedor')){
            
            $quotations = DB::connection(Auth::user()->database_name)->table('expenses_and_purchases')
            ->join('providers', 'providers.id','=','expenses_and_purchases.id_provider')
            ->join('expense_payments', 'expense_payments.id_expense','=','expenses_and_purchases.id')
            ->where('expenses_and_purchases.status','C')
            ->whereRaw("(DATE_FORMAT(expense_payments.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(expense_payments.created_at, '%Y-%m-%d') <= ?)", 
                [$date_begin, $date_end_consult])
            ->where('expenses_and_purchases.id_provider',$id_client_or_provider)
            ->select('expense_payments.*')
            ->get();
            
            $provider = Provider::on(Auth::user()->database_name)->find($id_client_or_provider);

        }else{
            
            $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
            ->join('clients', 'clients.id','=','quotations.id_client')
            ->join('quotation_payments', 'quotation_payments.id_quotation','=','quotations.id')
            ->leftJoin('accounts', 'accounts.id','=','quotation_payments.id_account')
            ->where('quotations.status','C')
            ->where('quotation_payments.status','1')
            ->whereRaw("(DATE_FORMAT(quotation_payments.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(quotation_payments.created_at, '%Y-%m-%d') <= ?)", 
                [$date_begin, $date_end_consult])
            ->select('quotation_payments.*','accounts.description as account_description')
            ->get();

            $client = Client::on(Auth::user()->database_name)->find($id_client_or_provider);
        }
       
        foreach($quotations as $quotation){

            $quotation->payment_type = $global->asignar_payment_type($quotation->payment_type);

        }


        $pdf = $pdf->loadView('admin.reports_payment.payment',compact('coin','quotations','datenow','date_end','client','provider'));
        return $pdf->stream();
                 
    }

    public function select_client()
    {
        $clients    = Client::on(Auth::user()->database_name)->get();
    
        return view('admin.reports_payment.selectclient',compact('clients'));
    }

   
    public function select_provider()
    {
        $providers    = Provider::on(Auth::user()->database_name)->get();
    
        return view('admin.reports_payment.selectprovider',compact('providers'));
    }
}
