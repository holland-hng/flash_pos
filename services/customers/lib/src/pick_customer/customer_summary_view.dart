import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CustomerSummaryView extends StatefulWidget {
  final String name;
  final String phone;
  final double height;
  final String loyaltyPoint;
  final Color? backgroundColor;
  final bool isSelected;
  final Function()? onTap;
  final Function()? onTapUpdate;

  const CustomerSummaryView({
    super.key,
    this.name = 'Name',
    this.phone = 'Phone',
    this.loyaltyPoint = 'Loyalty point',
    this.height = 50,
    this.onTap,
    this.backgroundColor,
    this.isSelected = false,
    this.onTapUpdate,
  });

  @override
  State<CustomerSummaryView> createState() => _CustomerSummaryViewState();
}

class _CustomerSummaryViewState extends State<CustomerSummaryView> {
  late final expandController =
      ExpandableController(initialExpanded: widget.isSelected);

  @override
  void didUpdateWidget(covariant CustomerSummaryView oldWidget) {
    if (widget.isSelected != oldWidget.isSelected) {
      expandController.toggle();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.backgroundColor ?? context.color.surface,
      child: InkWell(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Ink(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              height: widget.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomerSummaryCellView(widget.name),
                  CustomerSummaryCellView(
                    widget.phone,
                    flex: 4,
                  ),
                  CustomerSummaryCellView(
                    widget.loyaltyPoint,
                    flex: 3,
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ),
            ExpandableNotifier(
              controller: expandController,
              child: Expandable(
                collapsed: Material(
                  color: context.color.surface,
                ),
                expanded: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 18,
                    ),
                    child: TextButton(
                      onPressed: widget.onTapUpdate,
                      child: Text(
                        widget.isSelected ? "Update customer info" : "",
                        style: context.typo.body1.semiBold.mergeColor(
                          context.color.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomerSummaryCellView extends StatelessWidget {
  final String text;
  final int flex;
  final Alignment alignment;

  const CustomerSummaryCellView(
    this.text, {
    super.key,
    this.flex = 5,
    this.alignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Align(
        alignment: alignment,
        child: Text(
          text,
          maxLines: 1,
          style: context.typo.body1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
