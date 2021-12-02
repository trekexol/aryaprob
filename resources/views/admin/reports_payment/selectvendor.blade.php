@extends('admin.layouts.dashboard')

@section('content')

<div class="container-fluid">
    <div class="row py-lg-2">
       
        <div class="col-md-6">
            <h2>Seleccione un Vendedor</h2>
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
        <div class="table-responsive">
            <table class="table table-light2 table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr> 
                    <th></th>
                    <th>Nombre</th>
                    <th>Cedula o Rif</th>
                    <th>Telefono</th>
                </tr>
                </thead>
                
                <tbody>
                    @if (empty($vendors))
                    @else  
                        @foreach ($vendors as $vendor)
                            <tr>
                                <td >
                                    <a href="{{ route('reportspayment.payments',['Vendedor',$vendor->id]) }}"  title="Seleccionar"><i class="fa fa-check" style="color: orange"></i></a>
                               </td>
                                <td >{{$vendor->name ?? ''}} {{$vendor->surname ?? ''}}</td>
                                <td >{{$vendor->cedula_rif ?? ''}}</td>
                                <td >{{$vendor->phone ?? ''}}</td>
                                
                            </tr>     
                        @endforeach   
                    @endif
                </tbody>
            </table>
        </div>
    </div>
</div>


    
@endsection
@section('javascript')

    <script>
    $('#dataTable').DataTable({
        "ordering": false,
        "order": [],
        'aLengthMenu': [[-1, 50, 100, 150, 200], ["Todo",50, 100, 150, 200]]
    });

    
    
    
    </script> 

@endsection