import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:menu/di/di.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:ticket_service/ticket_service.dart';
import 'menu_controller.dart';

@RoutePage()
class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final menuController = getIt<MenuFlashController>();
  final popupHandler = PopupHandler.instance;
  final ItemScrollController itemScrollController = ItemScrollController();
  late double productRatio;

  @override
  void initState() {
    menuController.fetchData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    productRatio = context.productRatio;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.background,
      resizeToAvoidBottomInset: false,
      body: Obx(() {
        switch (menuController.rxState.value) {
          case BaseState.idle:
          case BaseState.fetching:
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          case BaseState.fetchSuccess:
            return Row(
              children: [
                Expanded(
                  flex: 3,
                  child: LeftPanelView(
                    items: menuController.rxCategories
                        .map((category) => LeftPanelAction(category.name))
                        .toList(),
                    onTap: (int index, LeftPanelAction item) {
                      itemScrollController.scrollTo(
                          index: index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linearToEaseOut);
                    },
                    title: 'Menu',
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    backgroundColor: context.color.background,
                    appBar: FlashSearchBar(
                      hint: 'Food\'s name...',
                      onChanged: (value) {
                        debugPrint("Menu search: $value");
                      },
                    ),
                    body: Obx(() {
                      switch (menuController.rxState.value) {
                        case BaseState.idle:
                        case BaseState.fetching:
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        case BaseState.fetchSuccess:
                          return ScrollablePositionedList.separated(
                            itemScrollController: itemScrollController,
                            padding: const EdgeInsets.only(
                              left: 18,
                              right: 18,
                              bottom: 500,
                            ),
                            itemCount: menuController.rxCategories.length,
                            itemBuilder: (context, index) {
                              final category =
                                  menuController.rxCategories[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 21, bottom: 5),
                                    child: SizedBox(
                                      height: 34,
                                      child: Text(category.name,
                                          style: context.typo.body1.bold),
                                    ),
                                  ),
                                  Flexible(
                                    child: GridView.builder(
                                      padding: const EdgeInsets.all(0),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: category.products.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        mainAxisSpacing: 18,
                                        crossAxisSpacing: 18,
                                        childAspectRatio: productRatio,
                                      ),
                                      itemBuilder: (context, index) {
                                        final product =
                                            category.products[index];
                                        return InkWell(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          onTap: () async {
                                            final result = await popupHandler
                                                .showPopup<TicketItem>(
                                              context: context,
                                              builder: (popupContext) {
                                                return PickProductPopup(
                                                  ticketItem:
                                                      TicketItem.fromProduct(
                                                          product),
                                                  mode: PickProductMode.add,
                                                );
                                              },
                                            );
                                            if (result != null) {
                                              menuController.ticketService
                                                  .addTicketItem(
                                                result,
                                              );
                                            }
                                          },
                                          child: Ink(
                                            padding: const EdgeInsets.only(
                                                left: 12,
                                                right: 12,
                                                top: 10,
                                                bottom: 10),
                                            decoration: BoxDecoration(
                                              color: context.color.surface,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  width: 0.5,
                                                  color: Colors.grey.shade200),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  product.name,
                                                  style:
                                                      context.typo.body1.medium,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  "\$${product.price.toStringAsFixed(2)}",
                                                  style: context.typo.body1.thin
                                                      .mergeStyle(fontSize: 13),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return 20.0.vertical;
                            },
                          );
                        default:
                          return const Center(
                            child: Text("Error"),
                          );
                      }
                    }),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TicketView(
                    ticketService: menuController.ticketService,
                  ),
                ),
              ],
            );

          default:
            return const Center(child: Text("Error"));
        }
      }),
    );
  }
}

extension ProductRatio on BuildContext {
  double get productRatio {
    const height = 82;
    final widthScreen = Get.width > Get.height ? Get.width : Get.height;
    final widthView = widthScreen * 8 / 14;
    final widthProduct = (widthView - 18 * 5) / 4;
    final ratio = widthProduct / height;
    return ratio;
  }
}
