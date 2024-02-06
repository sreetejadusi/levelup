// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:levelup/views/custom_card.dart';
import 'package:url_launcher/url_launcher.dart';

class FreelancingPortalsScreen extends StatefulWidget {
  const FreelancingPortalsScreen({Key? key}) : super(key: key);

  @override
  State<FreelancingPortalsScreen> createState() =>
      _FreelancingPortalsScreenState();
}

class _FreelancingPortalsScreenState extends State<FreelancingPortalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: Data.freelancingPortals.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _launchURL(Data.freelancingPortals[index]['url']!);
            },
            child: CustomCard(
              title: Data.freelancingPortals[index]['title'] ?? '',
              subtitle: '',
              isCareers: false,
            ),
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
