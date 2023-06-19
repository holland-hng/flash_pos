import 'package:flutter/material.dart';

abstract class IEnum implements Enum {
  String title(BuildContext context);
}
