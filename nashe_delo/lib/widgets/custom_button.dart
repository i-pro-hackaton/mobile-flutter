import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) => Container(
      height: 46,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xff2892F4),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.white
          )
      )
  );
}