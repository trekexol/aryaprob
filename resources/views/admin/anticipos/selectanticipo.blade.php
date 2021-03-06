@extends('admin.layouts.dashboard')

@section('content')

   

<!-- container-fluid -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="row py-lg-2">
        <div class="col-md-6 h4">
            Anticipos del Cliente: {{ $client->name ?? '' }}
        </div>
        
        <div class="col-md-3">
            <a href="{{ route('quotations.createfacturar',[$id_quotation,$coin]) }}" id="btnfacturar" name="btnfacturar" class="btn btn-info" title="facturar">Volver a la Factura</a>  
        </div>
            
       
    </div>

  </div>

  {{-- VALIDACIONES-RESPUESTA--}}
@include('admin.layouts.success')   {{-- SAVE --}}
@include('admin.layouts.danger')    {{-- EDITAR --}}
@include('admin.layouts.delete')    {{-- DELELTE --}}
{{-- VALIDACIONES-RESPUESTA --}}

<div class="card shadow mb-4">
    <div class="card-body">
        <div class="table-responsive">
        <table class="table table-light2 table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
            <tr>
                <th class="text-center">Cliente</th>
                <th class="text-center">Caja/Banco</th>
                <th class="text-center">Fecha del Anticipo</th>
                <th class="text-center">Referencia</th>
                <th class="text-center">Monto</th>
                <th class="text-center">Moneda</th>
               <th class="text-center"></th>
              
            </tr>
            </thead>
            
            <tbody>
                @if (empty($anticipos))
                @else
                    @foreach ($anticipos as $key => $anticipo)
                    <?php 
                        if($anticipo->coin != 'bolivares'){
                            $anticipo->amount = $anticipo->amount / $anticipo->rate;
                        }
                    ?>
                    <tr>
                        @if (isset($anticipo->quotations['serie']))
                        <td class="text-center">{{$anticipo->clients['name'] ?? ''}} , fact({{$anticipo->quotations['serie'] ?? ''}})</td>
                        @else
                        <td class="text-center">{{$anticipo->clients['name'] ?? ''}}</td>
                        @endif
                    <td class="text-center">{{$anticipo->accounts['description']}}</td>
                    <td class="text-center">{{$anticipo->date}}</td>
                    <td class="text-center">{{$anticipo->reference}}</td>
                    <td class="text-right">{{number_format($anticipo->amount, 2, ',', '.')}}</td>
                    <td class="text-center">{{$anticipo->coin}}</td>
                   
                    @if (Auth::user()->role_id  == '1')
                        <td>
                            @if ($anticipo->status == 1) 
                            
                                <input onclick="changestatus({{ $anticipo->id }});" type="checkbox" id="flexCheckChecked{{$anticipo->id}}" checked>                        
                     
                            @else
                                <input onclick="changestatus({{ $anticipo->id }});" type="checkbox" id="flexCheckChecked{{$anticipo->id}}">                        
                            @endif
                        </td>
                    @endif
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
    

    function changestatus(anticipo){
        var verify = document.getElementById("flexCheckChecked"+anticipo).checked;
        
            $.ajax({
                
                url:"{{ route('anticipos.changestatus',['','']) }}" + '/' + anticipo+'/' + verify,
                beforSend:()=>{
                    alert('consultando datos');
                },
                success:(response)=>{
                 
                    
                },
                error:(xhr)=>{
                    alert('Presentamos Inconvenientes');
                }
            })
    }



    
    
    </script> 
@endsection