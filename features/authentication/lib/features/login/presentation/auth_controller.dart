import 'package:auth_service/auth_service.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:flutter/foundation.dart';

@injectable
class AuthController {
  final AuthService authService;
  final AppRouter appRouter;
  final AppDeepLink deepLink;
  final RxBool isLoading = false.obs;
  FormLogin formLogin = const FormLogin();

  AuthController(
    this.authService,
    this.appRouter,
    this.deepLink,
  );

  String? emailValidator(String? email) {
    formLogin = formLogin.copyWith(email: email);
    if (email == null || email.isEmpty) {
      return "This field is mandatory";
    }
    final isValid = email.isEmail;
    if (isValid) {
      return null;
    } else {
      return 'Invalid email format';
    }
  }

  String? passwordValidator(String? password) {
    formLogin = formLogin.copyWith(password: password);
    if (password == null || password.isEmpty) {
      return "This field is mandatory";
    }
    if (password.length < 8) {
      return 'Minimum of 8 characters';
    }

    return null;
  }

  Future<void> login() async {
    final validEmail = emailValidator(formLogin.email) == null;
    final validPassword = passwordValidator(formLogin.password) == null;
    if (validEmail && validPassword) {
      isLoading.value = true;
      try {
        await authService.login(formLogin);
        if (authService.authenticated) {
          appRouter.replaceNamed(deepLink.root);
        } else {
          // :)) oh wow
        }
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }
}
