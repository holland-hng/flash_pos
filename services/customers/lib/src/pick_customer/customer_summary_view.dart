import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CustomerSummaryView extends StatelessWidget {
  final String name;
  final String phone;
  final double height;

  final String loyaltyPoint;

  const CustomerSummaryView({
    super.key,
    this.name = 'Name',
    this.phone = 'Phone',
    this.loyaltyPoint = 'Loyalty point',
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomerSummaryCellView(name),
          CustomerSummaryCellView(
            phone,
            flex: 4,
          ),
          CustomerSummaryCellView(
            loyaltyPoint,
            flex: 3,
            alignment: Alignment.centerRight,
          ),
        ],
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
