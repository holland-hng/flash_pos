import '/di/di.dart';
import 'widgets/floor_view.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'controllers/floor_controller.dart';
import 'widgets/furniture_panel_view.dart';
import 'package:core_router/core_router.dart';
import '/features/floor_table/presentation/widgets/furniture_edit_view.dart';

@RoutePage()
class FloorTableScreen extends StatefulWidget {
  const FloorTableScreen({super.key});

  @override
  State<FloorTableScreen> createState() => _FloorTableScreenState();
}

class _FloorTableScreenState extends State<FloorTableScreen> {
  final FloorController floorController = getIt<FloorController>();
  final expandableController = ExpandableController(initialExpanded: false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: const SafeArea(
        child: SizedBox(
          height: 18,
        ),
      ),
      body: Column(
        children: [
          FurniturePanelView(
            furnitureCreator: floorController.furnitureCreator,
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: Row(
              children: [
                _Spacer(controller: expandableController),
                Expanded(
                  child: FloorView(
                    floorController: floorController,
                  ),
                ),
                FurnitureEditView(
                  expandableController: expandableController,
                  furnitureEditor: floorController.furnitureEditor,
                  closeEditor: floorController.closeEditor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Spacer extends StatelessWidget {
  const _Spacer({
    required this.controller,
  });

  final ExpandableController controller;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      controller: controller,
      child: Expandable(
        collapsed: const Material(
          color: Colors.transparent,
        ),
        expanded: Container(
          width: 18,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
