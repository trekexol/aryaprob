@extends('admin.layouts.dashboard')

@section('content')

<!-- container-fluid -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="row py-lg-2">
        <div class="col-sm-7">
            <h2>Seleccione los Módulos en los que podrá acceder el usuario {{ $user->name ?? ''}}</h2>
        </div>
        <div class="col-sm-3">
           <input type="button" title="Agregar" value="Guardar Cambios" class="btn btn-primary float-md-right" role="button" aria-pressed="true"  onclick="formSend();" >
        </div>
        <div class="col-sm-2">
            <a href="{{ route($route_return ?? 'users') }}" class="btn btn-danger">
                Volver
            </a>
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
<form id="formSend" method="POST" action="{{ route('users.assignModules') }}" enctype="multipart/form-data">
    @csrf

    <input id="id_user" type="hidden" class="form-control @error('id_user') is-invalid @enderror" name="id_user" value="{{ $user->id }}" readonly required autocomplete="id_user">
    
    <input id="modulos_news" type="hidden" class="form-control @error('modulos_news') is-invalid @enderror" name="modulos_news" readonly required autocomplete="modulos_news">
    <input id="modulos_olds" type="hidden" class="form-control @error('modulos_olds') is-invalid @enderror" name="modulos_olds" readonly required autocomplete="modulos_olds">
            
    
    
<div class="card shadow mb-4">
    
    <div class="card-body">
        <div class="container">
        <div class="table-responsive">
        <table class="table table-light2 table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
            <tr> 
                <th></th>
                <th>Módulo</th>
            </tr>
            </thead>
            <tbody>
                @if (empty($modulos))
                @else  
                    @foreach ($modulos as $modulo)
                        <tr>
                            <td>
                                <input onclick="selectmodulo({{ $modulo }});" type="checkbox" id="flexCheckChecked{{$modulo->name}}">                        
                            </td>
                            <td>{{$modulo->name ?? ''}}</td>
                        </tr>     
                    @endforeach   
                @endif
            </tbody>
        </table>
            </div>
        </div>
    </div>
</div>

</form>
@endsection
@section('javascript')
    <script>
        $('#dataTable').DataTable({
            "ordering": false,
            "order": [],
            'aLengthMenu': [[50, 100, 150, -1], [50, 100, 150, "All"]]
        });
        //envia el post
        function formSend(){
            document.getElementById("formSend").submit();       
        }

        let modulos = [];
        var controller_add = true;
        var value_old = 0;

        function selectmodulo(modulo){

            var isChecked = document.getElementById('flexCheckChecked'+modulo.name).checked;

            addmodulo(modulo.name);
        }

        //esta funcion agrega y elimina moduloos de la lista que se anadiran al modulo
        function addmodulo(modulo_name){
            
            modulos.forEach(function(element, index, object) {
                if(element == modulo_name){
                    //elimina el elemento al encontrarlo
                    object.splice(index, 1);
                    controller_add = false;
                }
            });
            
            if(controller_add){
                //agrega el elemento si no existe en la lista de modulos
                modulos.push(modulo_name);
            }else{
                controller_add = true;
            }
            
            document.getElementById("modulos_news").value = modulos;
        }

       
    </script> 
        

    @if (isset($user_access))
        @foreach ($user_access as $access)
            <script>
                
                //aqui seleccionamos los moduloos que ya tenga el modulo y los asignamos a la lista de moduloos
                modulos.push("{{ $access->modulo }}");
                document.getElementById("flexCheckChecked{{ $access->modulo }}").checked = true;
                document.getElementById("modulos_olds").value = modulos;
                document.getElementById("modulos_news").value = modulos;
            </script> 
        @endforeach
    @endif
@endsection
