import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/domain/entities/pertanyaan_entity.dart';

import '../../constant/app_color.dart';
import '../providers/route_provider.dart';

class PertanyaanCard extends StatefulWidget {
  const PertanyaanCard({super.key});

  @override
  State<PertanyaanCard> createState() => _PertanyaanCardState();
}

class _PertanyaanCardState extends State<PertanyaanCard> {
  int soalIndex = 0;
  String selectedValue = '';
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            left: 64,
            right: 64,
            top: 40,
            bottom: 20,
          ),
          height: 590,
          width: 618,
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
              Text(
                'Berikanlah penilaian kemampuan diri Anda terhadap pekerjaan yang diminati!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                pertanyaanList[soalIndex].pertanyaan,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(
                height: 28,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      title: Text(
                        pertanyaanList[soalIndex].listJawab[index],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      value: pertanyaanList[soalIndex].listJawab[index],
                      groupValue: selectedValue,
                      onChanged: (newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 0,
                  ),
                  itemCount: pertanyaanList[soalIndex].listJawab.length,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedValue = '';
                    soalIndex < 2
                        ? soalIndex = soalIndex + 1
                        : Provider.of<RouteProvider>(context, listen: false)
                            .updateRoute(5);
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: double.maxFinite,
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
                    'Selanjutnya',
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
