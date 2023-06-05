import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:setting/di/di.dart';
import 'setting_controller.dart';

@RoutePage()
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final settingController = getIt<SettingController>();
  final appRouter = getIt<AppRouter>();
  final deepLink = getIt<AppDeepLink>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.surface,
      appBar: const FlashAppBar(title: 'Settings'),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: context.color.surface,
            ),
          ),
          const VerDivider(),
          Expanded(
            flex: 3,
            child: Container(
              color: context.color.background,
              child: Center(
                child: TextButton(
                  onPressed: () async {
                    if (kIsWeb) {
                      appRouter.replaceNamed(deepLink.login);
                    }
                    await settingController.logout();
                    if (mounted) {
                      await context.appBehavior.logout();
                      if (kIsWeb) {
                        //do nothing
                      } else {
                        appRouter.replaceNamed(deepLink.login);
                      }
                    }
                  },
                  child: const Text("Logout"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
