import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nutrition/screens/settingsPage.dart';
import 'package:nutrition/widgets/customListTile.dart';

class Tracker extends StatelessWidget {
  const Tracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Charts"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const BuildCustomListTile(title: 'Daily Calories', value: "2000"),
            const SizedBox(height: 13),
            const BuildCustomListTile(title: 'Daily Protein', value: "20g"),
            const SizedBox(height: 13),
            const BuildCustomListTile(title: 'Daily Carbs', value: "20g"),
            const SizedBox(height: 13),
            const BuildCustomListTile(title: 'Daily Fat', value: "20g"),
            const SizedBox(height: 13),
            Expanded(
              child: SizedBox(
                height: 250, // Smaller height for the chart
                width: double.infinity,
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                        dotData: const FlDotData(show: false),
                        isCurved: true,
                        barWidth: 4,
                        color: Colors.blue,
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: const LinearGradient(
                            colors: [
                              Colors.blue,
                              Colors.lightBlueAccent,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        spots: const [
                          FlSpot(0, 10),
                          FlSpot(1, 40),
                          FlSpot(2, 100),
                          FlSpot(3, 80),
                          FlSpot(4, 20),
                          FlSpot(5, 100),
                          FlSpot(6, 70),
                          FlSpot(7, 30),
                        ],
                      ),
                    ],
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: true,
                      horizontalInterval: 20,
                      verticalInterval: 1,
                      getDrawingHorizontalLine: (value) => const FlLine(
                        color: Colors.grey,
                        strokeWidth: 1,
                      ),
                      getDrawingVerticalLine: (value) => const FlLine(
                        color: Colors.grey,
                        strokeWidth: 1,
                      ),
                    ),
                    titlesData: const FlTitlesData(
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
