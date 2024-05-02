import 'package:flutter/material.dart';

Row buildSlider({
  required String title,
  required String name,
  required double? value,
  required void Function(double)? onChanged,
}) {
  return Row(
    children: [
      SizedBox(
        width: 75,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Expanded(
        child: Slider(
          // value: (controllerValue == null) ? 0 : controllerValue,
          value: value ?? 0,
          min: 0,
          max: 25,
          divisions: 10,
          activeColor: Colors.black,
          inactiveColor: Colors.black12,
          onChanged: onChanged,
        ),
      ),
    ],
  );
}
