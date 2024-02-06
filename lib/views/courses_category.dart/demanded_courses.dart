import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:levelup/services/open_ai_services.dart';
import 'package:levelup/views/article_screen.dart/content_screen.dart';
import 'package:levelup/views/custom_card.dart';

class DemandedCourse extends StatefulWidget {
  const DemandedCourse({super.key});

  @override
  State<DemandedCourse> createState() => _DemandedCourseState();
}

class _DemandedCourseState extends State<DemandedCourse> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          final course = Data.demandedCourses[index];
          return GestureDetector(
            onTap: () async {
              try {
                final generatedArticle =
                    await OpenAIService.generateArticle(course['title']??'');
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ArticleScreen(
                    courseName: course['title']??'',
                    generatedArticle: generatedArticle,
                  ),
                ));
              } catch (e) {
                // Handle error
                // Optionally show a snackbar or alert dialog
              }
            },
            child: CustomCard(
                title: course['title']??'', subtitle: course['avgSalary']??''),
          );
        },
        itemCount: Data.demandedCourses.length,
      ),
    );
  }
}
