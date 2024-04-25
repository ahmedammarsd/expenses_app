import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatefulWidget {
  const LineChart({super.key});

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  List<ExpensesData>? _chartData;
  List<IncomeData>? _chartDataIncome;
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    // TODO: implement initState
    _chartData = getChartData();
    _chartDataIncome = getChartDataIncom();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200.h,
      child: SfCartesianChart(
        legend: const Legend(isVisible: true),
        tooltipBehavior: _tooltipBehavior,
        series: <CartesianSeries>[
          LineSeries<IncomeData, double>(
            name: "Income",
            width: 3,
            color: Colors.green.shade500,
            dataSource: _chartDataIncome,
            xValueMapper: (IncomeData income, _) => income.day,
            yValueMapper: (IncomeData income, _) => income.income,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            ),
            enableTooltip: true,
          ),
          LineSeries<ExpensesData, double>(
            name: "Expenses",
            width: 3,
            dataSource: _chartData,
            color: Colors.red.shade500,
            xValueMapper: (ExpensesData expense, _) => expense.day,
            yValueMapper: (ExpensesData expense, _) => expense.expenses,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            ),
            enableTooltip: true,
          ),
        ],
        primaryXAxis: const NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
        ),
        primaryYAxis: NumericAxis(
          numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
        ),
      ),
    );
  }

  List<ExpensesData> getChartData() {
    final List<ExpensesData> chartData = [
      ExpensesData(1, 10),
      ExpensesData(2, 15),
      ExpensesData(3, 20),
      ExpensesData(4, 40),
      ExpensesData(5, 100),
    ];
    return chartData;
  }

  List<IncomeData> getChartDataIncom() {
    final List<IncomeData> chartDataIncome = [
      IncomeData(1, 5),
      IncomeData(2, 10),
      IncomeData(3, 90),
      IncomeData(4, 30),
      IncomeData(5, 120),
    ];
    return chartDataIncome;
  }
}

class ExpensesData {
  ExpensesData(this.day, this.expenses);
  final double day;
  final double expenses;
}

class IncomeData {
  IncomeData(this.day, this.income);
  final double day;
  final double income;
}
