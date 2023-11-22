import 'package:flutter/material.dart';

class SoundGradeTitle extends StatelessWidget {
  const SoundGradeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Image.asset(
        'lib/assets/images/logo.png',
        width: 300,
        height: 300,
      ),
    );
  }
}
