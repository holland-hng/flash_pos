import 'package:core_data/di/di.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:grouped_scroll_view/grouped_scroll_view.dart';
import 'menu_controller.dart';

@RoutePage()
class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final menuController = getIt<MenuFlashController>();
  @override
  void initState() {
    menuController.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade200,
      body: Row(
        children: [
          Expanded(
            flex: 7,
            child: Scaffold(
              backgroundColor: context.color.background,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Obx(() {
                  return GroupedScrollView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 18,
                      crossAxisCount: 4,
                      childAspectRatio: 2,
                    ),
                    data: menuController.rxCategories,
                    itemBuilder: (BuildContext context, item) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(
                            4,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 18),
                        //constraints: const BoxConstraints.tightFor(width: 100),

                        child: Center(
                          child: Text(
                            item.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Scaffold(
              backgroundColor: context.color.surface,
              appBar: FlashAppBar(
                title: 'Ticket',
                centerTitle: false,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Customers: 2'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
