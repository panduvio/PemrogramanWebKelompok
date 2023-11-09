import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/data/models/user_model.dart';
import 'package:tugas_kelompok/domain/entities/user_entity.dart';
import 'package:tugas_kelompok/presentation/providers/bloc/login_bloc.dart';
import 'package:tugas_kelompok/presentation/providers/bloc/todo_bloc.dart';

import '../../constant/app_color.dart';
import '../providers/route_provider.dart';

class RegistrationCard extends StatefulWidget {
  const RegistrationCard({super.key});

  @override
  State<RegistrationCard> createState() => _RegistrationCardState();
}

class _RegistrationCardState extends State<RegistrationCard> {
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  bool isEmailValid = false;

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  void validateEmail() {
    final bool emailValid =
        EmailValidator.validate(emailController.text.trim());
    isEmailValid = emailValid;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      return ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: SingleChildScrollView(
            child: Container(
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
              child: Form(
                key: formKey,
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
                    Spacer(),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        hintText: 'Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty == true) {
                          return 'Username cannot be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Spacer(),
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
                      height: 28,
                    ),
                    TextFormField(
                      // obscureText: true,
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
                                r'^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$')
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
                        Text('I agree to the terms & condition'),
                      ],
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          final loginData = UserModel(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          context.read<LoginBloc>()
                            ..add(Signup(loginData: loginData));
                          setState(() {
                            Provider.of<RouteProvider>(context, listen: false)
                                .updateRoute(1);
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
                          'Register',
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
                        Text('Already have an account? '),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                Provider.of<RouteProvider>(context,
                                        listen: false)
                                    .updateRoute(1);
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
              ),
            ),
          ),
        ),
      );
    });
  }
}
