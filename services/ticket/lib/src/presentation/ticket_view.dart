import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:ticket_service/ticket_service.dart';

class TicketView extends StatefulWidget {
  final TicketHandler ticketHandler;
  const TicketView({super.key, required this.ticketHandler});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  late final ticketHandler = widget.ticketHandler;
  final popupHandler = PopupHandler.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.color.surface,
      appBar: const FlashAppBar(
        title: 'Ticket',
      ),
      body: Obx(
        () {
          final mode = ticketHandler.rxMode.value;
          debugPrint(mode.toString());
          return ListView(
            shrinkWrap: false,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.color.surface,
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                height: 60,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 10),
                        //   child: TextButton(
                        //       onPressed: () {
                        //         print("alo");
                        //       },
                        //       child: Text(
                        //         "Add customer",
                        //         style: context.typo.body1.medium
                        //             .mergeColor(context.color.primary),
                        //       )),
                        // )
                        Expanded(
                          child: Text(
                            "Michael Jason",
                            style: context.typo.body1.medium
                                .mergeStyle(fontSize: 13),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        10.0.horizontal,
                        Text(
                          "+84386412929",
                          style: context.typo.body2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListView.builder(
                padding: const EdgeInsets.only(bottom: 36),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ticketHandler.rxSections.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    child: Obx(() {
                      final section = ticketHandler.rxSections[index];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (section.name.isNotEmpty) Text(section.name),
                          Flexible(
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: section.tickets.length,
                              itemBuilder: (context, index) {
                                final ticketItem = section.tickets[index];
                                final product = ticketItem.product;
                                return Slidable(
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) async {
                                          final result = await popupHandler
                                              .showPopup<TicketItem>(
                                            canPop: true,
                                            context: context,
                                            builder: (popupContext) {
                                              return PickProductPopup(
                                                ticketItem: ticketItem,
                                              );
                                            },
                                          );
                                          if (result != null) {
                                            ticketHandler.updateItem(result);
                                          }
                                        },
                                        backgroundColor:
                                            const Color(0xFF7BC043),
                                        foregroundColor: Colors.white,
                                        icon: Icons.edit,
                                      ),
                                      SlidableAction(
                                        onPressed: (context) {},
                                        backgroundColor: Colors.redAccent,
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete_outline,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14, horizontal: 18),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "${ticketItem.quantity}x ${product.name}",
                                                style: context.typo.body1.medium
                                                    .mergeStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "\$${ticketItem.price.toStringAsFixed(2)}",
                                              style:
                                                  context.typo.body1.mergeStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount:
                                                ticketItem.pickedDetails.length,
                                            itemBuilder: (context, index) {
                                              final optionDetail = ticketItem
                                                  .pickedDetails[index];
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 6),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                          optionDetail.name,
                                                          style: context
                                                              .typo.body2.thin),
                                                    ),
                                                    Text(
                                                      "\$${optionDetail.price.toStringAsFixed(2)}",
                                                      style: context
                                                          .typo.body2.thin,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        if (ticketItem.note.isNotEmpty)
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 6),
                                            child: Text(
                                              "Note: ${ticketItem.note}",
                                              style: context.typo.body2.thin
                                                  .mergeColor(
                                                context.color.primary,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const HorDivider(),
                            ),
                          ),
                        ],
                      );
                    }),
                  );
                },
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const HorDivider(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Obx(() {
              final ticketPrice = ticketHandler.ticketPrice;
              debugPrint(ticketHandler.rxSections.toString());
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub total",
                        style: context.typo.body2,
                      ),
                      Text(
                        "\$${ticketPrice.subTotal.toStringAsFixed(2)}",
                        style: context.typo.body2,
                      ),
                    ],
                  ),
                  4.0.vertical,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tax:",
                        style: context.typo.body2,
                      ),
                      Text(
                        "\$${ticketPrice.tax.toStringAsFixed(2)}",
                        style: context.typo.body2,
                      ),
                    ],
                  ),
                  4.0.vertical,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total:",
                        style: context.typo.body1.bold,
                      ),
                      Text(
                        "\$${ticketPrice.total.toStringAsFixed(2)}",
                        style: context.typo.body1.bold,
                      ),
                    ],
                  ),
                  18.0.vertical,
                  SizedBox(
                    height: 34,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              debugPrint("Save");
                            },
                            child: Ink(
                              padding: const EdgeInsets.only(bottom: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: context.color.tertiary,
                              ),
                              child: Center(
                                child: Text(
                                  "Save draft",
                                  style: context.typo.body1.bold
                                      .mergeColor(Colors.black54),
                                ),
                              ),
                            ),
                          ),
                        ),
                        12.0.horizontal,
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              debugPrint("Process");
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Ink(
                              padding: const EdgeInsets.only(bottom: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: context.color.primary,
                              ),
                              child: Center(
                                child: Text(
                                  "Checkout",
                                  style: context.typo.body1.bold.mergeColor(
                                    context.color.surface,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
