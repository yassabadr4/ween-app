import 'package:flutter/material.dart';
import 'package:ween/core/componants/colors.dart';

class CustomPassword extends StatefulWidget {
  const CustomPassword({
    Key? key,
    this.keyboardType,
    required this.labelText,
    required this.prefixIcon,
  }) : super(key: key);
  final String labelText;
  final Widget prefixIcon;
  final TextInputType? keyboardType;

  @override
  State<CustomPassword> createState() => _CustomPasswordState();
}

class _CustomPasswordState extends State<CustomPassword> {
  bool obscureText = true;

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
            validator: (value) {
              if (value!.isEmpty) {
                return 'field is required';
              }
              return null;
            },
            obscureText: obscureText,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: kPrimary,
                ),
                onPressed: () {
                  setState(
                    () {
                      obscureText = !obscureText;
                    },
                  );
                },
              ),
              prefixIcon: widget.prefixIcon,
              hintText: widget.labelText,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
