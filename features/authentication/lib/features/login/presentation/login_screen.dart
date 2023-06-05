import 'package:authentication/di/di.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'auth_controller.dart';
import 'text_field.dart';

@RoutePage<bool>()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = getIt<AuthController>();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.background,
      body: Center(
        child: SizedBox(
          width: 388,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.appLogo.svg(color: context.color.primary),
                  Text(
                    "Flash POS",
                    style: context.typo.headline1.bold.mergeStyle(
                      fontSize: 48,
                      color: context.color.primary,
                    ),
                  ),
                  40.0.vertical,
                  AppTextField(
                    hintText: "Email address",
                    textInputAction: TextInputAction.next,
                    validator: authController.emailValidator,
                    prefixIcon: const Icon(Icons.group),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  24.0.vertical,
                  AppTextField(
                    hintText: "Password",
                    textInputAction: TextInputAction.done,
                    validator: authController.passwordValidator,
                    prefixIcon: const Icon(Icons.lock),
                    obscureText: true,
                    autocorrect: false,
                    enableSuggestions: false,
                    onSubmitted: (_) {
                      final isValid = formKey.currentState?.validate() ?? false;
                      if (isValid) {
                        authController.login();
                      }
                    },
                  ),
                  24.0.vertical,
                  Material(
                    child: Obx(() {
                      return IgnorePointer(
                        ignoring: authController.isLoading.value,
                        child: InkWell(
                          onTap: () {
                            final isValid =
                                formKey.currentState?.validate() ?? false;
                            if (isValid) {
                              authController.login();
                            }
                          },
                          child: Ink(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: context.color.primary,
                            ),
                            child: Center(
                              child: authController.isLoading.value
                                  ? const SizedBox(
                                      width: 28,
                                      height: 28,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      "Login",
                                      style: context.typo.headline6.semiBold
                                          .mergeStyle(
                                        color: context.color.background,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const _BottomNavigationBar(),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SafeArea(
          child: Container(
            margin: const EdgeInsets.only(bottom: 10, top: 100),
            width: 388,
            child: Center(
              child: Builder(builder: (context) {
                return RichText(
                  text: TextSpan(
                    text: 'By continuing, you accept the ',
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'terms of use',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
