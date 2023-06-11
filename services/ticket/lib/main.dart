import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'di/di.dart';
import 'ticket_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const TicketApp());
}

class TicketApp extends StatefulWidget {
  const TicketApp({super.key});

  @override
  State<TicketApp> createState() => _TicketAppState();
}

class _TicketAppState extends State<TicketApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppManager(builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Customers App',
        home: TicketView(ticketHandler: getIt<TicketHandler>()),
      );
    });
  }
}
