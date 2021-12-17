<?php
namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;


use App;
use App\Account;
use App\Client;
use App\Company;
use App\DetailVoucher;
use App\Employee;
use App\ExpensesAndPurchase;
use App\ExpensesDetail;
use App\Http\Controllers\UserAccess\UserAccessController;
use App\Product;
use App\Provider;
use App\Quotation;
use App\QuotationProduct;
use App\Vendor;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class ReportDeliveryNoteController extends Controller
{
   
    public $modulo = "Reportes";
   
    public function index_accounts_receivable_note($typeperson = 'todo',$id_client_or_vendor = null,$date_end = null,$typeinvoice = 'notas')
    {        
       
        //dd($typeperson);


        $global = new GlobalController();
        $fecha_frist = $global->data_first_month_day();      

        $userAccess = new UserAccessController();

        if($userAccess->validate_user_access($this->modulo)){
            $date = Carbon::now();
            $datenow = $date->format('Y-m-d');   
            $client = null; 
            $vendor = null; 
            

            if(isset($typeperson) && $typeperson == 'Cliente'){
                if(isset($id_client_or_vendor)){
                    $client    = Client::on(Auth::user()->database_name)->find($id_client_or_vendor);
                }
            }
            
            if (isset($typeperson) && $typeperson == 'Vendedor'){
                if(isset($id_client_or_vendor)){
                    $vendor    = Vendor::on(Auth::user()->database_name)->find($id_client_or_vendor);
                }
            }
            
            return view('admin.reports.index_accounts_receivable_note',compact('client','datenow','typeperson','vendor','date_end','fecha_frist','typeinvoice'));
        }else{
            return redirect('/home')->withDanger('No tiene Acceso al modulo de '.$this->modulo);
        }
    }

    


    public function store_accounts_receivable_note(Request $request)
    {
      

        $date_end = request('date_end');
        $fecha_frist = request('date_begin');
        $type = request('type');
        $id_client = request('id_client');
        $id_vendor = request('id_vendor');
        $typeinvoice = request('typeinvoice');
        $coin = request('coin');
        $client = null;
        $vendor = null;
        

        if($type != 'todo'){
            if(isset($id_client)){
                $client    = Client::on(Auth::user()->database_name)->find($id_client);
                $typeperson = 'Cliente';
                $id_client_or_vendor = $id_client;
            }
            if(isset($id_vendor)){
                $vendor    = Vendor::on(Auth::user()->database_name)->find($id_vendor);
                $typeperson = 'Vendedor';
                $id_client_or_vendor = $vendor;
            }
        } else {
            $typeperson = 'todo';
            
        }

        return view('admin.reports.index_accounts_receivable_note',compact('coin','typeinvoice','date_end','client','vendor','typeperson','fecha_frist'));
    }

    public function store_debtstopay(Request $request)
    {
        
        $date_end = request('date_end');
        $type = request('type');
        $id_provider = request('id_provider');
        $coin = request('coin');

        $provider = null;

        if($type != 'todos'){

            if(isset($id_provider)){
                $provider    = Provider::on(Auth::user()->database_name)->find($id_provider);
            }
        }

        return view('admin.reports.index_debtstopay',compact('date_end','provider','coin'));
    }

    public function store_accounts(Request $request)
    {
        
        $client = null;
        $date_begin = request('date_begin');
        $date_end = request('date_end');
        $level = request('level');
        
        if(isset($request->id_client)){
            $client = Client::on(Auth::user()->database_name)->find($request->id_client);
        }
        
        return view('admin.reports.index_accounts',compact('client','date_begin','date_end','level'));
    }

    public function store_bankmovements(Request $request)
    {
        
        $id_bank = request('id_bank');
        $coin = request('coin');
        $date_begin = request('date_begin');
        $date_end = request('date_end');
        $account_bank = request('account_bank');

        if(isset($account_bank)){
            $account_bank = Account::on(Auth::user()->database_name)->find($account_bank);
        }
        $type = request('type');
        
        $accounts_banks = DB::connection(Auth::user()->database_name)->table('accounts')
                            ->where('code_one', 1)
                            ->where('code_two', 1)
                            ->where('code_three', 1)
                            ->whereIn('code_four', [1,2])
                            ->where('code_five', '<>',0)
                            ->where('description','not like', 'Punto de Venta%')
                            ->get();
        
        
        return view('admin.reports.index_bankmovements',compact('coin','accounts_banks','id_bank','date_begin','date_end','account_bank','type'));
    }

    public function store_sales_books(Request $request)
    {
        
       
        $coin = request('coin');
        $date_begin = request('date_begin');
        $date_end = request('date_end');
        
        return view('admin.reports.index_sales_books',compact('coin','date_begin','date_end'));
    }

    public function store_purchases_books(Request $request)
    {
        
       
        $coin = request('coin');
        $date_begin = request('date_begin');
        $date_end = request('date_end');
        
        return view('admin.reports.index_purchases_books',compact('coin','date_begin','date_end'));
    }

    public function store_inventory(Request $request)
    {
        
       
        $coin = request('coin');
        $date_begin = request('date_begin');
        $date_end = request('date_end');
        $name = request('name');
        
        return view('admin.reports.index_inventory',compact('name','coin','date_begin','date_end'));
    }

    public function store_operating_margin(Request $request)
    {
        $coin = request('coin');
        $date_begin = request('date_begin');
        $date_end = request('date_end');
        
        return view('admin.reports.index_operating_margin',compact('coin','date_begin','date_end'));
    }

    public function store_clients(Request $request)
    {
        
        $date_begin = request('date_begin');
        $date_end = request('date_end');
        $name = request('name');
        
        return view('admin.reports.index_clients',compact('name','date_begin','date_end'));
    }

    public function store_providers(Request $request)
    {
        
        $date_begin = request('date_begin');
        $date_end = request('date_end');
        $name = request('name');
        
        return view('admin.reports.index_providers',compact('name','date_begin','date_end'));
    }

    public function store_sales(Request $request)
    {
        
        $date_begin = request('date_begin');
        $date_end = request('date_end');
        $name = request('name');
        $coin = request('coin');
        
        return view('admin.reports.index_sales',compact('name','coin','date_begin','date_end'));
    }

   

   

    function debtstopay_pdf($coin,$date_end,$id_provider = null)
    {
      
        $pdf = App::make('dompdf.wrapper');

       
        $date = Carbon::now();
        $datenow = $date->format('d-m-Y'); 
        if(empty($date_end)){
            $date_end = $datenow;

            $date_consult = $date->format('Y-m-d'); 
        }else{
            $date_end = Carbon::parse($date_end)->format('d-m-Y');

            $date_consult = Carbon::parse($date_end)->format('Y-m-d');
        }
        
        $period = $date->format('Y'); 
        
        if(empty($coin)){
            $coin = "bolivares";
        }
      
        if(isset($id_provider)){
            
            if((isset($coin)) && ($coin == "bolivares")){
                $expenses = DB::connection(Auth::user()->database_name)->table('expenses_and_purchases')
                                    ->join('providers', 'providers.id','=','expenses_and_purchases.id_provider')
                                    ->leftjoin('anticipos', 'anticipos.id_expense','=','expenses_and_purchases.id')
                                    ->whereIn('expenses_and_purchases.status',[1,'P'])
                                    ->where('expenses_and_purchases.amount','<>',null)
                                    ->where('expenses_and_purchases.date','<=',$date_consult)
                                    ->where('expenses_and_purchases.id_provider',$id_provider)
                                    ->select('expenses_and_purchases.rate','expenses_and_purchases.date','expenses_and_purchases.id','expenses_and_purchases.serie','providers.razon_social as name_provider','expenses_and_purchases.amount','expenses_and_purchases.amount_with_iva', DB::raw('SUM(anticipos.amount) As amount_anticipo'))
                                    ->groupBy('expenses_and_purchases.rate','expenses_and_purchases.date','expenses_and_purchases.id','expenses_and_purchases.serie','providers.razon_social','expenses_and_purchases.amount','expenses_and_purchases.amount_with_iva')
                                    ->get();
            }else{
                $expenses = DB::connection(Auth::user()->database_name)->table('expenses_and_purchases')
                                    ->join('providers', 'providers.id','=','expenses_and_purchases.id_provider')
                                    ->leftjoin('anticipos', 'anticipos.id_expense','=','expenses_and_purchases.id')
                                    ->whereIn('expenses_and_purchases.status',[1,'P'])
                                    ->where('expenses_and_purchases.amount','<>',null)
                                    ->where('expenses_and_purchases.date','<=',$date_consult)
                                    ->where('expenses_and_purchases.id_provider',$id_provider)
                                    ->select('expenses_and_purchases.rate','expenses_and_purchases.date','expenses_and_purchases.id','expenses_and_purchases.serie','providers.razon_social as name_provider','expenses_and_purchases.amount','expenses_and_purchases.amount_with_iva', DB::raw('SUM(anticipos.amount/anticipos.rate) As amount_anticipo'))
                                    ->groupBy('expenses_and_purchases.rate','expenses_and_purchases.date','expenses_and_purchases.id','expenses_and_purchases.serie','providers.razon_social','expenses_and_purchases.amount','expenses_and_purchases.amount_with_iva')
                                    ->get();
            }
           
        }else{
            if((isset($coin)) && ($coin == "bolivares")){
                $expenses = DB::connection(Auth::user()->database_name)->table('expenses_and_purchases')
                                    ->join('providers', 'providers.id','=','expenses_and_purchases.id_provider')
                                    ->leftjoin('anticipos', 'anticipos.id_expense','=','expenses_and_purchases.id')
                                    ->whereIn('expenses_and_purchases.status',[1,'P'])
                                    ->where('expenses_and_purchases.amount','<>',null)
                                    ->where('expenses_and_purchases.date','<=',$date_consult)
                                    ->select('expenses_and_purchases.rate','expenses_and_purchases.date','expenses_and_purchases.id','expenses_and_purchases.serie','providers.razon_social as name_provider','expenses_and_purchases.amount','expenses_and_purchases.amount_with_iva', DB::raw('SUM(anticipos.amount) As amount_anticipo'))
                                    ->groupBy('expenses_and_purchases.rate','expenses_and_purchases.date','expenses_and_purchases.id','expenses_and_purchases.serie','providers.razon_social','expenses_and_purchases.amount','expenses_and_purchases.amount_with_iva')
                                    ->get();
            }else{
                $expenses = DB::connection(Auth::user()->database_name)->table('expenses_and_purchases')
                                    ->join('providers', 'providers.id','=','expenses_and_purchases.id_provider')
                                    ->leftjoin('anticipos', 'anticipos.id_expense','=','expenses_and_purchases.id')
                                    ->whereIn('expenses_and_purchases.status',[1,'P'])
                                    ->where('expenses_and_purchases.amount','<>',null)
                                    ->where('expenses_and_purchases.date','<=',$date_consult)
                                    ->select('expenses_and_purchases.rate','expenses_and_purchases.date','expenses_and_purchases.id','expenses_and_purchases.serie','providers.razon_social as name_provider','expenses_and_purchases.amount','expenses_and_purchases.amount_with_iva', DB::raw('SUM(anticipos.amount/anticipos.rate) As amount_anticipo'))
                                    ->groupBy('expenses_and_purchases.rate','expenses_and_purchases.date','expenses_and_purchases.id','expenses_and_purchases.serie','providers.razon_social','expenses_and_purchases.amount','expenses_and_purchases.amount_with_iva')
                                    ->get();
            }
        }
        
        $pdf = $pdf->loadView('admin.reports.debtstopay',compact('expenses','datenow','date_end','coin'));
        return $pdf->stream();
                 
    }


    function ledger_pdf($date_begin = null,$date_end = null)
    {
      
        $pdf = App::make('dompdf.wrapper');

        $company = Company::on(Auth::user()->database_name)->find(1);
        
        $date = Carbon::now();
        $datenow = $date->format('Y-m-d'); 
        $period = $date->format('Y'); 
       
        if(isset($date_begin)){
            $from = $date_begin;
        }
        if(isset($date_end)){
            $to = $date_end;
        }else{
            $to = $datenow;
        }

        $details = DB::connection(Auth::user()->database_name)->table('detail_vouchers')
                ->join('accounts', 'accounts.id','=','detail_vouchers.id_account')
                ->join('header_vouchers', 'header_vouchers.id','=','detail_vouchers.id_header_voucher')
                ->select('accounts.code_one','accounts.code_two','accounts.code_three'
                        ,'accounts.code_four','accounts.code_five','accounts.description as account_description'
                        ,'detail_vouchers.debe','detail_vouchers.haber'
                        ,'header_vouchers.description as header_description'
                        ,'header_vouchers.id as id_header'
                        ,'header_vouchers.date as date')
                ->orderBy('accounts.code_one','asc')
                ->orderBy('accounts.code_two','asc')
                ->orderBy('accounts.code_three','asc')
                ->orderBy('accounts.code_four','asc')
                ->orderBy('accounts.code_five','asc')
                ->get();
        
        $pdf = $pdf->loadView('admin.reports.ledger',compact('company','datenow','details','date_begin','date_end'));
        return $pdf->stream();
                 
    }


 

    function accounts_pdf($coin,$level,$date_begin = null,$date_end = null)
    {
        
        $pdf = App::make('dompdf.wrapper');

        
        $date = Carbon::now();
        $datenow = $date->format('Y-m-d'); 
        $period = $date->format('Y'); 
        $detail_old = DetailVoucher::on(Auth::user()->database_name)->orderBy('created_at','asc')->first();
        
        
        if(isset($date_begin)){
            $from = $date_begin;
        }else{
            $from = $detail_old->created_at->format('Y-m-d');
            
        }
        if(isset($date_end)){
            $to = $date_end;
        }else{
            $to = $datenow;
        }

        if(empty($level)){
            $level = 5;
        }


        if(isset($coin) && ($coin == "bolivares")){
            $accounts_all = $this->calculation($from,$to);
        }else{
            $accounts_all = $this->calculation_dolar("dolares");
        }
     
        $accounts = $accounts_all->filter(function($account) use ($level)
        {
          
            if($account->level <= $level){
                //aqui se valida que la cuentas de code_one de 4 para arriba no se toma en cuenta el balance previo
                if($account->code_one <= 3){
                    $total = $account->balance_previus + $account->debe - $account->haber;
                }else{
                    $total = $account->debe - $account->haber;
                }
                
                if ($total != 0) {
                    return $account;
                }
            }
            
        });

        
        
        $pdf = $pdf->loadView('admin.reports.accounts',compact('coin','datenow','accounts','level','detail_old','date_begin','date_end'))->setPaper('a4', 'landscape');
        return $pdf->stream();
                 
    }

    function bankmovements_pdf($type,$coin,$date_begin,$date_end,$account_bank = null)
    {
        
        $pdf = App::make('dompdf.wrapper');
        
        $date = Carbon::now();
        $datenow = $date->format('Y-m-d'); 
        $period = $date->format('Y'); 

        
        if(isset($account_bank)){

            if(isset($type) && ($type == 'Todo')){
                
                    $details_banks =   DB::connection(Auth::user()->database_name)->select(
                        'SELECT d.* ,h.description as header_description,h.id as header_id, 
                        h.reference as header_reference,h.date as header_date,
                        a.description as account_description,a.code_one as account_code_one,
                        a.code_two as account_code_two,a.code_three as account_code_three,
                        a.code_four as account_code_four,a.code_five as account_code_five
                        FROM header_vouchers h
                        INNER JOIN detail_vouchers d 
                            ON d.id_header_voucher = h.id
                        INNER JOIN accounts a
                            ON d.id_account = a.id


                        WHERE d.id_header_voucher IN ( SELECT de.id_header_voucher FROM detail_vouchers de WHERE de.id_account = ? ) AND
                        (DATE_FORMAT(d.created_at, "%Y-%m-%d") >= ? AND DATE_FORMAT(d.created_at, "%Y-%m-%d") <= ?) AND
                        (h.description LIKE "Deposito%" OR
                        h.description LIKE "Retiro%" OR
                        h.description LIKE "Transferencia%")'
                        , [$account_bank,$date_begin, $date_end]);
                

            }else if (isset($type)){
               
                $details_banks =   DB::connection(Auth::user()->database_name)->select(
                    'SELECT d.* ,h.description as header_description,h.id as header_id, 
                    h.reference as header_reference,h.date as header_date,
                    a.description as account_description,a.code_one as account_code_one,
                    a.code_two as account_code_two,a.code_three as account_code_three,
                    a.code_four as account_code_four,a.code_five as account_code_five
                    FROM header_vouchers h
                    INNER JOIN detail_vouchers d 
                        ON d.id_header_voucher = h.id
                    INNER JOIN accounts a
                        ON d.id_account = a.id
    
    
                    WHERE d.id_header_voucher IN ( SELECT de.id_header_voucher FROM detail_vouchers de WHERE de.id_account = ? ) AND
                    (DATE_FORMAT(d.created_at, "%Y-%m-%d") >= ? AND DATE_FORMAT(d.created_at, "%Y-%m-%d") <= ?) AND
                    (h.description LIKE ?)'
                    , [$account_bank,$date_begin, $date_end,$type."%"]);
                
            }
            
        }else{
            if(isset($type) && ($type == 'Todo')){
                $details_banks = DB::connection(Auth::user()->database_name)->table('detail_vouchers')
                ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                ->join('accounts', 'accounts.id', '=', 'detail_vouchers.id_account')
                ->whereRaw(
                    "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                    [$date_begin, $date_end])
                ->where(function($query) {
                    $query->where('header_vouchers.description','LIKE','Deposito%')
                        ->orwhere('header_vouchers.description','LIKE','Retiro%')
                        ->orwhere('header_vouchers.description','LIKE','Transferencia%');
                })
                ->select('detail_vouchers.*','header_vouchers.description as header_description','header_vouchers.id as header_id', 
                'header_vouchers.reference as header_reference','header_vouchers.date as header_date',
                'accounts.description as account_description','accounts.code_one as account_code_one',
                'accounts.code_two as account_code_two','accounts.code_three as account_code_three',
                'accounts.code_four as account_code_four','accounts.code_five as account_code_five')
                ->orderBy('header_vouchers.id','desc')
                ->get();
            }else if (isset($type)){
                $details_banks = DB::connection(Auth::user()->database_name)->table('detail_vouchers')
                ->join('header_vouchers', 'header_vouchers.id', '=', 'detail_vouchers.id_header_voucher')
                ->join('accounts', 'accounts.id', '=', 'detail_vouchers.id_account')
                ->whereRaw(
                    "(DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(detail_vouchers.created_at, '%Y-%m-%d') <= ?)", 
                    [$date_begin, $date_end])
                ->where('header_vouchers.description','LIKE',$type.'%')
                ->select('detail_vouchers.*','header_vouchers.description as header_description','header_vouchers.id as header_id', 
                'header_vouchers.reference as header_reference','header_vouchers.date as header_date',
                'accounts.description as account_description','accounts.code_one as account_code_one',
                'accounts.code_two as account_code_two','accounts.code_three as account_code_three',
                'accounts.code_four as account_code_four','accounts.code_five as account_code_five')
                ->orderBy('header_vouchers.id','desc')
                ->get();
            }
        }
        
       
        
        $pdf = $pdf->loadView('admin.reports.bankmovements',compact('details_banks','coin','datenow','date_begin','date_end'))->setPaper('a4', 'landscape');
        return $pdf->stream();
                 
    }

    function sales_books_pdf($coin,$date_begin,$date_end)
    {
        
        $pdf = App::make('dompdf.wrapper');

        
        $date = Carbon::now();
        $datenow = $date->format('d-m-Y'); 
        $period = $date->format('Y'); 
        $quotations = Quotation::on(Auth::user()->database_name)
                                    ->where('date_billing','<>',null)
                                    ->whereRaw(
                                        "(DATE_FORMAT(date_billing, '%Y-%m-%d') >= ? AND DATE_FORMAT(date_billing, '%Y-%m-%d') <= ?)", 
                                        [$date_begin, $date_end])
                                    ->orderBy('date_billing','desc')->get();

        $date_begin = Carbon::parse($date_begin);
        $date_begin = $date_begin->format('d-m-Y');
        $date_end = Carbon::parse($date_end);
        $date_end = $date_end->format('d-m-Y');


        $pdf = $pdf->loadView('admin.reports.sales_books',compact('coin','quotations','datenow','date_begin','date_end'))->setPaper('a4', 'landscape');
        return $pdf->stream();
                 
    }

    function purchases_book_pdf($coin,$date_begin,$date_end)
    {
        
        $pdf = App::make('dompdf.wrapper');

        $date = Carbon::now();
        $datenow = $date->format('d-m-Y'); 
        $period = $date->format('Y'); 
        $expenses = ExpensesAndPurchase::on(Auth::user()->database_name)
                                    ->where('amount','<>',null)
                                    ->whereRaw(
                                        "(DATE_FORMAT(date, '%Y-%m-%d') >= ? AND DATE_FORMAT(date, '%Y-%m-%d') <= ?)", 
                                        [$date_begin, $date_end])
                                    ->orderBy('date','desc')->get();

        $total_exento = ExpensesDetail::on(Auth::user()->database_name)
                                    ->where('exento','1')
                                    ->whereRaw(
                                        "(DATE_FORMAT(created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(created_at, '%Y-%m-%d') <= ?)", 
                                        [$date_begin, $date_end])
                                    ->select(DB::connection(Auth::user()->database_name)->raw('SUM(price*amount) as total'))->get();

        $total_exento = $total_exento[0]->total;

        $date_begin = Carbon::parse($date_begin);
        $date_begin = $date_begin->format('d-m-Y');
        $date_end = Carbon::parse($date_end);
        $date_end = $date_end->format('d-m-Y');


        $pdf = $pdf->loadView('admin.reports.purchases_books',compact('coin','expenses','datenow','date_begin','date_end','total_exento'))->setPaper('a4', 'landscape');
        return $pdf->stream();
                 
    }

    function inventory_pdf($coin,$date_begin,$date_end,$name = null)
    {
        
        $pdf = App::make('dompdf.wrapper');

        $date = Carbon::now();
        $datenow = $date->format('d-m-Y'); 
        $period = $date->format('Y'); 


        if(isset($name)){
            $products = Product::on(Auth::user()->database_name)
            ->join('inventories', 'inventories.product_id', '=', 'products.id')
            ->where('products.description','LIKE',$name.'%')
            ->whereRaw(
                "(DATE_FORMAT(products.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(products.created_at, '%Y-%m-%d') <= ?)", 
                [$date_begin, $date_end])
            ->orderBy('products.description','asc')->get();
        }else{
            $products = Product::on(Auth::user()->database_name)
            ->join('inventories', 'inventories.product_id', '=', 'products.id')
            ->whereRaw(
                "(DATE_FORMAT(products.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(products.created_at, '%Y-%m-%d') <= ?)", 
                [$date_begin, $date_end])
            ->orderBy('products.description','asc')->get();
        }
        

        $date_begin = Carbon::parse($date_begin);
        $date_begin = $date_begin->format('d-m-Y');

        $date_end = Carbon::parse($date_end);
        $date_end = $date_end->format('d-m-Y');

        $company = Company::on(Auth::user()->database_name)->find(1);
        //Si la taza es automatica
        if($company->tiporate_id == 1){
            $rate = $this->search_bcv();
        }else{
            //si la tasa es fija
            $rate = $company->rate;
        }

        $pdf = $pdf->loadView('admin.reports.inventory',compact('rate','coin','products','datenow','date_begin','date_end'))->setPaper('a4', 'landscape');
        return $pdf->stream();
                 
    }

    function operating_margin_pdf($coin,$date_begin,$date_end)
    {
        
        $pdf = App::make('dompdf.wrapper');

        $date = Carbon::now();
        $datenow = $date->format('d-m-Y'); 
        $period = $date->format('Y'); 

        $date_begin = Carbon::parse($date_begin);
        $from = $date_begin->format('Y-m-d');
        $date_begin = $date_begin->format('d-m-Y');

        $date_end = Carbon::parse($date_end);
        $to = $date_end->format('Y-m-d');
        $date_end = $date_end->format('d-m-Y');

       

        if(isset($coin) && ($coin == "bolivares")){
            $accounts_all = $this->calculation($from,$to);
        }else{
            $accounts_all = $this->calculation_dolar("dolares");
        }
      
        $ventas = 0;
        $costos = 0;
        $gastos = 0;
        $utilidad = 0;
        $margen_operativo = 0;
        $gastos_costos = 0;
        $rentabilidad = 0;


        foreach($accounts_all as $account){
            if(($account->code_one == 4) && ($account->code_two == 0) && ($account->code_three == 0) && ($account->code_four == 0) && ($account->code_five == 0) ){
                $ventas = $account->debe - $account->haber;
            }
            if(($account->code_one == 5) && ($account->code_two == 0) && ($account->code_three == 0) && ($account->code_four == 0) && ($account->code_five == 0) ){
                $costos = $account->debe - $account->haber;
            }
            if(($account->code_one == 6) && ($account->code_two == 0) && ($account->code_three == 0) && ($account->code_four == 0) && ($account->code_five == 0) ){
                $gastos = $account->debe - $account->haber;
            }
        }

        $ventas = $ventas * -1;

        $utilidad = $ventas - $costos - $gastos;
        $gastos_costos = $gastos + $costos;

        if(($utilidad > 0) && ($ventas >0)){
            $margen_operativo = ($utilidad / $ventas) * 100;
        }else{
            
            if(($utilidad > 0)){
                $margen_operativo = $utilidad;
            }else{
                $margen_operativo = $ventas;
            }
        }

        //RENTABILIDAD
        if(($utilidad > 0) && ($gastos_costos > 0)){
            $rentabilidad = ($utilidad/$gastos_costos) * 100;
        }else{
            
            if(($utilidad > 0)){
                $margen_operativo = $utilidad * 100;
            }else{
                $margen_operativo = $gastos_costos * 100;
            }
        }
       
        $pdf = $pdf->loadView('admin.reports.operating_margin',compact('rentabilidad','margen_operativo','utilidad','ventas','costos','gastos','coin','datenow','date_begin','date_end'));
        return $pdf->stream();
                 
    }

    function clients_pdf($date_begin,$date_end,$name = null)
    {
        
        $pdf = App::make('dompdf.wrapper');

        $date = Carbon::now();
        $datenow = $date->format('d-m-Y'); 
        $period = $date->format('Y'); 


        if(isset($name)){
            $clients = Client::on(Auth::user()->database_name)
            ->where('name','LIKE',$name.'%')
            ->whereRaw(
                "(DATE_FORMAT(created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(created_at, '%Y-%m-%d') <= ?)", 
                [$date_begin, $date_end])
            ->orderBy('name','asc')->get();
        }else{
            $clients = Client::on(Auth::user()->database_name)
            ->whereRaw(
                "(DATE_FORMAT(created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(created_at, '%Y-%m-%d') <= ?)", 
                [$date_begin, $date_end])
            ->orderBy('name','asc')->get();
        }
        

        $date_begin = Carbon::parse($date_begin);
        $date_begin = $date_begin->format('d-m-Y');

        $date_end = Carbon::parse($date_end);
        $date_end = $date_end->format('d-m-Y');

       
        $pdf = $pdf->loadView('admin.reports.clients',compact('clients','datenow','date_begin','date_end'))->setPaper('a4', 'landscape');
        return $pdf->stream();
                 
    }

    function providers_pdf($date_begin,$date_end,$name = null)
    {
        
        $pdf = App::make('dompdf.wrapper');

        $date = Carbon::now();
        $datenow = $date->format('d-m-Y'); 
        $period = $date->format('Y'); 


        if(isset($name)){
            $providers = Provider::on(Auth::user()->database_name)
            ->where('razon_social','LIKE',$name.'%')
            ->whereRaw(
                "(DATE_FORMAT(created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(created_at, '%Y-%m-%d') <= ?)", 
                [$date_begin, $date_end])
            ->orderBy('razon_social','asc')->get();
        }else{
            $providers = Provider::on(Auth::user()->database_name)
            ->whereRaw(
                "(DATE_FORMAT(created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(created_at, '%Y-%m-%d') <= ?)", 
                [$date_begin, $date_end])
            ->orderBy('razon_social','asc')->get();
        }
        

        $date_begin = Carbon::parse($date_begin);
        $date_begin = $date_begin->format('d-m-Y');

        $date_end = Carbon::parse($date_end);
        $date_end = $date_end->format('d-m-Y');

       
        $pdf = $pdf->loadView('admin.reports.providers',compact('providers','datenow','date_begin','date_end'))->setPaper('a4', 'landscape');
        return $pdf->stream();
                 
    }

    function employees_pdf($date_begin,$date_end,$name = null)
    {
        
        $pdf = App::make('dompdf.wrapper');

        $date = Carbon::now();
        $datenow = $date->format('d-m-Y'); 
        $period = $date->format('Y'); 


        if(isset($name)){
            $employees = Employee::on(Auth::user()->database_name)
            ->where('nombres','LIKE',$name.'%')
            ->whereRaw(
                "(DATE_FORMAT(created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(created_at, '%Y-%m-%d') <= ?)", 
                [$date_begin, $date_end])
            ->orderBy('nombres','asc')->get();
        }else{
            $employees = Employee::on(Auth::user()->database_name)
            ->whereRaw(
                "(DATE_FORMAT(created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(created_at, '%Y-%m-%d') <= ?)", 
                [$date_begin, $date_end])
            ->orderBy('nombres','asc')->get();
        }
        

        $date_begin = Carbon::parse($date_begin);
        $date_begin = $date_begin->format('d-m-Y');

        $date_end = Carbon::parse($date_end);
        $date_end = $date_end->format('d-m-Y');

       
        $pdf = $pdf->loadView('admin.reports.employees',compact('employees','datenow','date_begin','date_end'))->setPaper('a4', 'landscape');
        return $pdf->stream();
                 
    }

    function sales_pdf($coin,$date_begin,$date_end,$name = null)
    {
        
        $pdf = App::make('dompdf.wrapper');

        $date = Carbon::now();
        $datenow = $date->format('d-m-Y'); 
        $period = $date->format('Y'); 

        if(isset($name)){
            $sales = Product::on(Auth::user()->database_name)
            ->join('inventories', 'inventories.product_id', '=', 'products.id')
            ->join('quotation_products', 'quotation_products.id_inventory', '=', 'inventories.id')
            ->join('segments', 'segments.id', '=', 'products.segment_id')
            ->join('subsegments', 'subsegments.id', '=', 'products.subsegment_id')
            ->where('quotation_products.status','C')
            ->where('products.description','LIKE',$name.'%')
            ->whereRaw(
                "(DATE_FORMAT(quotation_products.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(quotation_products.created_at, '%Y-%m-%d') <= ?)", 
                [$date_begin, $date_end])
            ->select('products.description', DB::connection(Auth::user()->database_name)->raw('SUM(quotation_products.amount) as amount_sales'), DB::connection(Auth::user()->database_name)->raw('SUM(quotation_products.price*quotation_products.amount) as price_sales'), DB::connection(Auth::user()->database_name)->raw('SUM(quotation_products.price*quotation_products.amount/quotation_products.rate) as price_sales_dolar'),'products.type','products.price as price','inventories.code','products.money as money','segments.description as segment_description','subsegments.description as subsegment_description')
            ->groupBy('products.description','products.type','products.price','inventories.code','products.money','segments.description','subsegments.description')
            ->orderBy('products.description','asc')->get();
           
        }else{
            $sales = Product::on(Auth::user()->database_name)
            ->join('inventories', 'inventories.product_id', '=', 'products.id')
            ->join('quotation_products', 'quotation_products.id_inventory', '=', 'inventories.id')
            ->join('segments', 'segments.id', '=', 'products.segment_id')
            ->join('subsegments', 'subsegments.id', '=', 'products.subsegment_id')
            ->where('quotation_products.status','C')
            ->whereRaw(
                "(DATE_FORMAT(quotation_products.created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(quotation_products.created_at, '%Y-%m-%d') <= ?)", 
                [$date_begin, $date_end])
            ->select('products.description', DB::connection(Auth::user()->database_name)->raw('SUM(quotation_products.amount) as amount_sales'), DB::connection(Auth::user()->database_name)->raw('SUM(quotation_products.price*quotation_products.amount) as price_sales'), DB::connection(Auth::user()->database_name)->raw('SUM(quotation_products.price*quotation_products.amount/quotation_products.rate) as price_sales_dolar'),'products.type','products.price as price','inventories.code','products.money as money','segments.description as segment_description','subsegments.description as subsegment_description')
            ->groupBy('products.description','products.type','products.price','inventories.code','products.money','segments.description','subsegments.description')
            ->orderBy('products.description','asc')->get();
        }
        
        $date_begin = Carbon::parse($date_begin);
        $date_begin = $date_begin->format('d-m-Y');

        $date_end = Carbon::parse($date_end);
        $date_end = $date_end->format('d-m-Y');

        $company = Company::on(Auth::user()->database_name)->find(1);
        //Si la taza es automatica
        if($company->tiporate_id == 1){
            $rate = $this->search_bcv();
        }else{
            //si la tasa es fija
            $rate = $company->rate;
        }

       
        $pdf = $pdf->loadView('admin.reports.sales',compact('coin','rate','sales','datenow','date_begin','date_end'))->setPaper('a4', 'landscape');
        return $pdf->stream();
                 
    }

    function accounts_receivable_note_pdf($coin,$date_end,$typeinvoice,$typeperson = 'todo',$id_client_or_vendor = null,$fecha_frist = null)
    {
        

        
        //dd('Moneda: '.$coin.' Hasta: '.$date_end.' ID-Cliente-Vend: '.$id_client_or_vendor.' Tipo: '.$typeinvoice.' Persona: '.$typeperson.' Fecha frist ');
    

        $pdf = App::make('dompdf.wrapper');
        $quotations = null;
        
        $date = Carbon::now();
        $datenow = $date->format('d-m-Y'); 
        
        $global = new GlobalController();
        
        if (empty($fecha_frist) || $fecha_frist == null){
            $fecha_frist = $global->data_first_month_day();   
        } 

        if(empty($date_end)){
            $date_end = $datenow;

            $date_consult = $date->format('Y-m-d'); 
        }else{
            $date_end = Carbon::parse($date_end)->format('d-m-Y');

            $date_consult = Carbon::parse($date_end)->format('Y-m-d');
        }
        
        $period = $date->format('Y'); 
        

        if(isset($typeperson) && ($typeperson == 'Cliente')){ // cliente
            if(isset($coin) && $coin == 'bolivares'){ // nota cliente bs
                if(isset($typeinvoice) && ($typeinvoice == 'notas')){  // nota cliente bs
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                     ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                    ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                    ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                    ->whereIn('quotations.status',[1,'P'])
                    ->where('quotations.date_delivery_note','>=',$fecha_frist)
                    ->where('quotations.date_delivery_note','<=',$date_consult)
                    ->where('quotations.date_billing',null)
                    ->where('quotations.id_client',$id_client_or_vendor)
                    ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount) As amount_anticipo'))
                    ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                    ->orderBy('quotations.date_delivery_note','desc')
                    ->get();
                }
                    
               if(isset($typeinvoice) && ($typeinvoice == 'facturas')){ // nota a factura pendiente por cobrar cliente bs
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                     ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                    ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                    ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                    ->whereIn('quotations.status',['P'])
                    ->where('quotations.date_billing','<>',null)
                    ->where('quotations.date_delivery_note','>=',$fecha_frist)
                    ->where('quotations.date_delivery_note','<=',$date_consult)
                    ->where('quotations.number_invoice','<>',null)
                    ->where('quotations.number_delivery_note','<>',null)
                    ->where('quotations.id_client',$id_client_or_vendor)
                    ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount) As amount_anticipo'))
                    ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                    ->orderBy('quotations.date_billing','desc')
                    ->get();
                } 
                
                if(isset($typeinvoice) && ($typeinvoice == 'facturasc')){ // facturas cobradas cliente bs
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                     ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                    ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                    ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                    ->whereIn('quotations.status',['C'])
                    ->where('quotations.date_billing','<>',null)
                    ->where('quotations.date_delivery_note','>=',$fecha_frist)
                    ->where('quotations.date_delivery_note','<=',$date_consult)
                    ->where('quotations.number_invoice','<>',null)
                    ->where('quotations.number_delivery_note','<>',null)
                    ->where('quotations.id_client',$id_client_or_vendor)
                    ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount) As amount_anticipo'))
                    ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                    ->orderBy('quotations.date_billing','desc')
                    ->get();
                }
                
                if(isset($typeinvoice) && ($typeinvoice == 'notase')){ // nota eliminada cliente bs
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                    ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                    ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                    ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                    ->whereIn('quotations.status',['X'])
                    ->where('quotations.date_delivery_note','>=',$fecha_frist)
                    ->where('quotations.date_delivery_note','<=',$date_consult)
                    ->where('quotations.date_billing',null)
                    ->where('quotations.id_client',$id_client_or_vendor)
                    ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount) As amount_anticipo'))
                    ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                    ->orderBy('quotations.date_delivery_note','desc')
                    ->get();
                }

                 if(isset($typeinvoice) && ($typeinvoice == 'todo')){ // todas cliente bs
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                                         ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                                        ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                                        ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                                        ->where('quotations.amount','<>',null)
                                        ->where('quotations.date_delivery_note','>=',$fecha_frist)
                                        ->where('quotations.date_delivery_note','<=',$date_consult )          
                                        ->where('quotations.id_client',$id_client_or_vendor)                                    
                                        ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount) As amount_anticipo'))
                                        ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                                        ->orderBy('quotations.date_quotation','desc')
                                        ->get();
                }

            }else{ // notas cliente en dolares

                //PARA CUANDO EL REPORTE ESTE EN DOLARES
                if(isset($typeinvoice) && ($typeinvoice == 'notas')){ // nota cliente $
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                    ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                    ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                    ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                    ->whereIn('quotations.status',[1,'P'])
                    ->where('quotations.date_delivery_note','>=',$fecha_frist)
                    ->where('quotations.date_delivery_note','<=',$date_consult)
                    ->where('quotations.date_billing',null)
                    ->where('quotations.id_client',$id_client_or_vendor)
                    ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount / anticipos.rate) As amount_anticipo'))
                    ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                    ->orderBy('quotations.date_delivery_note','desc')
                    ->get();
                }
                
                if(isset($typeinvoice) && ($typeinvoice == 'facturas')){ // factura cliente $
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                    ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                    ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                    ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                    ->whereIn('quotations.status',['P'])
                    ->where('quotations.date_billing','<>',null)
                    ->where('quotations.date_delivery_note','>=',$fecha_frist)
                    ->where('quotations.date_delivery_note','<=',$date_consult)
                    ->where('quotations.number_invoice','<>',null)
                    ->where('quotations.number_delivery_note','<>',null)
                    ->where('quotations.id_client',$id_client_or_vendor)
                    
                    ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount / anticipos.rate) As amount_anticipo'))
                    ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                    ->orderBy('quotations.date_billing','desc')
                    ->get();
                }
                if(isset($typeinvoice) && ($typeinvoice == 'facturasc')){ // facturas cobradas cliente bs
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                     ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                    ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                    ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                    ->whereIn('quotations.status',['C'])
                    ->where('quotations.date_billing','<>',null)
                    ->where('quotations.date_delivery_note','>=',$fecha_frist)
                    ->where('quotations.date_delivery_note','<=',$date_consult)
                    ->where('quotations.number_invoice','<>',null)
                    ->where('quotations.number_delivery_note','<>',null)
                    ->where('quotations.id_client',$id_client_or_vendor)
                    ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount / anticipos.rate) As amount_anticipo'))
                    ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                    ->orderBy('quotations.date_billing','desc')
                    ->get();
                }
                
                if(isset($typeinvoice) && ($typeinvoice == 'notase')){ // nota eliminada cliente bs
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                    ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                    ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                    ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                    ->whereIn('quotations.status',['X'])
                    ->where('quotations.date_delivery_note','>=',$fecha_frist)
                    ->where('quotations.date_delivery_note','<=',$date_consult)
                    ->where('quotations.date_billing',null)
                    ->where('quotations.id_client',$id_client_or_vendor)
                    ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount / anticipos.rate) As amount_anticipo'))
                    ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                    ->orderBy('quotations.date_billing','desc')
                    ->get();
                }                
                if(isset($typeinvoice) && ($typeinvoice == 'todo')){ // Todas cliente $
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                                         ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                                        ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                                        ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                                        ->whereIn('quotations.status',[1,'P'])
                                        ->where('quotations.amount','<>',null)
                                        ->where('quotations.date_delivery_note','>=',$fecha_frist)
                                        ->where('quotations.date_delivery_note','<=',$date_consult)
                                        ->where('quotations.id_client',$id_client_or_vendor)
                                        
                                        ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount / anticipos.rate) As amount_anticipo'))
                                        ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                                        ->orderBy('quotations.date_quotation','desc')
                                        ->get();
                }
            }
        }
        
        if(isset($typeperson) && $typeperson == 'Vendedor'){ // Vendedor
            if(isset($coin) && $coin == 'bolivares'){ // nota vendedor bs
                if(isset($typeinvoice) && ($typeinvoice == 'notas')){  // nota vendedor bs
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                     ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                    ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                    ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                    ->whereIn('quotations.status',[1,'P'])
                    ->where('quotations.date_delivery_note','>=',$fecha_frist)
                    ->where('quotations.date_delivery_note','<=',$date_consult)
                    ->where('quotations.date_billing',null)
                    ->where('quotations.id_vendor',$id_client_or_vendor)
                    ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount) As amount_anticipo'))
                    ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                    ->orderBy('quotations.date_delivery_note','desc')
                    ->get();
                }
                    
               if(isset($typeinvoice) && ($typeinvoice == 'facturas')){ // nota a factura pendiente por cobrar vendedor bs
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                     ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                    ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                    ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                    ->whereIn('quotations.status',['P'])
                    ->where('quotations.date_billing','<>',null)
                    ->where('quotations.date_delivery_note','>=',$fecha_frist)
                    ->where('quotations.date_delivery_note','<=',$date_consult)
                    ->where('quotations.number_invoice','<>',null)
                    ->where('quotations.number_delivery_note','<>',null)
                    ->where('quotations.id_vendor',$id_client_or_vendor)
                    ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount) As amount_anticipo'))
                    ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                    ->orderBy('quotations.date_billing','desc')
                    ->get();
                } 
                
                if(isset($typeinvoice) && ($typeinvoice == 'facturasc')){ // facturas cobradas cliente bs
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                     ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                    ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                    ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                    ->whereIn('quotations.status',['C'])
                    ->where('quotations.date_billing','<>',null)
                    ->where('quotations.date_delivery_note','>=',$fecha_frist)
                    ->where('quotations.date_delivery_note','<=',$date_consult)
                    ->where('quotations.number_invoice','<>',null)
                    ->where('quotations.number_delivery_note','<>',null)
                    ->where('quotations.id_vendor',$id_client_or_vendor)
                    ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount) As amount_anticipo'))
                    ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                    ->orderBy('quotations.date_billing','desc')
                    ->get();
                }
                
                if(isset($typeinvoice) && ($typeinvoice == 'notase')){ // nota eliminada vendedor bs
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                    ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                    ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                    ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                    ->whereIn('quotations.status',['X'])
                    ->where('quotations.date_delivery_note','>=',$fecha_frist)
                    ->where('quotations.date_delivery_note','<=',$date_consult)
                    ->where('quotations.date_billing',null)
                    ->where('quotations.id_vendor',$id_client_or_vendor)
                    ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount) As amount_anticipo'))
                    ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                    ->orderBy('quotations.date_delivery_note','desc')
                    ->get();
                }

                 if(isset($typeinvoice) && ($typeinvoice == 'todo')){ // todas vendedor bs
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                                         ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                                        ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                                        ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                                        ->where('quotations.amount','<>',null)
                                        ->where('quotations.date_delivery_note','>=',$fecha_frist)
                                        ->where('quotations.date_delivery_note','<=',$date_consult )          
                                        ->where('quotations.id_vendor',$id_client_or_vendor)                                    
                                        ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount) As amount_anticipo'))
                                        ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                                        ->orderBy('quotations.date_quotation','desc')
                                        ->get();
                }

            }else{ // notas id_vendor en dolares

                //PARA CUANDO EL REPORTE ESTE EN DOLARES
                if(isset($typeinvoice) && ($typeinvoice == 'notas')){ // nota id_vendor $
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                    ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                    ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                    ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                    ->whereIn('quotations.status',[1,'P'])
                    ->where('quotations.date_delivery_note','>=',$fecha_frist)
                    ->where('quotations.date_delivery_note','<=',$date_consult)
                    ->where('quotations.date_billing',null)
                    ->where('quotations.id_vendor',$id_client_or_vendor)
                    ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount / anticipos.rate) As amount_anticipo'))
                    ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                    ->orderBy('quotations.date_delivery_note','desc')
                    ->get();
                }
                
                if(isset($typeinvoice) && ($typeinvoice == 'facturas')){ // factura id_vendor $
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                    ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                    ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                    ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                    ->whereIn('quotations.status',['P'])
                    ->where('quotations.date_billing','<>',null)
                    ->where('quotations.date_delivery_note','>=',$fecha_frist)
                    ->where('quotations.date_delivery_note','<=',$date_consult)
                    ->where('quotations.number_invoice','<>',null)
                    ->where('quotations.number_delivery_note','<>',null)
                    ->where('quotations.id_vendor',$id_client_or_vendor)
                    
                    ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount / anticipos.rate) As amount_anticipo'))
                    ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                    ->orderBy('quotations.date_billing','desc')
                    ->get();
                }
                if(isset($typeinvoice) && ($typeinvoice == 'facturasc')){ // facturas cobradas id_vendor bs
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                     ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                    ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                    ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                    ->whereIn('quotations.status',['C'])
                    ->where('quotations.date_billing','<>',null)
                    ->where('quotations.date_delivery_note','>=',$fecha_frist)
                    ->where('quotations.date_delivery_note','<=',$date_consult)
                    ->where('quotations.number_invoice','<>',null)
                    ->where('quotations.number_delivery_note','<>',null)
                    ->where('quotations.id_vendor',$id_client_or_vendor)
                    ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount / anticipos.rate) As amount_anticipo'))
                    ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                    ->orderBy('quotations.date_billing','desc')
                    ->get();
                }
                
                if(isset($typeinvoice) && ($typeinvoice == 'notase')){ // nota eliminada id_vendorbs
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                    ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                    ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                    ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                    ->whereIn('quotations.status',['X'])
                    ->where('quotations.date_delivery_note','>=',$fecha_frist)
                    ->where('quotations.date_delivery_note','<=',$date_consult)
                    ->where('quotations.date_billing',null)
                    ->where('quotations.id_vendor',$id_client_or_vendor)
                    ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount / anticipos.rate) As amount_anticipo'))
                    ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                    ->orderBy('quotations.date_billing','desc')
                    ->get();
                }                
                if(isset($typeinvoice) && ($typeinvoice == 'todo')){ // Todas id_vendor $
                    $quotations = DB::connection(Auth::user()->database_name)->table('quotations')
                                         ->leftjoin('clients', 'clients.id','=','quotations.id_client')
                                        ->leftjoin('vendors', 'vendors.id','=','quotations.id_vendor')
                                        ->leftjoin('anticipos', 'anticipos.id_quotation','=','quotations.id')
                                        ->whereIn('quotations.status',[1,'P'])
                                        ->where('quotations.amount','<>',null)
                                        ->where('quotations.date_delivery_note','>=',$fecha_frist)
                                        ->where('quotations.date_delivery_note','<=',$date_consult)
                                        ->where('quotations.id_vendor',$id_client_or_vendor)
                                        
                                        ->select('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name as name_vendor','vendors.surname as surname_vendor','clients.name as name_client','quotations.amount','quotations.amount_with_iva', DB::raw('SUM(anticipos.amount / anticipos.rate) As amount_anticipo'))
                                        ->groupBy('quotations.date_billing','quotations.date_delivery_note','quotations.status','quotations.retencion_islr','quotations.retencion_iva','quotations.bcv','quotations.number_invoice','quotations.number_delivery_note','quotations.date_quotation','quotations.id','quotations.serie','vendors.name','vendors.surname','clients.name','quotations.amount','quotations.amount_with_iva')
                                        ->orderBy('quotations.date_quotation','desc')
                                        ->get();
                }
            }  
            
        }
        
        if(isset($typeperson) && $typeperson == 'todo'){ // todas Bs
           
            dd($typeperson);
        }
        
        $pdf = $pdf->loadView('admin.reports.accounts_receivable_note',compact('coin','quotations','datenow','date_end','fecha_frist'));
        return $pdf->stream();
                 
    }

   

    public function select_client_note()
    {

        $clients    = Client::on(Auth::user()->database_name)->get();
        return view('admin.reports.selectclient_note',compact('clients'));
    }

    
    public function select_vendor_note()
    {
        $vendors    = Vendor::on(Auth::user()->database_name)->get();
    
        return view('admin.reports.selectvendor_note',compact('vendors'));
    }


    public function select_provider()
    {
        $providers    = Provider::on(Auth::user()->database_name)->get();
    
        return view('admin.reports.selectprovider',compact('providers'));
    }
    

    public function search_bcv()
    {
        /*Buscar el indice bcv*/
        $urlToGet ='http://www.bcv.org.ve/tasas-informativas-sistema-bancario';
        $pageDocument = @file_get_contents($urlToGet);
        preg_match_all('|<div class="col-sm-6 col-xs-6 centrado"><strong> (.*?) </strong> </div>|s', $pageDocument, $cap);

        if ($cap[0] == array()){ // VALIDAR Concidencia
            $titulo = '0,00';
        }else {
            $titulo = $cap[1][4];
        }

        $bcv_con_formato = $titulo;
        $bcv = str_replace(',', '.', str_replace('.', '',$bcv_con_formato));


        /*-------------------------- */
       return bcdiv($bcv, '1', 2);

    }

}
