import 'package:flutter/material.dart';

import 'tab_button.dart';

class FlashAppBarDeprecated extends StatelessWidget {
  final List<String> tabs;
  final Widget title;
  final EdgeInsetsGeometry? titlePadding;
  final bool floating;
  final bool pinned;
  final double bottomHeight;
  final Color? backgroundColor;
  final Color? tabBackgroundColor;
  final double? elevation;

  const FlashAppBarDeprecated({
    super.key,
    this.tabs = const [],
    required this.title,
    this.bottomHeight = 0,
    this.titlePadding,
    this.floating = true,
    this.pinned = true,
    this.backgroundColor,
    this.tabBackgroundColor,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50,
      backgroundColor: backgroundColor,
      elevation: elevation,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        title: title,
        titlePadding: titlePadding,
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(tabs.length <= 1 ? 0 : bottomHeight),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [Colors.white, Colors.white.withOpacity(0.05)],
                stops: const [0.9, 1],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            child: tabs.length <= 1
                ? null
                : TabBar(
                    isScrollable: true,
                    padding:
                        const EdgeInsets.only(bottom: 12, left: 18, right: 6),
                    labelPadding: const EdgeInsets.only(right: 12),
                    indicatorPadding: const EdgeInsets.only(right: 12),
                    indicator: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      color: Colors.blueGrey,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorWeight: 0.0,
                    tabs: tabs
                        .map((tab) => TabButton(
                              tabBackgroundColor: tabBackgroundColor,
                              title: tab,
                            ))
                        .toList()),
          ),
        ),
      ),
    );
  }
}
