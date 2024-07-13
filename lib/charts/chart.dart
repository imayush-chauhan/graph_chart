import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FFCharts extends StatefulWidget {
  const FFCharts({super.key});

  @override
  State<FFCharts> createState() => _FFChartsState();
}

class _FFChartsState extends State<FFCharts> {
  List<Color> gradientColors = const [
    Colors.blue,
    Colors.green,
    Colors.red,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i = 0; i < points.length; i++){
      pData.add(FlSpot(points[i][0], points[i][1]));
    }
    setState(() {});
  }

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(xData.length,(index){
                      return Text(xData[xData.length - 1 - index].toStringAsFixed(0));
                    }),
                  ),
                ),
                SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width- 100,
                  child: LineChart(
                   mainData(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(yData.length,(index){
                  return Text(yData[index].toStringAsFixed(0));
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // AspectRatio(
  // aspectRatio: 1.7,
  // child: Positioned(
  // top: 0,
  // left: 0,
  // child: Column(
  // children: List.generate(xData.length,(index){
  // return Text(xData[index].toStringAsFixed(0));
  // }),
  // ),
  // ),
  // )

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,

        checkToShowHorizontalLine: (_){
          if(_ == 70 || _ == 120){
            return true;
          }
          return false;
        },

        checkToShowVerticalLine: (_){
          if(_ == 5 || _ == 9){
            return true;
          }
          return false;
        },

        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.black.withOpacity(0.4),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.black.withOpacity(0.4),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: const FlTitlesData(
        show: false,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),

      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 24,
      minY: 0,
      maxY: 300,
      lineBarsData: [
        LineChartBarData(
          spots: pData,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  List<int> xData = [0,6,12,18,24];
  List<int> yData = [0,50,100,150,200,250,300];
  List<List<double>> points = [
    [0,100], [1, 120], [2, 130], [3, 140], [4, 150], [5, 160], [6,140], [7, 125], [8, 110], [9,
      95], [10, 80], [11, 75], [12, 70], [13, 65], [14, 60], [15, 55], [16, 65], [17, 80], [18, 90], [19, 90], [20, 100],
  [21, 130], [22, 150], [23, 160], [24, 180]
  ];
  List<FlSpot> pData = [];

}