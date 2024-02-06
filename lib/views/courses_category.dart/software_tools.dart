import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:levelup/views/custom_card.dart';


class SoftwareTools extends StatefulWidget {
  const SoftwareTools({super.key});

  @override
  State<SoftwareTools> createState() => MySoftwareToolsListState();
}

class MySoftwareToolsListState extends State<SoftwareTools> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          final profession = Data.softwareTools[index];
          return GestureDetector(
            onTap: () {
              // Your onTap logic here
            },
            child: CustomCard(
                title: profession['title']??'', subtitle: profession['avgSalary']??''),
          );
        },
        itemCount: Data.softwareTools.length,
      ),
    );
  }
}
