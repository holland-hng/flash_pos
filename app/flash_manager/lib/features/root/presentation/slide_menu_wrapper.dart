import 'package:core_ui/core_ui.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

typedef OnTapMenuItem = Function(int);

class SlideMenuWrapper extends StatefulWidget {
  const SlideMenuWrapper({
    super.key,
    required this.child,
    required this.onTapMenuItem,
  });
  final Widget child;
  final OnTapMenuItem onTapMenuItem;
  @override
  State<SlideMenuWrapper> createState() => _SlideMenuWrapperState();
}

class _SlideMenuWrapperState extends State<SlideMenuWrapper> {
  final sideMenuController = SideMenuController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenuController,
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.flash_on,
                    size: 28,
                    color: context.color.primary,
                  ),
                  GradientText(
                    "Flash Manager",
                    style: context.typo.headline6.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 17,
                      color: context.color.secondary,
                    ),
                    gradient: LinearGradient(colors: [
                      context.color.primary,
                      context.color.secondary,
                    ]),
                  ),
                ],
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: context.localizations.dashboard,
                onTap: onTapMenuItem,
                icon: const Icon(Icons.home),
              ),
              SideMenuItem(
                priority: 1,
                title: context.localizations.floors,
                onTap: onTapMenuItem,
                icon: const Icon(
                  Icons.layers,
                ),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Exit',
                onTap: (index, _) {
                  //do something
                },
                icon: const Icon(Icons.exit_to_app),
              ),
            ],
            style: SideMenuStyle(
                displayMode: SideMenuDisplayMode.auto,
                decoration: const BoxDecoration(),
                openSideMenuWidth: 240,
                compactSideMenuWidth: 60,
                hoverColor: context.color.primary.withAlpha(100),
                selectedColor: context.color.primary,
                selectedIconColor: Colors.white,
                unselectedIconColor: Colors.black,
                backgroundColor: Colors.white,
                selectedTitleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
                unselectedTitleTextStyle: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
                iconSize: 20,
                itemBorderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
                showTooltip: true,
                itemHeight: 40.0,
                itemInnerSpacing: 8.0,
                itemOuterPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                toggleColor: Colors.black54),
          ),
          Expanded(
            child: widget.child,
          ),
        ],
      ),
    );
  }

  void onTapMenuItem(int index, SideMenuController _) {
    widget.onTapMenuItem(index);
    sideMenuController.changePage(index);
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
