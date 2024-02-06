import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:levelup/views/custom_card.dart';

class ITCourses extends StatefulWidget {
  const ITCourses({super.key});

  @override
  State<ITCourses> createState() => MyITCoursesListState();
}

class MyITCoursesListState extends State<ITCourses> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          final profession = Data.itCourses[index];
          return GestureDetector(
            onTap: () {
              // Handle onTap
            },
            child: CustomCard(
                title: profession['title']??'', subtitle: profession['avgSalary']??''),
          );
        },
        itemCount: Data.itCourses.length,
      ),
    );
  }
}
