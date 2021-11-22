<?php

namespace App\Http\Controllers\Historial;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HistorialSelectController extends Controller
{
   public function selectUser($route)
   {
        $users = User::on(Auth::user()->database_name)->get();
        
        return view('admin.historials.selectuser',compact('route','users'));
   }
}
