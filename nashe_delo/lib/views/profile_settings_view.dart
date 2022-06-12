import 'package:flutter/material.dart';

class ProfileSettingsView extends StatefulWidget {
  const ProfileSettingsView({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsView> createState() => _ProfileSettingsViewState();
}

class _ProfileSettingsViewState extends State<ProfileSettingsView> {

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 100,
      leading: Padding(
        padding: const EdgeInsets.only(left: 22),
        child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Text(
                "Отмена",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff75B8F5)
                )
            )
        )
      ),
      actions: const [
        Text(
          "Готово",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xff2892F4)
          )
        ),
        SizedBox(width: 20)
      ]
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset("images/EgorS.png"),
          const SizedBox(height: 14),
          const Text(
            "Загрузить фото",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color(0xff2892F4)
            )
          ),
          SizedBox(height: 34),
          Container(
            child: Row(
              children: const [
                Text(
                  "Информация о вас",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff7D7D7D)
                  )
                )
              ]
            )
          )
        ]
      )
    )
  );
}
