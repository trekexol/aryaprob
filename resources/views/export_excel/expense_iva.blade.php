
  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 
<title>Factura</title>
<style>
  table, td, th {
    border: 1px solid black;
  }
  
  table {
    border-collapse: collapse;
    width: 50%;
  }
  
  th {
    
    text-align: left;
  }
  </style>
</head>

<body>
  <table>
    <tbody>
    @if(isset($expenses))
    @foreach($expenses as $expense)
        <tr>
            <td>{{ $company->code_rif }}</td>
            <td>{{ $expense->date->format('Ym') }}</td>
            <td>{{ $expense->date->format('Y-m-d') }}</td>
            <td>{{ $expense->invoice }}</td>
            <td>{{ $expense->serie }}</td>
            <td>{{ $expense->amount_with_iva }}</td>
            <td>{{ $expense->base_imponible }}</td>
            <td>{{ $expense->retencion_iva }}</td>
            <td>{{ $expense->date->format('Ym').str_pad($expense->id, 8, "0", STR_PAD_LEFT) }}</td>
            <td>{{ $expense->total_retiene_iva }}</td>
            <td>{{ $expense->iva_percentage }}</td>
            <td>0</td>
        </tr>
    @endforeach
    </tbody>
    @endif
</table>
</body>
</html>
