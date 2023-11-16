import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/presentation/providers/route_provider.dart';
import 'package:tugas_kelompok/presentation/screens/login_card.dart';
import 'package:tugas_kelompok/presentation/screens/pekerjaan_list_card.dart';
import 'package:tugas_kelompok/presentation/screens/pertanyaan_card.dart';
import 'package:tugas_kelompok/presentation/screens/recommendation_card.dart';
import 'package:tugas_kelompok/presentation/screens/recommendation_courses_card.dart';
import 'package:tugas_kelompok/presentation/screens/registration_card.dart';
import 'package:tugas_kelompok/presentation/screens/to_do_list_card.dart';
import 'package:tugas_kelompok/presentation/screens/upload_cv_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFocused = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Widget?> classObj = [
      LoginCard(),
      RegistrationCard(),
      PekerjaanListCard(),
      PertanyaanCard(),
      UploadCvCard(),
      RecommendationCard(),
      RecommendationCourseCard(),
      ToDoListCard(),
    ];
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            child: Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  child: Image.asset(
                    'assets/main_bg.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 70, left: 100, right: 140),
                  child: Consumer<RouteProvider>(
                      builder: (context, routeProvider, child) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              width: 94,
                            ),
                            routeProvider.route == 0
                                ? MouseRegion(
                                    onEnter: (event) {
                                      setState(() {
                                        isFocused = true;
                                      });
                                    },
                                    onExit: (event) {
                                      setState(() {
                                        isFocused = false;
                                      });
                                    },
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Provider.of<RouteProvider>(context,
                                                  listen: false)
                                              .updateRoute(1);
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 40,
                                        width: 128,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 3, color: Colors.white),
                                          color: isFocused == true
                                              ? Colors.white
                                              : Colors.transparent,
                                        ),
                                        child: Text(
                                          'Login',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24,
                                              color: isFocused == true
                                                  ? Colors.black
                                                  : Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        routeProvider.route == 0
                            ? SizedBox()
                            : classObj[routeProvider.route - 1]!,
                        // route == 0
                        //     ? SizedBox()
                        //     : (route == 1 ? LoginCard() : SizedBox()),
                      ],
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
