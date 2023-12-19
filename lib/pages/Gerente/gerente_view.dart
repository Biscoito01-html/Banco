import 'package:banco/components/DrawerGerente/drawer_gerentes.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Gerente_view extends StatelessWidget {
  Gerente_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
        title: Text("Gerente"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Apresentação de resultados",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 400,
              child: BarChart(
                BarChartData(
                  maxY: 30,
                  gridData: const FlGridData(
                    horizontalInterval: 5,
                  ),
                  backgroundColor: ThemeData().primaryColor,
                  alignment: BarChartAlignment.spaceAround,
                  titlesData: const FlTitlesData(
                    leftTitles:
                        AxisTitles(axisNameWidget: Text("Entrada de Caixa")),
                    bottomTitles: AxisTitles(
                      axisNameWidget: Text("Tempo"),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                  ),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(toY: 5, color: Colors.grey),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(toY: 3, color: Colors.green),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(toY: 9, color: Colors.orange),
                      ],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(toY: 5, color: Colors.orange),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Entrada e saida geral",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 300,
              child: LineChart(
                LineChartData(
                  backgroundColor: ThemeData().primaryColor,
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color(0xff37434d),
                      width: 2,
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(1, 1),
                        FlSpot(2, 4),
                        FlSpot(3, 2),
                        FlSpot(4, 5),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: DrawerGerentes(),
    );
  }
}
