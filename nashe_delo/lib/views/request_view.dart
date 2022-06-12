import 'package:flutter/material.dart';
import 'package:nashe_delo/views/congratulations_view.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_button.dart';

class RequestView extends StatefulWidget {
  const RequestView({Key? key}) : super(key: key);

  @override
  State<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView> {
  bool chooseAll = false;
  bool agree = false;

  List<dynamic> _selectedEvents = [];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  CustomBackButton(),
                  Spacer(),
                  Text(
                      "Заявка на функцию",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Color(0xff262626)
                      )
                  ),
                  Spacer()
                ]
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 27
                          ),
                          child: Text(
                              "Когда вы можете оказывать помощь?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Color(0xff262626)
                              )
                          )
                      ),
                      TableCalendar(
                        locale: 'ru_RU',
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: DateTime.now(),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 32,
                              horizontal: 25
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    children: [
                                      Checkbox(
                                          value: chooseAll,
                                          onChanged: (value) {
                                            setState(() => chooseAll = !chooseAll);
                                          }
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                          "Выбрать всё",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color(0xff262626)
                                          )
                                      )
                                    ]
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                    "Узнать расписание для каждой даты",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xff2892F4),
                                        decoration: TextDecoration.underline
                                    )
                                ),
                                const Text(
                                    "Ваша роль",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Color(0xff262626)
                                    )
                                ),
                                const SizedBox(height: 9),
                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 24,
                                        top: 8.5,
                                        bottom: 9.5,
                                        right: 16.26
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: const Color(0xffBFBFBF)
                                        ),
                                        borderRadius: BorderRadius.circular(4)
                                    ),
                                    child: Row(
                                        children: const [
                                          Text(
                                              "Волонтёр, менеджер",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Color(0xffBFBFBF)
                                              )
                                          ),
                                          Spacer(),
                                          Icon(
                                              Icons.arrow_drop_down,
                                              color: Color(0xffBFBFBF)
                                          )
                                        ]
                                    )
                                ),
                                const SizedBox(height: 17),
                                const Text(
                                    "Образование*",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Color(0xff262626)
                                    )
                                ),
                                const Text(
                                    "Добавить образование",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xff2892F4)
                                    )
                                ),
                                const SizedBox(height: 21),
                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 24,
                                        top: 8.5,
                                        bottom: 9.5
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: const Color(0xffBFBFBF)
                                        ),
                                        borderRadius: BorderRadius.circular(4)
                                    ),
                                    child: Row(
                                        children: [
                                          Image.asset("images/vk.png"),
                                          const SizedBox(width: 5),
                                          const Text(
                                              "Ссылка на ваш профиль ВК*",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Color(0xffBFBFBF)
                                              )
                                          )
                                        ]
                                    )
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    Checkbox(
                                        value: agree,
                                        onChanged: (value) => setState(() => agree = !agree),
                                    ),
                                    Flexible(
                                      child: RichText(
                                          text: const TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: "Соглашаюсь с условиями",
                                                    style: TextStyle(
                                                        color: Color(0xff262626)
                                                    )
                                                ),
                                                TextSpan(
                                                    text: "оферты и безвозмездного оказания услуг",
                                                    style: TextStyle(
                                                        color: Color(0xff2892F4),
                                                        decoration: TextDecoration.underline
                                                    )
                                                ),
                                                TextSpan(
                                                    text: "волонтёром и даю",
                                                    style: TextStyle(
                                                        color: Color(0xff262626)
                                                    )
                                                ),
                                                TextSpan(
                                                    text: "согласие на обработку моих персональных данных*",
                                                    style: TextStyle(
                                                        color: Color(0xff2892F4),
                                                        decoration: TextDecoration.underline
                                                    )
                                                )
                                              ]
                                          )
                                      )
                                    )
                                  ]
                                ),
                                const SizedBox(height: 24),
                                GestureDetector(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => const CongratulationsView()
                                        )
                                    ),
                                    child: const CustomButton(text: "Подать заявку")
                                )
                              ]
                          )
                      )
                    ]
                  )
                )
              )
            ]
          )
      )
    )
  );
}
