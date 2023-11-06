// import 'package:dotted_border/dotted_border.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/constant/app_color.dart';
import 'package:tugas_kelompok/presentation/providers/route_provider.dart';

class RecommendationCard extends StatefulWidget {
  const RecommendationCard({super.key});

  @override
  State<RecommendationCard> createState() => _RecommendationCardState();
}

class _RecommendationCardState extends State<RecommendationCard> {
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
                                // Provider.of<RouteProvider>(context, listen: false)
                                //     .updateRoute(3);
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 445,
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
                                '',
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
                                // Provider.of<RouteProvider>(context, listen: false)
                                //     .updateRoute(3);
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 445,
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
                                '',
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
