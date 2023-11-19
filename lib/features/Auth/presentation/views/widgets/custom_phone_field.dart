import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:ween/core/componants/colors.dart';

class CustomPhoneFromField extends StatelessWidget {
  const CustomPhoneFromField({
    Key? key,
    required this.labelText,
    this.onChanged,
    this.controller,
  }) : super(key: key);
  final String labelText;
  final Function(PhoneNumber?)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: IntlPhoneField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.start,
        onChanged: onChanged,
        validator: (value) {
          if (value == null) {
            return 'field is required';
          }
          return null;
        },
        decoration: InputDecoration(
          isCollapsed: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimary),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimary),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          prefixIconColor: kPrimary,
          labelText: labelText,
          // hintStyle: TextStyle(color: Colors.blue),
          filled: true,
          fillColor: kSecondary,
        ),
      ),
    );
  }
}
