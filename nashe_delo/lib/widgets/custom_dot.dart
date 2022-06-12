import 'package:flutter/material.dart';

class CustomDot extends StatelessWidget {
  const CustomDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      height: 4,
      width: 4,
      decoration: const BoxDecoration(
          color: Color(0xff262626),
          shape: BoxShape.circle
      )
  );
}