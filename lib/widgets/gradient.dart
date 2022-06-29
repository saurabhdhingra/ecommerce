import 'package:flutter/material.dart';

class GradientMask extends StatelessWidget {
  const GradientMask({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: <Color>[
          Color.fromARGB(255, 55, 70, 253),
          Color.fromARGB(255, 122, 35, 160),
        ],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
