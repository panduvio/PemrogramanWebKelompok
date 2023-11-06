import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tugas_kelompok/constant/app_color.dart';

class RecommendationCourseCard extends StatefulWidget {
  const RecommendationCourseCard({super.key});

  @override
  State<RecommendationCourseCard> createState() =>
      _RecommendationCourseCardState();
}

class _RecommendationCourseCardState extends State<RecommendationCourseCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          alignment: Alignment.center,
          height: 714,
          width: 1025,
          padding: EdgeInsets.symmetric(
            horizontal: 152,
            vertical: 88,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: Colors.white),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 8,
                  spreadRadius: 0,
                  blurStyle: BlurStyle.inner,
                  color: Color.fromARGB(68, 255, 255, 255),
                )
              ],
              color: Colors.transparent),
          child: Column(
            children: [
              Text(
                'Kami merekomendasikan Kursus Online untuk\nData Science ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // Provider.of<RouteProvider>(context, listen: false)
                        //     .updateRoute(3);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsetsDirectional.only(top: 46),
                      height: 290,
                      width: 238,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColor().deepAquamarine,
                            AppColor().dignityBlue,
                          ],
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 6,
                            spreadRadius: 0,
                            blurStyle: BlurStyle.normal,
                            offset: Offset.fromDirection(
                              -12,
                              8,
                            ),
                            color: Color.fromARGB(78, 0, 0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset(
                              'assets/python.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Python Tutorial for Beginners',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 118,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // Provider.of<RouteProvider>(context, listen: false)
                        //     .updateRoute(3);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsetsDirectional.only(top: 46),
                      height: 290,
                      width: 238,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColor().deepAquamarine,
                            AppColor().dignityBlue,
                          ],
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 6,
                            spreadRadius: 0,
                            blurStyle: BlurStyle.normal,
                            offset: Offset.fromDirection(
                              -12,
                              8,
                            ),
                            color: Color.fromARGB(78, 0, 0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset(
                              'assets/machine_learning.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Machine Learning\nPlaylist',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
