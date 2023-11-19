import 'package:flutter/material.dart';

import '../../../../../core/componants/colors.dart';

class CustomContact extends StatelessWidget {
  const CustomContact({
    Key? key,
    required this.icon,
    required this.title,
    this.ontap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: SizedBox(
        height: 60,
        child: Card(
          elevation: 6,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: kPrimary,
                ),
                Spacer(),
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: kPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
