import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:levelup/views/custom_card.dart';
import 'package:url_launcher/url_launcher.dart';

class JobPortalScreen extends StatefulWidget {
  const JobPortalScreen({Key? key}) : super(key: key);

  @override
  State<JobPortalScreen> createState() => _JobPortalScreenState();
}

class _JobPortalScreenState extends State<JobPortalScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: Data.jobPortals.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _launchURL(Data.jobPortals[index]['url']!);
            },
            child: CustomCard(
              title: Data.jobPortals[index]['title'] ?? '',
              subtitle: '',
              isCareers: false,
            ),
          );
        },
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
