import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tugas_kelompok/constant/app_color.dart';
import 'package:tugas_kelompok/domain/entities/todo_entity.dart';

class ToDoListCard extends StatefulWidget {
  const ToDoListCard({super.key});

  @override
  State<ToDoListCard> createState() => _ToDoListCardState();
}

class _ToDoListCardState extends State<ToDoListCard> {
  List<TodoEntity> taskList = [];
  TextEditingController judulController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  @override
  void dispose() {
    setState(() {
      judulController.dispose();
      deskripsiController.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          alignment: Alignment.center,
          height: 800,
          width: 653,
          padding: EdgeInsets.symmetric(
            horizontal: 152,
            vertical: 45,
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
              Text(
                'To Do List',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: taskList.length >= 4 ? 300 : taskList.length * 70,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Card(
                        child: ExpansionTile(
                          title: Text(taskList[index].title),
                          leading: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            splashColor: Colors.purple,
                            onTap: () {
                              setState(() {
                                taskList[index].progress =
                                    !taskList[index].progress;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColor().deepAquamarine,
                                  width: 2,
                                ),
                                color: taskList[index].progress == true
                                    ? Colors.purple
                                    : Colors.transparent,
                              ),
                              child: Icon(
                                Icons.check,
                                color: taskList[index].progress == false
                                    ? Colors.transparent
                                    : Colors.white,
                              ),
                            ),
                          ),
                          children: [
                            Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(taskList[index].description)),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(),
                    itemCount: taskList.length),
              ),
              Card(
                child: ExpansionTile(
                  title: Text('Add Task'),
                  trailing: Icon(Icons.add),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextField(
                            controller: judulController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Judul',
                              hintText: 'Tambahkan judul',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: deskripsiController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Deskripsi',
                              hintText: 'Tambahkan deskripsi',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              setState(() {
                                taskList.add(TodoEntity(
                                    title: judulController.text,
                                    description: deskripsiController.text));
                                judulController.clear();
                                deskripsiController.clear();
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColor().deepAquamarine,
                                    AppColor().seaHunter,
                                  ],
                                ),
                              ),
                              child: Text(
                                'Add Task',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
