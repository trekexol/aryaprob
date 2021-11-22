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
            <div class="table-responsive">
                <table class="table table-light2 table-bordered" id="dataTable" width="100%" cellspacing="0" >
                    <thead>
                    <tr>
                        <th class="text-center"></th>
                        <th class="text-center">N° de Control/Serie</th>
                        <th class="text-center">Fecha</th>
                    </tr>
                    </thead>
                    <tbody>

                    @if (empty($quotationss))
                    @else
                        @foreach($quotationss as $quotation)

                                            <tr>
                                                <td>
                                                    <a href="{{ route('imports.selectquotation',[$quotation->id]) }}" title="Seleccionar"><i class="fa fa-check" style="color: orange;"></i></a>
                                                </td>
                                                <td class="text-center">{{$quotation->serie}}</td>
                                                <td class="text-center">{{$quotation->date}}</td>
                                            </tr>
                        @endforeach
                    @endif
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- Delete Warning Modal -->
    <div class="modal modal-danger fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="Delete" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Eliminar</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('quotations.deleteQuotation') }}" method="post">
                        @csrf
                        @method('DELETE')
                        <input id="id_quotation_modal" type="hidden" class="form-control @error('id_quotation_modal') is-invalid @enderror" name="id_quotation_modal" readonly required autocomplete="id_quotation_modal">

                        <h5 class="text-center">Seguro que desea eliminar?</h5>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-danger">Eliminar</button>
                </div>
                </form>
            </div>
        </div>
    </div>

@endsection
