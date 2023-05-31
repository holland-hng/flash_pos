import 'package:core_ui/core_ui.dart';
import 'package:floor_table/features/floor_table/domain/furniture/template_furniture.dart';
import '/di/di.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:flutter/material.dart';
import '../controllers/furniture_creator.dart';
import '../../domain/furniture/furniture.dart';

class FurniturePanelView extends StatefulWidget {
  final FurnitureCreator? furnitureCreator;

  const FurniturePanelView({
    super.key,
    this.furnitureCreator,
  });

  @override
  State<FurniturePanelView> createState() => _FurniturePanelViewState();
}

class _FurniturePanelViewState extends State<FurniturePanelView> {
  late FurnitureCreator creator =
      widget.furnitureCreator ?? getIt<FurnitureCreator>();

  @override
  void initState() {
    super.initState();
  }

  final buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return Colors.grey.shade200;
      }
      return Colors.grey.shade300;
    }),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        height: 80,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: InkWell(
                onTap: () {
                  creator.clearSelection();
                },
                child: Ink(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 0.5, color: Colors.grey),
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.block,
                    size: 30,
                    color: Colors.blueGrey,
                  )),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Obx(
                () {
                  return ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    itemCount: creator.templateList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      final furniture = creator.templateList[index];
                      final furniturePreview = furniture.miniPreview;
                      return Material(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: InkWell(
                          onTap: () {
                            creator.selectFurniture(furniture);
                          },
                          child: Obx(() {
                            final isSelected = creator.isSelected(furniture);
                            return Ink(
                              padding:
                                  const EdgeInsets.only(left: 8, right: 12),
                              key: ValueKey(furniture.name),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.blue[100]
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  Center(
                                    child: Container(
                                      width: furniturePreview.width,
                                      height: furniturePreview.height,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey,
                                        shape: furniturePreview.shape.boxShape,
                                        borderRadius:
                                            furniturePreview.borderRadius,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        furniture.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        furniture.sizeString,
                                        style: const TextStyle(
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                  PreviewCreateMode(
                                    isSelected: isSelected,
                                    mode: creator.selectedTemplate.value.mode,
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      );
                    }),
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      style: buttonStyle,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.dashboard_customize_sharp,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      width: 0.5,
                      height: 30,
                      color: Colors.grey,
                    )
                  ],
                ),
                IconButton(
                  style: buttonStyle,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.replay_outlined,
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  style: buttonStyle,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.save,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  style: buttonStyle,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PreviewCreateMode extends StatefulWidget {
  const PreviewCreateMode({
    super.key,
    required this.mode,
    required this.isSelected,
  });

  final FurnitureCreateMode mode;
  final bool isSelected;

  @override
  State<PreviewCreateMode> createState() => _PreviewCreateModeState();
}

class _PreviewCreateModeState extends State<PreviewCreateMode> {
  final ExpandableController controller =
      ExpandableController(initialExpanded: false);
  @override
  void didUpdateWidget(covariant PreviewCreateMode oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isSelected && oldWidget.isSelected == false) {
        controller.expanded = true;
      } else if (widget.isSelected == false && oldWidget.isSelected) {
        controller.expanded = false;
      }
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      controller: controller,
      child: Expandable(
        collapsed: Container(
          color: Colors.white,
        ),
        expanded: Row(
          children: [
            Container(
              width: 0.5,
              color: Colors.grey,
              margin: const EdgeInsets.only(
                left: 8,
                top: 8,
                bottom: 8,
                right: 4,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              width: 50,
              child: Center(
                child: Text(
                  widget.mode.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
