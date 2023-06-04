import '/di/di.dart';
import 'package:flutter/material.dart';
import 'features/floor_table/presentation/floor_table_screen.dart';

void main() {
  configureDependencies();
  runApp(const FloorTableApp());
}

class FloorTableApp extends StatefulWidget {
  const FloorTableApp({super.key});

  @override
  State<FloorTableApp> createState() => _FloorTableAppState();
}

class _FloorTableAppState extends State<FloorTableApp> {
  //final _appRouter = FloorTableRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FloorTableScreen(),
      title: 'Floor Table App',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
