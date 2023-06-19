import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

enum FilterType {
  today,
  last7days,
  all,
}

extension FilterTypeExtension on FilterType {
  String title(BuildContext context) {
    switch (this) {
      case FilterType.today:
        return 'Today';
      case FilterType.last7days:
        return 'Last 7 days';
      case FilterType.all:
        return 'All';
      default:
        throw UnimplementedError();
    }
  }
}

class FilterButton extends StatefulWidget {
  final FilterType type;
  final List<FilterType> options;
  final Function(FilterType)? callBack;
  const FilterButton({
    super.key,
    this.type = FilterType.today,
    this.callBack,
    this.options = const [
      FilterType.today,
      FilterType.last7days,
      FilterType.all,
    ],
  });

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  late FilterType type = widget.type;
  @override
  Widget build(BuildContext context) {
    return DropdownWidget<FilterType>(
      children: widget.options,
      itemWidgetBuilder: (index, FilterType filterType) {
        return DropDownItemWidget(
          isSelected: filterType == type,
          item: (
            null,
            filterType.title(context),
          ),
        );
      },
      onChanged: (value) {
        widget.callBack?.call(value);
        setState(() {
          type = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.color.primary,
        ),
        margin: const EdgeInsets.symmetric(vertical: 1),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.tune,
                color: context.color.surface,
                size: 20,
              ),
              4.0.horizontal,
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  "Filter : ${type.title(context)}",
                  style: context.typo.body1.semiBold.mergeColor(
                    context.color.surface,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
