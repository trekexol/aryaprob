@extends('admin.layouts.dashboard')

@section('content')

    <!-- container-fluid -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row py-lg-2">
            <div class="col-md-6">
                <h2>Facturas</h2>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
    {{-- VALIDACIONES-RESPUESTA--}}
    @include('admin.layouts.success')   {{-- SAVE --}}
    @include('admin.layouts.danger')    {{-- EDITAR --}}
    @include('admin.layouts.delete')    {{-- DELELTE --}}
    {{-- VALIDACIONES-RESPUESTA --}}
    <!-- DataTales Example -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header text-center font-weight-bold h3">Detalle de La Importacion</div>
                    <div class="card-body">

                            <div class="form-group row">
                                <div class="col-sm-2">
                                    <label id="date_begin" for="type" >Fecha:</label>
                                </div>
                                <div class="col-sm-4">
                                    <input id="date_begin" type="date" class="form-control @error('date_begin') is-invalid @enderror" name="Fecha" value="{{ $import->fecha }}" required autocomplete="date_begin" readonly >
                                    @error('date_begin')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                                <div class="col-sm-2">
                                    <label id="date_begin" for="type" >Factura principal:</label>
                                </div>
                                <div class="col-sm-4">
                                    <input id="date_begin" type="text" class="form-control @error('date_begin') is-invalid @enderror" name="Factura" value="{{ $import->id_purchases }}" required autocomplete="date_begin" readonly >
                                    @error('date_begin')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-2">
                                    <label id="observaciones" for="type" >Observaciones:</label>
                                </div>
                                <div class="col-sm-10">
                                    <input id="date_begin" type="text" class="form-control @error('date_begin') is-invalid @enderror" name="Observacion" value="{{ $import->observaciones }}"  autocomplete="date_begin" readonly >
                                    @error('observaciones')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-2">
                                    <label id="date_begin" for="type" >Monto Factura:</label>
                                </div>
                                <div class="col-sm-4">
                                    <input id="date_begin" type="text" class="form-control @error('date_begin') is-invalid @enderror" name="Fecha" value="{{$resultado}}" required autocomplete="date_begin" readonly >
                                    @error('date_begin')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-3">
                                    <label  for="type" >Tipo de Porcentaje %:</label>
                                </div>
                                <div class="col-sm-4">
                                    <select class="form-control" id="filtro" name="filtro" >
                                        <option value="0">Seleccione..</option>
                                        <option value="1">Manual</option>
                                        <option value="2">Automatico</option>
                                    </select>
                                </div>
                            </div>
                        <form  method="POST"   action="{{ route('imports.calcularfiltro',$import->id) }}" enctype="multipart/form-data" >
                            @method('PATCH')
                            @csrf()
                            <div id="div_precio" style="display: none;">
                                <div  class="form-group row">
                                    <div class="col-sm-3">
                                        <label  for="type" >% General de Venta</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <input id="date_begin" type="text" class="form-control @error('date_begin') is-invalid @enderror" name="Precio" value="" required autocomplete="date_begin"  >
                                        @error('date_begin')
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                        @enderror
                                    </div>
                                    <button type="submit" class="btn btn-primary ">Calcular</button>
                                </div>
                                <input type="text" name="total_1" value="{{ $total }}" >
                                <input  type="text"name="total_2" value="{{$resultado}}" >
                            </div>
                        </form>
                </div>
            </div>
        </div>
    </div>
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="container">
                @if (session('flash'))
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        {{session('flash')}}
                        <button type="button" class="close" data-dismiss="alert" aria-label="close">
                            <span aria-hidden="true">&times; </span>
                        </button>
                    </div>
                @endif
            </div>
            <h5>Listado de Factura Principal</h5>



                <div class="table-responsive">
                        <table class="table table-light2 table-bordered" id="dataTable" width="100%" cellspacing="0" >
                            <thead>
                            <tr>
                                <th class="text-center">Producto</th>
                                <th class="text-center">Precio</th>
                                <th class="text-center">Cantidad</th>
                                <th class="text-center">Total</th>
                                <th class="text-center">Costo Importacion</th>
                                <th class="text-center">Nuevo Precio de Venta</th>
                            </tr>
                            </thead>
                            <tbody>

                            @if (empty($expenses_imports))
                            @else


                            @foreach($expenses_imports as $expenses_import)

                                <tr>
                                    <td class="text-center">{{$expenses_import->description}}</td>
                                    <td class="text-center">{{$expenses_import->price}}</td>
                                    <td class="text-center">{{$expenses_import->amount}}</td>
                                    <td class="text-center">{{$expenses_import->amount * $expenses_import->price }}</td>
                                    <td class="text-center">{{ ($resultado / $total) * $expenses_import->price    }} </td>
                                    <td> <input type="text" id="ope_id" name="ope_id" value="{{  ($resultado / $total)  * $expenses_import->price  * $import->porcentaje_general / 100      }}"></td>
                                </tr>
                            @endforeach
                            @endif
                            </tbody>
                        </table>
                    </div>

            <h5>Listado de Factura Segundaria</h5>
            <div class="table-responsive">
                <table class="table table-light2 table-bordered" id="dataTable" width="100%" cellspacing="0" >
                    <thead>
                    <tr>
                        <th class="text-center">N° de Control/Serie</th>
                        <th class="text-center">Servicio</th>
                        <th class="text-center">Fecha de Cotización</th>
                        <th class="text-center">Monto</th>
                    </tr>
                    </thead>
                    <tbody>

                    @if (empty($import_details))
                    @else
                        @foreach($import_details as $import_detail)
                                @foreach($expenses as $expense)
                                        @if($expense->id_expense == $import_detail->id_purchases )
                                        <tr>
                                            <td class="text-center">{{$expense->description}}</td>
                                            <td class="text-center">{{$import_detail->expensedetails['serie']}}</td>
                                            <td class="text-center">{{$import_detail->expensedetails['date']}}</td>
                                            <td class="text-center">{{$expense->price}}</td>
                                        </tr>
                                        @endif
                                @endforeach
                            @endforeach
                    @endif
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
@section('imports')
    <script>
        $("#filtro").on('change',function(){
            var metodo_id = $(this).val();

            if(metodo_id == 0){
                alert("Seleccione un Filtro");
                document.getElementById("div_precio").style.display   = "none";
            }

            if(metodo_id == 1){
                document.getElementById("div_precio").style.display   = "none";
            }

            if(metodo_id == 2){
                document.getElementById("div_precio").style.display   = "block";
            }
        });
    </script>
@endsection
