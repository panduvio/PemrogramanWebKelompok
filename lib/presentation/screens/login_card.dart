import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_kelompok/constant/app_color.dart';
import 'package:tugas_kelompok/presentation/providers/bloc/login_bloc.dart';

import '../providers/route_provider.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  late SharedPreferences loginSharedP;

  var formKey = GlobalKey<FormState>();

  bool isEmailValid = false;

  @override
  void initState() {
    initial();
    super.initState();
  }

  void initial() async {
    loginSharedP = await SharedPreferences.getInstance();
    if (loginSharedP.getString('email') != null &&
        loginSharedP.getString('email') != '') {
      emailController.text = loginSharedP.getString('email')!;
      passwordController.text = loginSharedP.getString('password')!;
    } else {
      loginSharedP.setString('email', '');
      loginSharedP.setString('password', '');
    }
  }

  void rememberMe() {
    if (isChecked == true) {
      loginSharedP.setString('email', emailController.text);
      loginSharedP.setString('password', passwordController.text);
    } else {
      loginSharedP.setString('email', '');
      loginSharedP.setString('password', '');
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void validateEmail() {
    final bool emailValid =
        EmailValidator.validate(emailController.text.trim());
    isEmailValid = emailValid;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 55,
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
                    validator: (value) {
                      validateEmail();

                      if (value!.isEmpty) {
                        return 'E-Mail wajib diisi';
                      } else if (isEmailValid == false) {
                        return 'Masukkan E-Mail dengan Benar';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintText: 'Password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty == true) {
                        return 'Password cannot be empty';
                      } else if (value.length < 8) {
                        return 'Password should contain at least 8 characters';
                      } else if (!RegExp(
                              r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$')
                          .hasMatch(value)) {
                        return 'Password should contain at least a symbol, a number, and an upper case letter';
                      } else {
                        return null;
                      }
                    },
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
                      Text('Remember me'),
                    ],
                  ),
                  SizedBox(
                    height: 58,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<LoginBloc>()
                          ..add(Login(
                              email: emailController.text,
                              password: emailController.text));
                        setState(() {
                          Provider.of<RouteProvider>(context, listen: false)
                              .updateRoute(3);
                          rememberMe();
                        });
                      }
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
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
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
                      Text('Don\'t have an account? '),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              Provider.of<RouteProvider>(context, listen: false)
                                  .updateRoute(2);
                            });
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )),
                      Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
