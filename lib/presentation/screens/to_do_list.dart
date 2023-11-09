import 'dart:ui';

import 'package:flutter/material.dart';

class ToDoListCard extends StatefulWidget {
  const ToDoListCard({super.key});

  @override
  State<ToDoListCard> createState() => _ToDoListCardState();
}

class _ToDoListCardState extends State<ToDoListCard> {
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
        ),
      ),
    );
  }
}
