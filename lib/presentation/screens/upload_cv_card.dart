import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/constant/app_color.dart';
import 'package:tugas_kelompok/presentation/providers/route_provider.dart';

class UploadCvCard extends StatefulWidget {
  const UploadCvCard({super.key});

  @override
  State<UploadCvCard> createState() => _UploadCvCardState();
}

class _UploadCvCardState extends State<UploadCvCard> {
  bool isUpload = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 45,
        vertical: 30,
      ),
      height: 714,
      width: 878,
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
          Text('Upload File'),
          SizedBox(
            height: 30,
          ),
          Text('Silahkan upload CV anda'),
          SizedBox(
            height: 4,
          ),
          DottedBorder(
            color: AppColor().winterTime, // Border color
            strokeWidth: 4, // Border width
            radius: Radius.circular(30), // Border radius
            dashPattern: [6, 6],
            child: isUpload == true
                ? uploadingState()
                : Container(
                    height: 468,
                    width: 516,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 114,
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            'assets/upload_file.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Text('Drag and drop file here'),
                        SizedBox(
                          height: 58,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isUpload = true;
                            });
                            // _controller.forward();
                          },
                          child: Container(
                            height: 50,
                            width: 166,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColor().haileyBlue,
                                  AppColor().seaHunter,
                                ],
                              ),
                            ),
                            child: Text('Browse File'),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget uploadingState() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      height: 468,
      width: 516,
      child: Column(
        children: [
          SizedBox(
            height: 196,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    print('bisa');
                    Provider.of<RouteProvider>(context, listen: false)
                        .updateRoute(6);
                  });
                },
                child: SizedBox(
                  height: 75,
                  width: 54,
                  child: Image.asset('assets/pdf.png'),
                ),
              ),
              Column(
                children: [
                  Text('nama file'),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 12,
                    width: 396,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor().periglacialBlue,
                    ),
                    child: AnimatedContainer(
                      width: 300,
                      height: 12,
                      duration: Duration(seconds: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor().aquaticGreen,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       setState(() {
          //         _controller.forward();
          //       });
          //     },
          //     child: Text('data'))
        ],
      ),
    );
  }
}
