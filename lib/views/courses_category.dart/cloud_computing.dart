import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:levelup/views/custom_card.dart';

class CloudComputing extends StatefulWidget {
  const CloudComputing({super.key});

  @override
  State<CloudComputing> createState() => MyCloudComputingListState();
}

class MyCloudComputingListState extends State<CloudComputing> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          final profession = Data.cloudComputing[index];
          return GestureDetector(
            onTap: () {
              // Your onTap logic here
            },
            child: CustomCard(
                title: profession['title']??'', subtitle: profession['avgSalary']??''),
          );
        },
        itemCount: Data.cloudComputing.length,
      ),
    );
  }
}
