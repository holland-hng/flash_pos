import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        18.0.vertical,
        Container(
          height: 36,
          color: Colors.white,
        ),
        18.0.vertical,
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: 0.5),
            decoration: BoxDecoration(
              color: context.color.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Center(child: Text("Name"))),
                Expanded(child: Center(child: Text("Phone number"))),
                Expanded(child: Center(child: Text("Email"))),
                Expanded(child: Center(child: Text("Address"))),
                Expanded(child: Center(child: Text("Loyalty point"))),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: context.color.surface,
            ),
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 36),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      print(index);
                    },
                    child: SizedBox(
                        height: 60,
                        child: Row(
                          children: [
                            Expanded(
                                child: Center(child: Text(index.toString()))),
                            Expanded(
                                child: Center(child: Text(index.toString()))),
                            Expanded(
                                child: Center(child: Text(index.toString()))),
                            Expanded(
                                child: Center(child: Text(index.toString()))),
                            Expanded(
                                child: Center(child: Text(index.toString()))),
                          ],
                        )),
                  ),
                );
              },
              itemCount: 20,
              separatorBuilder: (context, index) {
                return const HorDivider();
              },
            ),
          ),
        ),
      ],
    );
  }
}
