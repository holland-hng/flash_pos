import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:menu/features/category/presentation/category_products_view.dart';
import 'package:menu/features/menu/presentation/menu_controller.dart';
import 'menu_app_bar.dart';

class MenuMiniApp extends StatelessWidget {
  final MenuFlashController menuController;
  const MenuMiniApp({super.key, required this.menuController});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalWidgetsLocalizations.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        supportedLocales: localizedLabels.keys.toList(),
        theme: Theme.of(context),
        home: MenuView(menuController: menuController));
  }
}

class MenuView extends StatefulWidget {
  final MenuFlashController menuController;
  const MenuView({
    super.key,
    required this.menuController,
  });

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  late MenuFlashController menuController = widget.menuController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Obx(
        () {
          switch (menuController.rxState.value) {
            case BaseState.idle:
            case BaseState.fetching:
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case BaseState.fetchingSuccess:
              return DefaultTabController(
                length: menuController.rxCategories.length,
                child: ExtendedNestedScrollView(
                  onlyOneScrollInBody: true,
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (context, _) {
                    return [
                      MenuAppBar(tabs: menuController.categoryTitles),
                    ];
                  },
                  body: TabBarView(
                    children: menuController.rxCategories
                        .map(
                          (category) => CategoryProductsView(
                            key: ValueKey(category.id),
                            category: category,
                            pickProduct: menuController.cartHandler.addCartItem,
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
            default:
              return const Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
