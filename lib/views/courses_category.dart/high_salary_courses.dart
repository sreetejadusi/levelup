import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:levelup/views/custom_card.dart';

class HighSalaryCourses extends StatefulWidget {
  const HighSalaryCourses({super.key});

  @override
  State<HighSalaryCourses> createState() => MyHighSalaryCoursesListState();
}

class MyHighSalaryCoursesListState extends State<HighSalaryCourses> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          final profession = Data.highSalaryCoursesList[index];
          return GestureDetector(
            onTap: () {
              // Handle onTap event
            },
            child: CustomCard(
                title: profession['title']??'', subtitle: profession['avgSalary']??''),
          );
        },
        itemCount: Data.highSalaryCoursesList.length,
      ),
    );
  }
}
