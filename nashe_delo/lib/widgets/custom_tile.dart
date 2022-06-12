import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({Key? key, required this.image, required this.text})
      : super(key: key);

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 16
      ),
      decoration: BoxDecoration(
          color: const Color(0xffEFEFEF),
          borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
          children: [
            Container(
              height: 22,
              width: 22,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xff2892F4),
                  borderRadius: BorderRadius.circular(4)
              ),
              child: SvgPicture.asset("images/$image.svg"),
            ),
            const SizedBox(width: 25),
            Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff262626)
                )
            )
          ]
      )
  );
}