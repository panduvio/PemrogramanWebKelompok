// import 'package:dotted_border/dotted_border.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:provider/provider.dart';
import 'package:tugas_kelompok/constant/app_color.dart';
import 'package:tugas_kelompok/presentation/providers/route_provider.dart';

class RecommendationCard extends StatefulWidget {
  const RecommendationCard({super.key});

  @override
  State<RecommendationCard> createState() => _RecommendationCardState();
}

class _RecommendationCardState extends State<RecommendationCard> {
  late SharedPreferences pekerjaanSp;
  String pekerjaan = '';
  int persentase = 0;
  int indexPilihan = 0;

  void initial() async {
    pekerjaanSp = await SharedPreferences.getInstance();
    setState(() {
      pekerjaan = pekerjaanSp.getString('kerja')!;
      persentase = pekerjaanSp.getInt('persen')!;

      print(persentase);
      print(pekerjaan);
    });
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
          width: 1138,
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 85,
            // bottom: 71,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              colors: [
                const Color.fromARGB(115, 255, 255, 255),
                const Color.fromARGB(115, 255, 255, 255),
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 403,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      width: 498,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 112,
                          ),
                          Text(
                            'Rekomendasi pekerjaan berdasarkan CV yang telah Anda Upload',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                indexPilihan = 1;
                                pekerjaanSp.setString(
                                    'kerja', 'Java Developer');
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 445,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: indexPilihan == 1
                                      ? AppColor().aquaticGreen
                                      : Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    indexPilihan == 1
                                        ? AppColor().deepAquamarine
                                        : AppColor().aquaticGreen,
                                    indexPilihan == 1
                                        ? AppColor().dignityBlue
                                        : AppColor().royalBlueMetallic,
                                  ],
                                ),
                              ),
                              child: Text(
                                'Java Developer',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 112,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 5,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColor().aquaticGreen,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      width: 498,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 112,
                          ),
                          Text(
                            'Pekerjaan yang anda minati',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                indexPilihan = 2;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 445,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: indexPilihan == 2
                                      ? AppColor().aquaticGreen
                                      : Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    indexPilihan == 2
                                        ? AppColor().deepAquamarine
                                        : AppColor().aquaticGreen,
                                    indexPilihan == 2
                                        ? AppColor().dignityBlue
                                        : AppColor().royalBlueMetallic,
                                  ],
                                ),
                              ),
                              child: Text(
                                '$pekerjaan - - $persentase %',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 112,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 105,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Provider.of<RouteProvider>(context, listen: false)
                        .updateRoute(7);
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 276,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColor().aquaticGreen,
                        AppColor().royalBlueMetallic,
                      ],
                    ),
                  ),
                  child: Text(
                    'Rekomendasi Course',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
