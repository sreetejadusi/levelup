import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:levelup/views/article_screen.dart/content_screen.dart';
import 'package:levelup/views/custom_card.dart';

class FresherCourse extends StatefulWidget {
  const FresherCourse({super.key});

  @override
  State<FresherCourse> createState() => MyFresherCourseListState();
}

class MyFresherCourseListState extends State<FresherCourse> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          final profession = Data.fresherCourse[index];
          return GestureDetector(
            onTap: () {
              // Handle onTap event
            },
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ArticleScreen(
                    courseName: 'Level Up',
                    generatedArticle: '',
                  ),
                ));
              },
              child: CustomCard(
                  title: profession['title']??'',
                  subtitle: profession['avgSalary']??''),
            ),
          );
        },
        itemCount: Data.fresherCourse.length,
      ),
    );
  }
}
