import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CustomerSummaryView extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final String address;
  final String loyaltyPoint;

  const CustomerSummaryView({
    super.key,
    this.name = 'Name',
    this.phone = 'Phone number',
    this.email = 'Email',
    this.address = 'Address',
    this.loyaltyPoint = 'Loyalty point',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(child: SizedBox()),
        CustomerSummaryCellView(name),
        CustomerSummaryCellView(
          phone,
          flex: 4,
        ),
        CustomerSummaryCellView(email),
        //CustomerSummaryCellView(address),
        CustomerSummaryCellView(
          loyaltyPoint,
          flex: 3,
          alignment: Alignment.centerRight,
        ),
        const Expanded(child: SizedBox()),
      ],
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
        child: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            text,
            maxLines: 1,
            style: context.typo.body1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
