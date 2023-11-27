import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    this.onChanged,
    this.keyboardType,
    this.onFieldSubmitted,
  }) : super(key: key);
  final String labelText;
  final Widget prefixIcon;
  final Function(String?)? onChanged;
  final TextInputType? keyboardType;
 final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 6,
          child: TextFormField(
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            validator: (value) {
              if (value!.isEmpty) {
                return 'field is required';
              }
              return null;
            },
            keyboardType: keyboardType,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              hintText: labelText,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFromField1 extends StatelessWidget {
  const CustomTextFromField1({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    this.onChanged,
    this.keyboardType,
  }) : super(key: key);
  final String labelText;
  final Widget prefixIcon;
  final Function(String?)? onChanged;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 6,
          child: TextFormField(
            onChanged: onChanged,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              hintText: labelText,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

