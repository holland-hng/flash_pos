import 'package:core_router/core_router.dart';
import 'package:flutter/material.dart';
import 'widgets/line_chart.dart';

@RoutePage()
class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          flex: 2,
          child: LineChartView(),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(),
        )
      ],
    );
  }
}
