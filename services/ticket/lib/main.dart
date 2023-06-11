import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:ticket_service/src/presentation/ticket_handler.dart';
import 'package:ticket_service/src/presentation/ticket_view.dart';
import 'di/di.dart';

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
