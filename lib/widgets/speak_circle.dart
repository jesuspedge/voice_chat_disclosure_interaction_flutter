import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpeakCircle extends StatelessWidget {
  const SpeakCircle({
    required this.animationColor,
    required this.backgroundColor,
    super.key,
  });

  final Color backgroundColor;
  final Color animationColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(color: Colors.black38, blurRadius: 3),
        ],
      ),
      child: SpinKitWave(
        color: animationColor,
        type: SpinKitWaveType.center,
        size: 12,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
