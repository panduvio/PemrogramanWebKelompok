import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_kelompok/constant/app_color.dart';
import 'package:tugas_kelompok/domain/entities/rekomendasi_entity.dart';
import 'package:tugas_kelompok/presentation/providers/route_provider.dart';

class RecommendationCourseCard extends StatefulWidget {
  const RecommendationCourseCard({super.key});

  @override
  State<RecommendationCourseCard> createState() =>
      _RecommendationCourseCardState();
}

class _RecommendationCourseCardState extends State<RecommendationCourseCard> {
  String pekerjaan = '';
  int persentase = 0;
  List<RekomendasiEntity> listCourse = rekomList;
  String imagePath1 = 'assets/operation_manager_1_1.png';
  String imagePath2 = 'assets/operation_manager_2_1.png';
  late SharedPreferences pekerjaanSP;
  int indexPilihan = 0;

  void initial() async {
    pekerjaanSP = await SharedPreferences.getInstance();
    setState(() {
      pekerjaan = pekerjaanSP.getString('kerja')!;
      persentase = pekerjaanSP.getInt('persen')!;

      print(persentase);
      print(pekerjaan);
    });
    for (int i = 0; i < listCourse.length; i++) {
      if (pekerjaan == listCourse[i].namaPekerjaan) {
        setState(() {
          imagePath1 = listCourse[i].rekomendasi1;
          imagePath2 = listCourse[i].rekomendasi2;

          print(imagePath1);
          print(imagePath2);
        });
      }
    }
  }

  @override
  void initState() {
    initial();
    super.initState();
  }

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
                'Kami merekomendasikan Kursus Online untuk\n$pekerjaan ',
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
                        indexPilihan = 1;
                        Provider.of<RouteProvider>(context, listen: false)
                            .updateRoute(8);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsetsDirectional.only(top: 46),
                      height: 290,
                      width: 238,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: indexPilihan == 1
                              ? Colors.yellow
                              : Colors.transparent,
                        ),
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
                          InkWell(
                            onTap: () {
                              Provider.of<RouteProvider>(context, listen: false)
                                  .updateRoute(7);
                            },
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                imagePath1,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '$pekerjaan Tutorial for Beginners',
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
                        indexPilihan = 2;
                        Provider.of<RouteProvider>(context, listen: false)
                            .updateRoute(8);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsetsDirectional.only(top: 46),
                      height: 290,
                      width: 238,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: indexPilihan == 2
                              ? Colors.yellow
                              : Colors.transparent,
                        ),
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
                              imagePath2,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '$pekerjaan\nPlaylist',
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
