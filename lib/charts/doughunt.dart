import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChart extends StatefulWidget {
  const DoughnutChart({super.key});

  @override
  State<DoughnutChart> createState() => _DoughnutChartState();
}

class _DoughnutChartState extends State<DoughnutChart> {
  late List<ExpensesAndIncome> _chartData;
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    // TODO: implement initState
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200.h,
      child: SfCircularChart(
        legend: const Legend(
            isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          DoughnutSeries<ExpensesAndIncome, String>(
            dataSource: _chartData,
            enableTooltip: true,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              overflowMode: OverflowMode.hide,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            pointColorMapper: (ExpensesAndIncome data, _) => data.color,
            xValueMapper: (ExpensesAndIncome data, _) => data.type,
            yValueMapper: (ExpensesAndIncome data, _) => data.total,
            // explode: true,
            // explodeAll: true,
          ),
        ],
      ),
    );
  }

  List<ExpensesAndIncome> getChartData() {
    final List<ExpensesAndIncome> chartData = [
      ExpensesAndIncome("Income", 50000, Colors.green.shade500),
      ExpensesAndIncome("Expenses", 90000, Colors.red.shade500),
    ];
    return chartData;
  }
}

class ExpensesAndIncome {
  ExpensesAndIncome(this.type, this.total, this.color);
  final String type;
  final int total;
  final Color color;
}
