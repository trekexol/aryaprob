@extends('admin.layouts.dashboard')

@section('content')

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
                <div class="card-header text-center font-weight-bold h3">Registro Factura Principal</div>
                <div class="card-body">
                    <form method="POST" action="{{ route('imports.store') }}">
                        @csrf
                        <div class="form-group row">
                            <div class="col-sm-2">
                                <a href="{{route('imports.cargar')}}" type="btn btn-primary"><i class="fa fa-search" style="font-size:24px"></i>Buscar Factura</a>
                            </div>
                            <div class="col-sm-4">

                                <input id="nro_factura" type="text" class="form-control @error('nro_factura') is-invalid @enderror" name="Nro_Factura" value="{{ $id ?? null }}" required autocomplete="nro_factura" readonly>
                            </div>
                            <div class="col-sm-2">
                                <label id="date_begin" for="type" >Fecha:</label>
                            </div>
                            <div class="col-sm-4">
                                <input id="date_begin" type="date" class="form-control @error('date_begin') is-invalid @enderror" name="Fecha" value="{{ old('Fecha') }}" required autocomplete="date_begin" >
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
                                <input id="observaciones" type="text" class="form-control @error('observaciones') is-invalid @enderror" name="Observaciones" value="{{ old('Observaciones') }}" required autocomplete="Observaciones" >

                                @error('observaciones')
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <br>
                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                   Registrar Importacion
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
        soloAlfaNumerico('description');
    });
    </script>
@endsection
