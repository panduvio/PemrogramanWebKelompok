import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/app_color.dart';
import '../providers/route_provider.dart';

class PekerjaanListCard extends StatefulWidget {
  const PekerjaanListCard({super.key});

  @override
  State<PekerjaanListCard> createState() => _PekerjaanListCardState();
}

class _PekerjaanListCardState extends State<PekerjaanListCard> {
  String selectedPekerjaan = 'Pilih pekerjaan';
  final List<String> listKerja = [
    'DevOps Engineer',
    'Data Science',
    'Web Designing',
    'Java Developer',
    'Business Analyst',
    'Operation Manager',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 64,
        vertical: 40,
      ),
      height: 550,
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
            'Pilih Pekerjaan yang Anda Minati!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 48,
          ),
          Container(
            alignment: Alignment.center,
            height: 60,
            width: 360,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 0, 0, 0))),
            child: DropdownButton(
              hint: Text(
                selectedPekerjaan,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              items: listKerja.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedPekerjaan = newValue!;
                });
              },
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Provider.of<RouteProvider>(context, listen: false).updateRoute(4);
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
                'Konfirmasi',
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
    );
  }
}
