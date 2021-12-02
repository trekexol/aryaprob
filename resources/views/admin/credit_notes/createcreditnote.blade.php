@extends('admin.layouts.dashboard')

@section('content')



    {{-- VALIDACIONES-RESPUESTA--}}
    @include('admin.layouts.success')   {{-- SAVE --}}
    @include('admin.layouts.danger')    {{-- EDITAR --}}
    @include('admin.layouts.delete')    {{-- DELELTE --}}
    {{-- VALIDACIONES-RESPUESTA --}}
    
@if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{$error}}</li>
                @endforeach
            </ul>
        </div>
    @endif
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header text-center font-weight-bold h3">Registro de Nota de Crédito</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('creditnotes.store') }}" enctype="multipart/form-data">
                        @csrf
                       
                        <input id="id_user" type="hidden" class="form-control @error('id_user') is-invalid @enderror" name="id_user" value="{{ Auth::user()->id }}" required autocomplete="id_user">
                        <input id="id_client" type="hidden" class="form-control @error('id_client') is-invalid @enderror" name="id_client" value="{{ $client->id ?? -1  }}" required autocomplete="id_client">
                        <input id="id_vendor" type="hidden" class="form-control @error('id_vendor') is-invalid @enderror" name="id_vendor" value="{{ $vendor->id ?? $client->id_vendor ?? null  }}" required autocomplete="id_vendor">
                       
                        
                        <div class="form-group row">
                            <label for="date_creditnote" class="col-md-2 col-form-label text-md-right">Fecha</label>
                            <div class="col-md-3">
                                <input id="date_creditnote" type="date" class="form-control @error('date_creditnote') is-invalid @enderror" name="date_creditnote" value="{{ $datenow }}" required autocomplete="date_creditnote">
    
                                @error('date_creditnote')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <label for="serie" class="col-md-3 col-form-label text-md-right">N° de Control/Serie:</label>

                            <div class="col-md-3">
                                <input id="serie" type="text" class="form-control @error('serie') is-invalid @enderror" name="serie" value="{{ old('serie') }}" autocomplete="serie">

                                @error('serie')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="transports" class="col-md-2 col-form-label text-md-right">Transporte / Tipo de Entrega</label>

                            <div class="col-md-3">
                            <select class="form-control" id="id_transport" name="id_transport">
                                <option selected value="-1">Ninguno</option>
                                @foreach($transports as $var)
                                    <option value="{{ $var->id }}">{{ $var->placa }}</option>
                                @endforeach
                            </select>
                            </div> 
                            <label for="transports" class="col-md-2 col-form-label text-md-right">Transporte / Tipo de Entrega</label>

                            <div class="col-md-3">
                                <select class="form-control" id="id_transport" name="id_transport">
                                    <option selected value="-1">Ninguno</option>
                                    @foreach($transports as $var)
                                        <option value="{{ $var->id }}">{{ $var->placa }}</option>
                                    @endforeach
                                
                                </select>
                            </div> 
                        </div> 
                        <div class="form-group row">
                            <label for="invoices" class="col-md-2 col-form-label text-md-right">Factura (Opcional)</label>
                            <div class="col-md-3">
                                <input id="invoice" type="text" class="form-control @error('invoice') is-invalid @enderror" name="invoice" value="{{ $invoice->number_invoice ?? '' }}" readonly required autocomplete="invoice">
    
                                @error('invoice')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="form-group col-md-1">
                                <a href="{{ route('creditnotes.selectinvoice') }}" title="Seleccionar Factura"><i class="fa fa-eye"></i></a>  
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="clients" class="col-md-2 col-form-label text-md-right">Cliente</label>
                            <div class="col-md-3">
                                <input id="client" type="text" class="form-control @error('client') is-invalid @enderror" name="client" value="{{ $client->name ?? '' }}" readonly required autocomplete="client">
    
                                @error('client')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="form-group col-md-1">
                                <a href="{{ route('creditnotes.selectclient') }}" title="Seleccionar Cliente"><i class="fa fa-eye"></i></a>  
                            </div>
                        </div>

                        
                        <div class="form-group row">
                           <label for="vendors" class="col-md-2 col-form-label text-md-right">Vendedor</label>
                            <div class="col-md-3">
                                <input id="id_vendor" type="text" class="form-control @error('id_vendor') is-invalid @enderror" name="vendor" value="{{ $vendor->name ?? $client->vendors['name'] ?? '' }}" readonly required autocomplete="id_vendor">

                                    @error('id_vendor')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                            </div>
                            <div class="form-group col-md-1">
                                <a href="{{ route('creditnotes.selectvendor',$client->id ?? -1) }}" title="Seleccionar Vendedor"><i class="fa fa-eye"></i></a>  
                            </div>
                           
                        </div>
                       
                        <div class="form-group row">
                            <label for="note" class="col-md-2 col-form-label text-md-right">Nota Pie de Factura </label>

                            <div class="col-md-4">
                                <input id="note" type="text" class="form-control @error('note') is-invalid @enderror" name="note" value="{{ old('note') }}"  autocomplete="note">

                                @error('note')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                           
                        </div>
                        <div class="form-group row">
                           
                            <label for="observation" class="col-md-2 col-form-label text-md-right">Observaciones</label>

                            <div class="col-md-4">
                                <input id="observation" type="text" class="form-control @error('observation') is-invalid @enderror" name="observation" value="{{ old('observation') }}" autocomplete="observation">

                                @error('observation')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        
                        <br>
                       
                        <div class="form-group">
                            <div class="col-md-3 offset-md-4">
                                <button type="submit" class="btn btn-info">
                                   
                                  Crear Cotización
                                </button>
                            </div>
                        </div>
                        </form>      
                           
                   
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('validacion')
    <script>    
	$(function(){
        soloAlfaNumerico('code_comercial');
        soloAlfaNumerico('description');
    });
    </script>
@endsection
