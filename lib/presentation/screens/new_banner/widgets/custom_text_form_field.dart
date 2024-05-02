import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildTextFormField({
  required state,
  required String? hintText,
  required void Function(String)? onChanged,
  required TextEditingController? controller,
  TextInputType? keyboardType = TextInputType.text,
  List<TextInputFormatter>? inputFormatters = const [],
}) {
  return TextFormField(
    controller: controller,
    onChanged: onChanged,
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
    decoration: InputDecoration(
      hintText: hintText,
    ),
  );
}
