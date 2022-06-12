import 'dart:convert';
import 'dart:core';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/models/task_model.dart';
import 'main_card_view.dart';
import 'notifications_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool isLoading = true, isMap = false, isTapped = false;

  String token = "";

  List<TaskModel> taskModels = [];

  @override
  void initState() {
    changeTaskModels();
    super.initState();
  }

  void changeTaskModels() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
    taskModels = await getTasks();
    setState(() => isLoading = false);
  }

  Future<List<TaskModel>> getTasks() async {
    Response response = await http.get(
        Uri.parse('http://i-pro-backend.herokuapp.com/task'),
      headers: {"Content-Type": "application/json"}
    );
    return parseTasks(response.bodyBytes);
  }

  List<TaskModel> parseTasks(Uint8List responseBody) {
    final parsed = jsonDecode(utf8.decode(responseBody)).cast<Map<String, dynamic>>();
    return parsed.map<TaskModel>((json) => TaskModel.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xffEFF1FB),
    body: SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
            padding: const EdgeInsets.only(
                top: 8,
                bottom: 40
            ),
            child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20
                      ),
                      child: Column(
                          children: [
                            Row(
                                children: [
                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                            "Местоположение",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 8,
                                                color: Color(0xff7D7D7D)
                                            )
                                        ),
                                        const SizedBox(height: 1),
                                        Row(
                                            children: [
                                              SvgPicture.asset("images/location.svg"),
                                              const SizedBox(width: 7.02),
                                              const Text(
                                                  "г. Москва",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16,
                                                      color: Color(0xff262626)
                                                  )
                                              ),
                                              const SizedBox(width: 4),
                                              const Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: Color(0xff2892F4)
                                              )
                                            ]
                                        )
                                      ]
                                  ),
                                  const Spacer(),
                                  Stack(
                                      children: [
                                        GestureDetector(
                                            onTap: () => Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) => const NotificationsView()
                                                )
                                            ),
                                            child: Container(
                                                height: 32,
                                                width: 32,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: const Color(0xffDDE5ED),
                                                    borderRadius: BorderRadius.circular(12)
                                                ),
                                                child: SvgPicture.asset("images/notification.svg")
                                            )
                                        ),
                                        Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Container(
                                                height: 11,
                                                width: 11,
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xffFF0000),
                                                    shape: BoxShape.circle
                                                ),
                                                child: const Text(
                                                    "3",
                                                    style: TextStyle(
                                                        fontSize: 7,
                                                        color: Colors.white
                                                    )
                                                )
                                            )
                                        )
                                      ]
                                  )
                                ]
                            ),
                            const SizedBox(height: 16),
                            Container(
                                height: 42,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(
                                    left: 12,
                                    right: 13.46
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                child: Row(
                                    children: [
                                      SvgPicture.asset("images/search.svg"),
                                      const SizedBox(width: 24),
                                      const Expanded(
                                          child: TextField(
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding: EdgeInsets.only(bottom: 5),
                                                  hintText: "Поиск...",
                                                  hintStyle: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 14,
                                                      color: Color(0xff7D7D7D)
                                                  )
                                              )
                                          )
                                      ),
                                      const SizedBox(width: 24),
                                      SvgPicture.asset("images/filter.svg")
                                    ]
                                )
                            ),
                            const SizedBox(height: 13),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTap: () => setState(() => isMap = false),
                                      child: Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.only(
                                              top: 4,
                                              left: 16,
                                              right: 16,
                                              bottom: 6
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(32),
                                              border: Border.all(color: isMap
                                                  ? Colors.black
                                                  : Colors.transparent
                                              ),
                                              color: isMap
                                                  ? Colors.transparent
                                                  : const Color(0xff2892F4)
                                          ),
                                          child: Text(
                                              "Лента",
                                              style: TextStyle(
                                                  color: isMap
                                                      ? Colors.black
                                                      : Colors.white
                                              )
                                          )
                                      )
                                  ),
                                  const SizedBox(width: 28),
                                  GestureDetector(
                                      onTap: () => setState(() => isMap = true),
                                      child: Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.only(
                                              top: 4,
                                              left: 16,
                                              right: 16,
                                              bottom: 6
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(32),
                                              border: Border.all(color: isMap
                                                  ? Colors.transparent
                                                  : Colors.black
                                              ),
                                              color: isMap
                                                  ? const Color(0xff2892F4)
                                                  : Colors.transparent
                                          ),
                                          child: Text(
                                              "Карта",
                                              style: TextStyle(
                                                  color: isMap
                                                      ? Colors.white
                                                      : Colors.black
                                              )
                                          )
                                      )
                                  )
                                ]
                            ),
                            const SizedBox(height: 29)
                          ]
                      )
                  ),
                  isMap
                      ? SizedBox(
                      height: MediaQuery.of(context).size.height - 350,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          GoogleMap(
                              initialCameraPosition: CameraPosition(
                                  target: LatLng(
                                      55.639876,
                                      37.525309
                                  ),
                                  zoom: 14.4746
                              ),
                            onTap: (value) => setState(() => isTapped = true),
                            markers: {
                                if (isTapped)
                              Marker( //add first marker
                                markerId: MarkerId('1'),
                                position: LatLng(55.639876, 37.525309),//position of marker
                                infoWindow: InfoWindow( //popup info
                                  title: 'My Custom Title ',
                                  snippet: 'My Custom Subtitle',
                                ),
                                icon: BitmapDescriptor.defaultMarker, //Icon for Marker
                              )
                            },
                          ),
                          if (isTapped)
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                  height: 214,
                                  padding: const EdgeInsets.only(top: 3, left: 20),
                                  decoration: const BoxDecoration(
                                      color: Color(0xffEFF1FB),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16)
                                      )
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 2,
                                            width: 32,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffC8C8C8),
                                                borderRadius: BorderRadius.circular(9)
                                            )
                                        ),
                                        const SizedBox(height: 14),
                                        Expanded(
                                            child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemBuilder: (BuildContext context, int index) => Padding(
                                                    padding: const EdgeInsets.only(right: 4),
                                                    child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(12),
                                                        child: Image.asset("images/map.png")
                                                    )
                                                )
                                            )
                                        ),
                                        const SizedBox(height: 16),
                                        const Text(
                                            "Помощь в проведении Дня Донора",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Color(0xff262626)
                                            )
                                        ),
                                        const SizedBox(height: 17),
                                        const Text(
                                            "17 Мая, 8:00 - 4 Июля, 16:00, 2023г.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Color(0xff636467)
                                            )
                                        ),
                                        const SizedBox(height: 4),
                                        const Text(
                                            "Россия, г. Москва",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Color(0xff636467)
                                            )
                                        ),
                                        const SizedBox(height: 30)
                                      ]
                                  )
                              )
                          )
                        ]
                      )
                  )
                      : isLoading
                      ? const CircularProgressIndicator()
                      : Expanded(
                      child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: taskModels.length,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.8
                          ),
                          itemBuilder: (BuildContext context, int index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MainCardView(
                                                image: "images/main$index.png"
                                            )
                                        )
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Stack(
                                            children: [
                                              Hero(
                                                  tag: index,
                                                  child: Image.asset("images/main$index.png")
                                              ),
                                              Positioned(
                                                  top: 7,
                                                  right: 6,
                                                  child: GestureDetector(
                                                      onTap: () async {
                                                        Response response = await http.post(
                                                            Uri.parse("http://i-pro-backend.herokuapp.com/user/favorite"),
                                                            headers: {'Authorization': 'Bearer $token'},
                                                            body: {"id": taskModels[index].id.toString()}
                                                        );
                                                        print(response.body);
                                                        if (response.statusCode == 200) {
                                                          setState(() => taskModels[index].isFavorite = !taskModels[index].isFavorite);
                                                        }
                                                      },
                                                      child: Container(
                                                          height: 22,
                                                          width: 22,
                                                          alignment: Alignment.center,
                                                          padding: const EdgeInsets.only(
                                                              top: 5.95,
                                                              left: 4.25,
                                                              right: 4.25,
                                                              bottom: 3.96
                                                          ),
                                                          decoration: const BoxDecoration(
                                                              color: Color.fromARGB(179, 255, 255, 255),
                                                              shape: BoxShape.circle
                                                          ),
                                                          child: taskModels[index].isFavorite
                                                              ? const Icon(Icons.favorite, size: 15,)
                                                              : const Icon(Icons.favorite_border, size: 15,)
                                                      )
                                                  )
                                              )
                                            ]
                                        )
                                    )
                                ),
                                const SizedBox(height: 8),
                                Text(
                                    taskModels[index].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Color(0xff262626)
                                    )
                                ),
                                const SizedBox(height: 9),
                                Row(
                                    children: [
                                      SvgPicture.asset("images/calendar.svg"),
                                      const SizedBox(width: 6),
                                      Text(
                                          taskModels[index].startDate.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 8,
                                              color: Color(0xff636467)
                                          )
                                      )
                                    ]
                                ),
                                const SizedBox(height: 4),
                                Row(
                                    children: [
                                      SvgPicture.asset(
                                          "images/location.svg",
                                          color: const Color(0xff7D7D7D)
                                      ),
                                      const SizedBox(width: 6),
                                      const Text(
                                          "Россия, г. Москва",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 8,
                                              color: Color(0xff636467)
                                          )
                                      )
                                    ]
                                )
                              ]
                          )
                      )
                  )
                ]
            )
        )
      )
    )
  );
}
