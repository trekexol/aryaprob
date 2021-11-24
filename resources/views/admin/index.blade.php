@extends('admin.layouts.dashboard')

@section('content')

{{-- VALIDACIONES-RESPUESTA--}}
@include('admin.layouts.success')   {{-- SAVE --}}
@include('admin.layouts.danger')    {{-- EDITAR --}}
@include('admin.layouts.delete')    {{-- DELELTE --}}
{{-- VALIDACIONES-RESPUESTA --}}


    <div class="row justify-content-left">
        <div class="col-md-12">
            <div class="card">
               
                <div class="card-body">
                  <!--  <div class="list-group">
                      <a href="#" class="list-group-item list-group-item-action">A simple default list group item</a>
                    
                      <a href="#" class="list-group-item list-group-item-action list-group-item-primary">A simple primary list group item</a>
                      <a href="#" class="list-group-item list-group-item-action list-group-item-secondary">A simple secondary list group item</a>
                      <a href="#" class="list-group-item list-group-item-action list-group-item-success">A simple success list group item</a>
                      <a href="#" class="list-group-item list-group-item-action list-group-item-danger">A simple danger list group item</a>
                      <a href="#" class="list-group-item list-group-item-action list-group-item-warning">A simple warning list group item</a>
                      <a href="#" class="list-group-item list-group-item-action list-group-item-info">A simple info list group item</a>
                      <a href="#" class="list-group-item list-group-item-action list-group-item-light">A simple light list group item</a>
                      <a href="#" class="list-group-item list-group-item-action list-group-item-dark">A simple dark list group item</a>
                    </div> -->
                    
                    <div class="row justify-content-center">
                        <div class="col-sm-3">
                          <div class="list-group" id="list-tab" role="tablist">
                            <li class="list-group-item list-group-item-action list-group-item-primary text-center" style="padding: 0;" id="list-home-list" data-bs-toggle="list" role="tab" aria-controls="home"><font size="-1">Balance General</font></li>
                            <li class="list-group-item list-group-item-action list-group-item-light text-center" style="padding: 2% 0;" id="list-profile-list" data-bs-toggle="list"  role="tab" aria-controls="profile"><font size="-1">Activo <br>{{ number_format($account_activo, 2, ',', '.')}}</font></li>
                            <li class="list-group-item list-group-item-action list-group-item-ligh text-center" style="padding: 2% 0;" id="list-messages-list" data-bs-toggle="list"  role="tab" aria-controls="messages"><font size="-1">Pasivo <br>{{ number_format($account_pasivo, 2, ',', '.')}}</font></li>
                            <li class="list-group-item list-group-item-action list-group-item-light text-center" style="padding: 2% 0;" id="list-settings-list" data-bs-toggle="list" role="tab" aria-controls="settings"><font size="-1">Patrimonio <br>{{ number_format($account_patrimonio, 2, ',', '.')}}</font></li>
                          </div>
                        </div>
                        <div class="col-sm-3">
                          <div class="list-group" id="list-tab" role="tablist">
                            <li class="list-group-item list-group-item-action list-group-item-danger text-center" style="padding: 0;" id="list-home-list" data-bs-toggle="list" role="tab" aria-controls="home"><font size="-1">Ganancias y Pérdidas</font></li>
                            <li class="list-group-item list-group-item-action list-group-item-light text-center" style="padding: 5% 0;" id="list-profile-list" data-bs-toggle="list"  role="tab" aria-controls="profile"><font size="-1">Ingresos {{ number_format(($account_ingresos * -1), 2, ',', '.')}}</font></li>
                            <li class="list-group-item list-group-item-action list-group-item-ligh text-center" style="padding: 5% 0;" id="list-messages-list" data-bs-toggle="list"  role="tab" aria-controls="messages"><font size="-1">Costos {{ number_format($account_costos, 2, ',', '.')}}</font></li>
                            <li class="list-group-item list-group-item-action list-group-item-light text-center" style="padding: 5% 0;" id="list-settings-list" data-bs-toggle="list" role="tab" aria-controls="settings"><font size="-1">Gastos {{ number_format($account_gastos, 2, ',', '.')}}</font></li>
                            <li class="list-group-item list-group-item-action list-group-item-warning text-center" style="padding: 5% 0;" id="list-messages-list" data-bs-toggle="list"  role="tab" aria-controls="messages"><font size="-1">Total {{ number_format(($account_ingresos * -1)-$account_costos-$account_gastos, 2, ',', '.')}}</font></li>
                          </div>
                        </div>
                        <div class="col-sm-3">
                          <div class="list-group" id="list-tab" role="tablist">
                            <li class="list-group-item list-group-item-action list-group-item-info text-center" style="padding: 0;" id="list-home-list" data-bs-toggle="list" role="tab" aria-controls="home"><font size="-1">Saldos Pendientes</font></li>
                            <li class="list-group-item list-group-item-action list-group-item-light text-center" style="padding: 2% 0;" id="list-profile-list" data-bs-toggle="list"  role="tab" aria-controls="profile"><font size="-1">Cuentas por Cobrar <br>{{ number_format($account_cuentas_por_cobrar, 2, ',', '.')}}</font></li>
                            <li class="list-group-item list-group-item-action list-group-item-ligh text-center" style="padding: 2% 0;" id="list-messages-list" data-bs-toggle="list"  role="tab" aria-controls="messages"><font size="-1">Cuentas por Pagar <br>{{ number_format($account_cuentas_por_pagar, 2, ',', '.')}}</font></li>
                            <li class="list-group-item list-group-item-action list-group-item-light text-center" style="padding: 2% 0;" id="list-settings-list" data-bs-toggle="list" role="tab" aria-controls="settings"><font size="-1">Préstamos a largo plazo<br>{{ number_format($account_prestamos, 2, ',', '.')}}</font></li>
                          </div>
                        </div>
                        <div class="col-sm-3">
                          <div class="list-group" id="list-tab" role="tablist">
                            <li class="list-group-item list-group-item-action list-group-item-success text-center" style="padding: 0;" id="list-home-list" data-bs-toggle="list" role="tab" aria-controls="home"><font size="-1">Balance de Bancos</font></li>
                            <li class="list-group-item list-group-item-action list-group-item-light text-center" style="padding: 5% 0;" id="list-profile-list" data-bs-toggle="list"  role="tab" aria-controls="profile"><font size="-1">{{ $account_banco1_name }} {{ number_format($account_banco1, 2, ',', '.')}}</font></li>
                            <li class="list-group-item list-group-item-action list-group-item-ligh text-center" style="padding: 5% 0;" id="list-messages-list" data-bs-toggle="list"  role="tab" aria-controls="messages"><font size="-1">{{ $account_banco2_name }} {{ number_format($account_banco2, 2, ',', '.')}}</font></li>
                            <li class="list-group-item list-group-item-action list-group-item-light text-center" style="padding: 5% 0;" id="list-settings-list" data-bs-toggle="list" role="tab" aria-controls="settings"><font size="-1">{{ $account_banco3_name }} {{ number_format($account_banco3, 2, ',', '.')}}</font></li>
                            <li class="list-group-item list-group-item-action list-group-item-warning text-center" style="padding: 5% 0;" id="list-messages-list" data-bs-toggle="list"  role="tab" aria-controls="messages"><font size="-1">Total {{ number_format($account_banco1+$account_banco2+$account_banco3, 2, ',', '.')}}</font></li>
                          </div>
                        </div>
                        
                  </div>
                
               <br>
              
                  <div class="row justify-content-center ">
                      <div class="card shadow mb-2 col-sm-8"  style="background-color: white">
                        <div class="card-header py-2" style="background-color: #ff9101">
                            <h6 class="m-0 font-weight-bold text-center " style="color: #000000">Ingresos Correspondientes al periodo {{$date->format('Y')}}</h6>
                        </div>
                        <div class="card-body">
                            <div class="chart-bar">
                                <canvas id="myBarChart"></canvas>
                            </div>
                          
                        </div>
                      </div>
                      <div class="col-sm-3" >
                          <div class="card shadow" style="background-color: white">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header"  style="background-color: #ff9101">
                                <h6 class="m-0 font-weight-bold text-center" style="color: #000000">Reporte de Ingresos,<br> Egresos y Gastos</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body" >
                                <div class="chart-pie pt-1" >
                                    <canvas id="myPieChart"></canvas>
                                </div>
                                <hr><h6>Styling for the bar chart can be found in the</h6>
                          
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
              // Set new default font family and font color to mimic Bootstrap's default styling
        Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#858796';

        function number_format(number, decimals, dec_point, thousands_sep) {
          // *     example: number_format(1234.56, 2, ',', ' ');
          // *     return: '1 234,56'
          number = (number + '').replace(',', '').replace(' ', '');
          var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            s = '',
            toFixedFix = function(n, prec) {
              var k = Math.pow(10, prec);
              return '' + Math.round(n * k) / k;
            };
          // Fix for IE parseFloat(0.55).toFixed(0) = 0;
          s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
          if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
          }
          if ((s[1] || '').length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1).join('0');
          }
          return s.join(dec);
        }

        // Bar Chart Example
        var ctx = document.getElementById("myBarChart");
        var myBarChart = new Chart(ctx, {
          type: 'bar',
          data: {
            labels: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
            datasets: [{
              label: "Revenue",
              backgroundColor: "#4e73df",
              hoverBackgroundColor: "#2e59d9",
              borderColor: "#4e73df",
              data: ["{{ $totals_per_month[0] ?? 0}}","{{ $totals_per_month[1] ?? 0}}","{{ $totals_per_month[2] ?? 0}}","{{ $totals_per_month[3] ?? 0}}"
                    ,"{{ $totals_per_month[4] ?? 0}}","{{ $totals_per_month[5] ?? 0}}","{{ $totals_per_month[6] ?? 0}}","{{ $totals_per_month[7] ?? 0}}"
                    ,"{{ $totals_per_month[8] ?? 0}}","{{ $totals_per_month[9] ?? 0}}","{{ $totals_per_month[10] ?? 0}}","{{ $totals_per_month[11] ?? 0}}"],
            }],
          },
          options: {
            maintainAspectRatio: false,
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
            scales: {
              xAxes: [{
                time: {
                  unit: 'month'
                },
                gridLines: {
                  display: false,
                  drawBorder: false
                },
                ticks: {
                  maxTicksLimit: 12
                },
                maxBarThickness: 25,
              }],
              yAxes: [{
                ticks: {
                  min: 0,
                  max: "{{max($totals_per_month)}}",
                  maxTicksLimit: 5,
                  padding: 10,
                  // Include a dollar sign in the ticks
                  callback: function(value, index, values) {
                    return 'Bs ' + number_format(value);
                  }
                },
                gridLines: {
                  color: "rgb(234, 236, 244)",
                  zeroLineColor: "rgb(234, 236, 244)",
                  drawBorder: false,
                  borderDash: [2],
                  zeroLineBorderDash: [2]
                }
              }],
            },
            legend: {
              display: false
            },
            tooltips: {
              titleMarginBottom: 10,
              titleFontColor: '#6e707e',
              titleFontSize: 14,
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              caretPadding: 10,
              callbacks: {
                label: function(tooltipItem, chart) {
                  var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                  return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
                }
              }
            },
          }
        });

    </script>
    <script>
        // Set new default font family and font color to mimic Bootstrap's default styling
        Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#858796';

        // Pie Chart Example
        var ctx = document.getElementById("myPieChart");
        var myPieChart = new Chart(ctx, {
          type: 'doughnut',
          data: {
            labels: ["Ingresos", "Costos", "Gastos"],
            datasets: [{
              data: ["{{ $totalIngresoPieChart ?? 0}}", "{{ $totalCostoPieChart ?? 0}}", "{{ $totalGastoPieChart ?? 0}}"],
              backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
              hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
              hoverBorderColor: "rgba(234, 236, 244, 1)",
            }],
          },
          options: {
            maintainAspectRatio: false,
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              caretPadding: 10,
            },
            legend: {
              display: false
            },
            cutoutPercentage: 80,
          },
        });

    </script>
    <!-- Page level custom scripts -->
    <script src="{{asset('vendor/sb-admin/js/demo/chart-area-demo.js')}}"></script>
@endsection
