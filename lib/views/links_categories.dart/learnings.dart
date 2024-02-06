// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:levelup/views/custom_card.dart';
import 'package:url_launcher/url_launcher.dart';

class LearningPortalsScreen extends StatefulWidget {
  const LearningPortalsScreen({Key? key}) : super(key: key);

  @override
  State<LearningPortalsScreen> createState() => _LearningPortalsScreenState();
}

class _LearningPortalsScreenState extends State<LearningPortalsScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: Data.learningPortals.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _launchURL(Data.learningPortals[index]['url']!);
            },
            child: CustomCard(
                title: Data.learningPortals[index]['title'] ?? '', subtitle: ''),
          );
        },
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
