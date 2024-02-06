import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:levelup/views/custom_card.dart';

class NonItCourses extends StatefulWidget {
  const NonItCourses({super.key});

  @override
  State<NonItCourses> createState() => MyNonItCoursesListState();
}

class MyNonItCoursesListState extends State<NonItCourses> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          final profession = Data.nonITCourses[index];
          return GestureDetector(
            onTap: () {
              // Handle onTap event
            },
            child: CustomCard(
                title: profession['title']??'', subtitle: profession['avgSalary']??''),
          );
        },
        itemCount: Data.nonITCourses.length,
      ),
    );
  }
}
