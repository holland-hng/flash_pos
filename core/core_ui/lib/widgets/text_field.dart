import 'package:flutter/material.dart';

final enabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(4),
  borderSide: const BorderSide(
    width: 0.2,
    color: Color.fromARGB(244, 210, 210, 210),
  ),
);
final focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(4),
  borderSide: const BorderSide(
    width: 0.2,
    color: Colors.blueAccent,
  ),
);

final errorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(4),
  borderSide: const BorderSide(
    width: 0.2,
    color: Colors.redAccent,
  ),
);
