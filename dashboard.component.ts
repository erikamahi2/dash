import { Component } from '@angular/core';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent {
  // Opciones generales para los gráficos
  public chartOptions = {
    responsive: true,
    maintainAspectRatio: false,
  };

  // Datos para el gráfico de barras
  public barChartLabels: string[] = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio'];
  public barChartData: any[] = [
    { data: [65, 59, 80, 81, 56, 55], label: 'Ventas' },
    { data: [28, 48, 40, 19, 86, 27], label: 'Objetivo' }
  ];

  // Datos para el gráfico de líneas
  public lineChartLabels: string[] = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio'];
  public lineChartData: any[] = [
    { data: [65, 59, 80, 81, 56, 55], label: 'Usuarios' }
  ];

  // Datos para el gráfico de pastel
  public pieChartLabels: string[] = ['Producto A', 'Producto B', 'Producto C'];
  public pieChartData: number[] = [120, 150, 180];
}
