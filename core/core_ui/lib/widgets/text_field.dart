import 'package:flutter/material.dart';

final enabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(4),
  borderSide: const BorderSide(
    width: 0.2,
    color: Color.fromARGB(255, 200, 200, 200),
  ),
);
final focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(4),
  borderSide: const BorderSide(
    width: 0.2,
    color: Colors.blueAccent,
  ),
);
