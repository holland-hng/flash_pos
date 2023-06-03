import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  final Function(bool)? onResult;
  const LoginScreen({super.key, this.onResult});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.1,
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.black),
        ),
        toolbarHeight: 44,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.appLogo.svg(),
            Text("id"),
            Text("password"),
          ],
        ),
      ),
    );
  }
}
