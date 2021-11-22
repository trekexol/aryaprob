
  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 
<title></title>
<style>
  table, td, th {
    border: 1px solid black;
    font-size: x-small;
  }
  
  table {
    border-collapse: collapse;
    width: 100%;
  }
  
  th {
    
    text-align: left;
  }
  </style>
</head>

<body>

  <br>
  <h4 style="color: black; text-align: center">Historial de Anticipos</h4>
  <h5 style="color: black; text-align: center">Fecha de Emisión: {{ $date_end ?? $datenow ?? '' }}</h5>
  @if (isset($user))
    <h5 style="color: black; text-align: center">Usuario: {{ $user->name ?? '' }}</h5>
  @endif

<table style="width: 100%;">
  <tr>
    <th style="text-align: center; width:15%;">Fecha</th>
    <th style="text-align: center; width:10%;">N°</th>
    @if (isset($client))
      <th style="text-align: center; width:10%;">Cliente</th>
    @elseif(isset($provider))
      <th style="text-align: center; width:10%;">Proveedor</th>
    @endif
    
    <th style="text-align: center; width:30%;">Monto Bs</th>
    <th style="text-align: center; width:15%;">Monto $</th>
    @if (empty($user))
      <th style="text-align: center;">Usuario</th>
    @endif

  </tr> 
  @foreach ($historials as $historial)
    <?php 
  
      $tipo = 'Compra';
      $number = $historial->id_anticipo;


    ?>
    <tr>
      <th style="text-align: center; font-weight: normal;">{{ date_format(date_create($historial->created_at),"d-m-Y h:m:s") }}</th>
      <th style="text-align: center; font-weight: normal;">{{ $number ?? '' }}</th>
      @if (isset($client))
        <th style="text-align: center; font-weight: normal;">{{ $client->name }}</th>
      @elseif(isset($provider))
        <th style="text-align: center; font-weight: normal;">{{ $provider->razon_social }}</th>
      @endif
      <th style="text-align: center; font-weight: normal;">{{ number_format(bcdiv($historial->anticipos['amount'] ?? 0, '1', 2),2,',','.')}}</th>
      <th style="text-align: center; font-weight: normal;">{{ number_format(bcdiv(($historial->anticipos['amount'] ?? 0) / ($historial->anticipos['rate'] ?? 1), '1', 2),2,',','.')}}</th>
      @if (empty($user))
        <th style="text-align: center;">{{ $historial->users['name'] ?? '' }}</th>
      @endif

    </tr> 
  @endforeach 


</table>

</body>
</html>
