import 'package:flutter/material.dart';

import '../colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onPressd,
    required this.title,
  }) : super(key: key);
  final Function()? onPressd;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            color: kPrimary,
            borderRadius: BorderRadius.circular(16),
          ),
          width: double.infinity,
          height: 50,
          child: MaterialButton(
              elevation: 16,
              onPressed: onPressd,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )),
        ),
      ),
    );
  }
}
