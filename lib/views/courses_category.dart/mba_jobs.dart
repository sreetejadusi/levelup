import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:levelup/views/custom_card.dart';

class MBAJobs extends StatefulWidget {
  const MBAJobs({super.key});

  @override
  State<MBAJobs> createState() => MyMBAJobsListState();
}

class MyMBAJobsListState extends State<MBAJobs> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          final profession = Data.mbaJobs[index];
          return GestureDetector(
            onTap: () {},
            child: CustomCard(
                title: profession['title']??'', subtitle: profession['avgSalary']??''),
          );
        },
        itemCount: Data.mbaJobs.length,
      ),
    );
  }
}
