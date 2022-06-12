import 'package:flutter/material.dart';
import 'package:nashe_delo/widgets/custom_back_button.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Column(
          children: [
            Row(
                children: const [
                  SizedBox(width: 23),
                  CustomBackButton(),
                  Spacer(),
                  Text(
                      "Уведомления",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Color(0xff262626)
                      )
                  ),
                  Spacer()
                ]
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
                padding: const EdgeInsets.only(
                    top: 4,
                    left: 23,
                    right: 23,
                    bottom: 7
                ),
                color: const Color(0xffF2F2F2),
                child: const Text(
                    "На этой неделе",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff7D7D7D)
                    )
                )
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.only(
                            top: 23,
                            left: 24,
                            right: 20,
                            bottom: 23
                        ),
                        child: Row(
                            children: [
                              Image.asset("images/logo.png"),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                          "Ассоциация волонтёрских центров",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Color(0xff262626)
                                          )
                                      ),
                                      Text(
                                          "Приглашают вас стать волонтёром",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color(0xff7D7D7D)
                                          )
                                      )
                                    ]
                                )
                              ),
                              const SizedBox(width: 42),
                              const Text(
                                  "10 с",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0xffBFBFBF)
                                  )
                              )
                            ]
                        )
                    )
                )
            )
          ]
      )
    )
  );
}
