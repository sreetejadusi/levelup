import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:levelup/views/custom_card.dart';
import 'package:url_launcher/url_launcher.dart';

class InternshipPortalsScreen extends StatefulWidget {
  const InternshipPortalsScreen({Key? key}) : super(key: key);

  @override
  State<InternshipPortalsScreen> createState() =>
      _InternshipPortalsScreenState();
}

class _InternshipPortalsScreenState extends State<InternshipPortalsScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: Data.internshipPortals.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _launchURL(Data.internshipPortals[index]['url']!);
            },
            child: CustomCard(
              title: Data.internshipPortals[index]['title'] ?? '',
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
