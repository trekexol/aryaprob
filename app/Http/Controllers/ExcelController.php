<?php

namespace App\Http\Controllers;

use App\Account;
use App\Client;
use App\Exports\ExpensesExport;
use App\Imports\ClientImport;
use App\Imports\ExpensesImport;
use App\Imports\ProductImport;
use App\Inventory;
use App\Product;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Collection;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Auth;

class ExcelController extends Controller
{

    public function export_product() 
    {
         $products = Product::on(Auth::user()->database_name)
         ->join('inventories','inventories.product_id','=','products.id')
         ->select('products.id','segment_id','subsegment_id','twosubsegment_id','threesubsegment_id','unit_of_measure_id',
         'code_comercial','type','description','price','price_buy','cost_average','photo_product','money',
         'exento','islr','inventories.amount')
         ->get();

        
         $export = new ExpensesExport([
             ['id','id_segmento','id_subsegmento','id_twosubsegment','id_threesubsegment','id_unidadmedida'
              ,'codigo_comercial','tipo_mercancia_o_servicio','descripcion','precio','precio_compra','costo_promedio','foto','moneda_d_o_bs',
              'exento_1_o_0','islr_1_o_0','Cantidad en Inventario'],
              $products
        ]);
        
        return Excel::download($export, 'guia_productos.xlsx');
    }

    public function export($id) 
   {
       
       $export = new ExpensesExport([
            ['id_compra', 'id_inventario', 'id_cuenta','id_sucursal','descripcion','exento','islr','cantidad','precio','tasa'],
            [$id]
       ]);
       
       return Excel::download($export, 'plantilla_compras.xlsx');
   }

   public function export_guide_account() 
   {
        $account_inventory = Account::on(Auth::user()->database_name)->select('id','description')
                                ->where('code_one',1)
                                ->where('code_two', 1)
                                ->where('code_three', 3)
                                ->where('code_four',1)
                                ->where('code_five', '<>',0)
                                ->get();
        $account_costo = Account::on(Auth::user()->database_name)->select('id','description')->where('code_one',5)
                                ->where('code_two', '<>',0)
                                ->where('code_three', '<>',0)
                                ->where('code_four', '<>',0)
                                ->where('code_five', '<>',0)->get();
       
        $export = new ExpensesExport([
            ['id_cuenta','Cuenta'],
            $account_inventory,
            $account_costo
       ]);
       
       return Excel::download($export, 'guia_cuentas.xlsx');
   }

   public function export_guide_inventory() 
   {
        $account_inventory = Inventory::on(Auth::user()->database_name)
                                ->join('products','products.id','inventories.product_id')
                                ->select('inventories.id','products.description')
                                ->orderBy('products.description','asc')
                                ->get();
        
       
        $export = new ExpensesExport([
            ['id_inventario','Nombre'],
            $account_inventory
       ]);
       
       return Excel::download($export, 'guia_inventario.xlsx');
   }

   public function import_client(Request $request) 
   {
       $file = $request->file('file');
       
       Excel::import(new ClientImport, $file);
       
       return redirect('clients')->with('success', 'Archivo importado con Exito!');
   }
  
   public function import_product(Request $request) 
   {
       $file = $request->file('file');
       
       Excel::import(new ProductImport, $file);

       Excel::import(new InventoryImport, $file);
       
       return redirect('products')->with('success', 'Archivo importado con Exito!');
   }

   public function import(Request $request) 
   {
       $file = $request->file('file');
       $id_expense = request('id_expense');
       $coin = request('coin_hidde');
       
       Excel::import(new ExpensesImport, $file);
       
       return redirect('expensesandpurchases/register/'.$id_expense.'/'.$coin.'')->with('success', 'Archivo importado con Exito!');
   }

   public function import_product(Request $request) 
   {
       $file = $request->file('file');
       
       Excel::import(new ProductImport, $file);
       
       return redirect('products')->with('success', 'Archivo importado con Exito!');
   }
}
