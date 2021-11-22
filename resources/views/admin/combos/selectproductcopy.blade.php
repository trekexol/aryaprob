@extends('admin.layouts.dashboard')

@section('content')

<!-- container-fluid -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="row py-lg-2">
      <div class="col-md-8">
          <h2>Seleccione los Productos para el Combo</h2>
      </div>
      <div class="col-md-4">
        <form method="POST" action="{{ route('combos.store_assign') }}" enctype="multipart/form-data">
            @csrf
            <input id="id_products" type="hidden" class="form-control @error('id_products') is-invalid @enderror" name="id_products"  readonly required autocomplete="id_products">
            <input id="id_combo" type="hidden" class="form-control @error('id_combo') is-invalid @enderror" name="id_combo" value="{{ $id_combo }}" readonly required autocomplete="id_combo">
            
            <input id="combo_products" type="hidden" class="form-control @error('combo_products') is-invalid @enderror" name="combo_products" readonly required autocomplete="combo_products">
                      
            <button type="submit" class="btn btn-primary float-md-right" role="button" aria-pressed="true">Asignar Productos</button>
        
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
                <th>Código Comercial</th>
                <th>Descripción</th>
                <th>Precio</th>
                <th>Moneda</th>
                <th>Segmento</th>
                <th>Sub Segmento</th>
                
                
            </tr>
            </thead>
            
            <tbody>
                @if (empty($products))
                @else  
                    @foreach ($products as $product)
                        <tr>
                            <td>
                                <input onclick="addProduct({{ $product->id }});" type="checkbox" id="flexCheckChecked{{$product->id}}">                        
                            </td>
                            <td>{{$product->code_comercial ?? ''}}</td>
                            <td>{{$product->description ?? ''}}</td>
                            <td>{{$product->price ?? ''}}</td>
                            @if($product->money == "D")
                                <td>Dolar</td>
                            @else
                                <td>Bolívar</td>
                            @endif
                            <td>{{$product->segments['description'] ?? ''}}</td>
                            <td>{{$product->subsegments['description'] ?? ''}}</td> 
                           
                            
                           
                         
                        </tr>     
                    @endforeach   
                @endif
            </tbody>
        </table>
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

        let products = [];
        var controller_add = true;
        

        //esta funcion agrega y elimina productos de la lista que se anadiran al combo
        function addProduct(id_product){
            
            products.forEach(function(element, index, object) {
                if(element == id_product){
                    //elimina el elemento al encontrarlo
                    object.splice(index, 1);
                    controller_add = false;
                }
            });
            
            if(controller_add){
                //agrega el elemento si no existe en la lista de products
                products.push(id_product);
            }else{
                controller_add = true;
            }
            
            document.getElementById("id_products").value = products;
        }
    </script> 


    @if (isset($combo_products))
        @foreach ($combo_products as $combo)
            <script>
                //aqui seleccionamos los productos que ya tenga el combo y los asignamos a la lista de productos
                products.push("{{ $combo->id_product }}");
                document.getElementById("combo_products").value = products;
                document.getElementById("flexCheckChecked{{ $combo->id_product }}").checked = true;
                document.getElementById("id_products").value = products;
            </script> 
        @endforeach
    @endif
@endsection
