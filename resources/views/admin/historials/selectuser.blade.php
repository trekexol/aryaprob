@extends('admin.layouts.dashboard')

@section('content')

<div class="container-fluid">

    <!-- Page Heading -->
    <div class="row py-lg-2">
      <div class="col-md-6">
          <h2>Seleccione un Usuario</h2>
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
        <table class="table table-light2 table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
            <tr> 
                <th></th>
                <th>Usuario</th>
                <th>Email</th>
            </tr>
            </thead>
            
            <tbody>
                @if (empty($users))
                @else  
                    @foreach ($users as $user)
                        <tr>
                            <td>
                                <a href="{{ route($route,$user->id) }}"  title="Seleccionar"><i class="fa fa-check" style="color: orange"></i></a>
                            </td>
                            <td>{{$user->name ?? ''}}</td>
                            <td>{{$user->email ?? ''}}</td>
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
        'aLengthMenu': [[50, 100, 150, -1], [50, 100, 150, "All"]]
    });

    </script> 

@endsection