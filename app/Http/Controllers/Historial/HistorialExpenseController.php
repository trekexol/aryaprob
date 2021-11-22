<?php

namespace App\Http\Controllers\Historial;

use App\HistorialExpense;
use App;
use App\Http\Controllers\Controller;
use App\Http\Controllers\UserAccess\UserAccessController;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class HistorialExpenseController extends Controller
{
    public $userAccess;
    public $modulo = 'Historial';

 
    public function __construct(){

       $this->middleware('auth');
       $this->userAccess = new UserAccessController();
   }

   public function index($id_user = null)
   {
        $userAccess = new UserAccessController();

        if($userAccess->validate_user_access($this->modulo)){
            $historials = HistorialExpense::on(Auth::user()->database_name)->get();
            $date = Carbon::now();
            $datenow = $date->format('d-m-Y'); 
            $user = null;

            if(isset($id_user)){
                $user   =   User::on(Auth::user()->database_name)->find($id_user);   
            }

            return view('admin.historials.expenses.index_historial_expense',compact('historials','datenow','user'));
        }else{
            return redirect('/home')->withDanger('No tiene Acceso al modulo de '.$this->modulo);
        }

      
   }

   public function store(Request $request)
   {
        $user = null;
        $date_begin = request('date_begin');
        $date_end = request('date_end');
        if(isset($request->id_user)){
            $user   =   User::on(Auth::user()->database_name)->find($request->id_user);   
        }
      
        return view('admin.historials.expenses.index_historial_expense',compact('date_end','user','date_begin'));
   }

   function pdf($date_begin,$date_end,$id_user = null)
   {
       $user = null;
       $pdf = App::make('dompdf.wrapper');
       $expenses = null;
       
       $date = Carbon::now();
       $datenow = $date->format('d-m-Y'); 
       if(empty($date_end)){
           $date_end = $datenow;

           $date_consult = $date->format('Y-m-d'); 
       }else{
           $date_end = Carbon::parse($date_end)->format('d-m-Y');

           $date_end_consult = Carbon::parse($date_end)->format('Y-m-d');
       }

       if(empty($date_begin)){
            $date_begin = $datenow;

            $date_consult = $date->format('Y-m-d'); 
        }else{
            $date_begin = Carbon::parse($date_begin)->format('d-m-Y');

            $date_begin_consult = Carbon::parse($date_begin)->format('Y-m-d');
        }
       
       $period = $date->format('Y'); 

       if(isset($id_user)){
            $historials    = HistorialExpense::on(Auth::user()->database_name)
                                                ->whereRaw(
                                                    "(DATE_FORMAT(created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(created_at, '%Y-%m-%d') <= ?)", 
                                                    [$date_begin_consult, $date_end_consult])
                                                ->where('id_user',$id_user)
                                                ->orderBy('created_at','desc')
                                                ->get();
            $user   =   User::on(Auth::user()->database_name)->find($id_user);             
       }else{
            $historials    = HistorialExpense::on(Auth::user()->database_name)
                                                ->whereRaw(
                                                    "(DATE_FORMAT(created_at, '%Y-%m-%d') >= ? AND DATE_FORMAT(created_at, '%Y-%m-%d') <= ?)", 
                                                    [$date_begin_consult, $date_end_consult])
                                                ->orderBy('created_at','desc')
                                                ->get();
       }
       
       
       
       $pdf = $pdf->loadView('admin.historials.expenses.historial_expense_pdf',compact('historials','datenow','date_end','user'));
       return $pdf->stream();
                
   }


   public function registerAction($expense,$type,$description){

        $historial = new HistorialExpense();
        $historial->setConnection(Auth::user()->database_name);

        $user       =   auth()->user();

        if($type == "expense"){
            $historial->id_expense = $expense->id;
            $historial->id_user = $user->id;
        }else if($type == "expense_product"){
            $historial->id_expense = $expense->id_expense;
            $historial->id_user = $user->id;
            $historial->id_expense_product = $expense->id ?? null;
        }else if($type == "expense_payment"){
            $historial->id_expense = $expense->id_expense;
            $historial->id_user = $user->id;
            $historial->id_expense_payment = $expense->id ?? null;
        }else{
            $historial->id_expense = $expense->id;
            $historial->id_user = $user->id;
        }
      

        $historial->description = $description;

        $historial->save();
   }
}
