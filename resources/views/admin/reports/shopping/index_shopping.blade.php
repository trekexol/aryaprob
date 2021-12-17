@extends('admin.layouts.dashboard')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-sm-12">
            <div class="card">
                <form method="POST" action="{{ route('reports.store_shopping') }}">
                    @csrf

                <div class="card-header text-center h4">
                    Compras
                </div>

                <div class="card-body">
                        <div class="form-group row">
                            <div class="col-sm-3">
                                <input id="date_begin" type="date" class="form-control @error('date_begin') is-invalid @enderror" name="date_begin" value="{{  date('Y-m-d', strtotime($datebeginyear ?? $date_begin ?? $datenow)) }}" required autocomplete="date_begin">

                                @error('date_begin')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <label for="date_end" class="col-sm-1 col-form-label text-md-right">hasta </label>

                            <div class="col-sm-3">
                                <input id="date_end" type="date" class="form-control @error('date_end') is-invalid @enderror" name="date_end" value="{{ date('Y-m-d', strtotime($date_end ?? $datenow))}}" required autocomplete="date_end">

                                @error('date_end')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-sm-2">
                                <button type="submit" class="btn btn-primary ">
                                    Buscar
                                 </button>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-2">
                                <select class="form-control" name="coin" id="coin">
                                    @if(isset($coin))
                                        <option disabled selected value="{{ $coin }}">{{ $coin }}</option>
                                        <option disabled  value="{{ $coin }}">-----------</option>
                                    @else
                                        <option disabled selected value="bolivares">Moneda</option>
                                    @endif
                                    
                                    <option  value="bolivares">Bolívares</option>
                                    <option value="dolares">Dólares</option>
                                </select>
                            </div>
                            <label for="name" class="col-md-2 col-form-label text-md-right">Nombre</label>

                            <div class="col-md-3">
                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ $name ?? '' }}" autocomplete="name">

                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div> 
                            
                        </div>
                        </div>
                    </form>
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="{{ route('reports.shopping_pdf',[$coin ?? 'bolivares',$datebeginyear ?? $date_begin ?? $datenow,$date_end ?? $datenow,$name ?? null]) }}" allowfullscreen></iframe>
                          </div>
                        
                        </div>
                </div>
            </div>
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

    
    

    let provider  = "<?php echo $provider->name ?? 0 ?>";  

    if(provider != 0){
        $("#provider_label1").show();
        $("#provider_label2").show();
        $("#provider_label3").show();
    }else{
        $("#provider_label1").hide();
        $("#provider_label2").hide();
        $("#provider_label3").hide();
    }
    

    $("#type").on('change',function(){
            type = $(this).val();
            
            if(type == 'todo'){
                $("#provider_label1").hide();
                $("#provider_label2").hide();
                $("#provider_label3").hide();
            }else{
                $("#provider_label1").show();
                $("#provider_label2").show();
                $("#provider_label3").show();
            }
        });

    </script> 

@endsection