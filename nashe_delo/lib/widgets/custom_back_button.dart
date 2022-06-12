import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
          height: 32,
          width: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xffDDE5ED),
              borderRadius: BorderRadius.circular(12)
          ),
          child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff2892F4),
              size: 18
          )
      )
  );
}