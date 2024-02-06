import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:levelup/views/custom_card.dart';


class ProgrammingLanguages extends StatefulWidget {
  const ProgrammingLanguages({super.key});

  @override
  State<ProgrammingLanguages> createState() =>
      MyProgrammingLanguagesListState();
}

class MyProgrammingLanguagesListState extends State<ProgrammingLanguages> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          final language = Data.programmingLanguages[index];
          return GestureDetector(
            onTap: () {
              // Handle onTap action
            },
            child: CustomCard(
                title: language['title']??'', subtitle: language['avgSalary']??''),
          );
        },
        itemCount: Data.programmingLanguages.length,
      ),
    );
  }
}
