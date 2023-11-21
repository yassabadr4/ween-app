import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, this.onPressed, required this.icon});
 final void Function()? onPressed;
 final Widget icon;
  @override
  Widget build(BuildContext context) {
    return  IconButton(
      onPressed: onPressed,
      icon: icon,
    );
  }
}
