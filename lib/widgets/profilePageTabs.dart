import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ProfilePageTab extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isShadows;

  const ProfilePageTab({
    super.key,
    required this.icon,
    required this.label,
    required this.isShadows,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        width: width,
        height: height * 0.07,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          boxShadow: isShadows
              ? [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(
                      0.0,
                      -5.0,
                    ),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(
                      0.0,
                      -3.0,
                    ),
                    blurRadius: 0.2,
                    spreadRadius: 0.1,
                  )
                ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon),
            Text(label,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(width: width * 0.3),
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.chevron_right, color: Colors.grey.shade400),
            ),
          ],
        ),
      ),
    );
  }
}
