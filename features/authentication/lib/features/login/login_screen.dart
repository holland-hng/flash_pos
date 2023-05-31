import 'package:core_router/core_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          MaterialButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {},
            child: Container(
              width: 300,
              height: 40,
              color: Colors.red,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("asd"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.router.pushNamed(AppDeepLink().delivery);
      }),
    );
  }
}
