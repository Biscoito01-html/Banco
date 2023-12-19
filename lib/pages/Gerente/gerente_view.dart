import 'package:banco/components/DrawerGerente/drawer_gerentes.dart';
import 'package:banco/provider/lista_cliente_novo.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

class Gerente_view extends StatefulWidget {
  Gerente_view({Key? key}) : super(key: key);

  @override
  State<Gerente_view> createState() => _Gerente_viewState();
}

// ignore: camel_case_types
class _Gerente_viewState extends State<Gerente_view> {
  @override
  void initState() {
    super.initState();

    Provider.of<NovoClienteComConta>(context, listen: false).pegarNoServidor();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.exit_to_app)),
        ],
        title: const Text("Gerente"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
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
            const Text(
              "Entrada e saida geral",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 300,
              child: LineChart(
                LineChartData(
                  backgroundColor: ThemeData().primaryColor,
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
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
                        const FlSpot(0, 3),
                        const FlSpot(1, 1),
                        const FlSpot(2, 4),
                        const FlSpot(3, 2),
                        const FlSpot(4, 5),
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
      drawer: const DrawerGerentes(),
    );
  }
}
