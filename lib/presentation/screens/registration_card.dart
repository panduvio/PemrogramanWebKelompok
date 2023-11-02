import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/app_color.dart';
import '../providers/route_provider.dart';

class RegistrationCard extends StatefulWidget {
  const RegistrationCard({super.key});

  @override
  State<RegistrationCard> createState() => _RegistrationCardState();
}

class _RegistrationCardState extends State<RegistrationCard> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 64,
        vertical: 40,
      ),
      height: 550,
      width: 470,
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
            'Register',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 49,
          ),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              hintText: 'Name',
            ),
          ),
          SizedBox(
            height: 28,
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              icon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'E-mail',
            ),
          ),
          SizedBox(
            height: 28,
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              hintText: 'Password',
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Row(
            children: [
              Checkbox(
                  value: isChecked,
                  onChanged: (v) {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  }),
              Text('I agree to the terms & condition'),
            ],
          ),
          SizedBox(
            height: 28,
          ),
          Container(
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
              'Register',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text('Already have an account? '),
              TextButton(
                  onPressed: () {
                    setState(() {
                      Provider.of<RouteProvider>(context, listen: false)
                          .updateRoute(2);
                    });
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  )),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
