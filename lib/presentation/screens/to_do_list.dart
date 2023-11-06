import 'dart:ui';

import 'package:flutter/material.dart';

class ToDoListCard extends StatefulWidget {
  const ToDoListCard({super.key});

  @override
  State<ToDoListCard> createState() => _ToDoListCardState();
}

class _ToDoListCardState extends State<ToDoListCard> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          alignment: Alignment.center,
          height: 714,
          width: 652,
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
              SizedBox(
                height: 50,
              ),
              Text(
                'To Do List',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: ExpansionTile(
                        expandedAlignment: Alignment.centerLeft,
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        tilePadding: EdgeInsets.symmetric(horizontal: 12),
                        childrenPadding: EdgeInsets.symmetric(horizontal: 12),
                        title: Text('Judul'),
                        leading: Checkbox(
                          onChanged: (value) {
                            setState(() {
                              isDone = !isDone;
                            });
                          },
                          value: isDone,
                        ),
                        children: [
                          Text('Deskripsi'),
                        ],
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Card(
                child: ExpansionTile(
                  trailing: Icon(Icons.add),
                  childrenPadding: EdgeInsets.all(12),
                  title: Text(
                    'Add Task',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Masukkan Judul',
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Masukkan Deskripsi',
                          border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
