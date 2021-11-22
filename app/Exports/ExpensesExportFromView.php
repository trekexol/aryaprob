<?php

namespace App\Exports;

use App\Company;
use App\ExpensesAndPurchase;
use App\Http\Controllers\ExportExpenseController;
use Carbon\Carbon;
use Maatwebsite\Excel\Concerns\FromCollection;

use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Date;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Facades\Excel;
use Maatwebsite\Excel\Concerns\FromArray;

class ExpensesExportFromView implements FromView
{
    public $date_begin;
    public $date_end;

    public function __construct($date_begin,$date_end)
    {
        $this->date_begin = $date_begin;
        $this->date_end = $date_end;
    }

    public function view(): View
    {
        $company = Company::on(Auth::user()->database_name)->first();
        $expenses = ExpensesAndPurchase::on(Auth::user()->database_name)
                                        ->where('retencion_iva','<>',0)->get();

        if(isset($this->date_begin) && isset($this->date_end)){
            $expenses = ExpensesAndPurchase::on(Auth::user()->database_name)
                                        ->where('retencion_iva','<>',0)
                                        ->whereRaw(
                                            "(DATE_FORMAT(date, '%Y-%m-%d') >= ? AND DATE_FORMAT(date, '%Y-%m-%d') <= ?)", 
                                            [$this->date_begin, $this->date_end])
                                            ->get();
            if(isset($expenses)){
                foreach ($expenses as  $expense) {
                    $expense->date = Carbon::parse($expense->date);
                    $exportExpense = new ExportExpenseController();
                    $expense->total_retiene_iva = $exportExpense->calculatarTotalProductosSinIva($expense);
                }    
            }
        }
        
        return view('export_excel.expense_iva',compact('company','expenses'));
    }

    public function setter($date_begin){
       $this->date_begin = $date_begin;
    }
}
