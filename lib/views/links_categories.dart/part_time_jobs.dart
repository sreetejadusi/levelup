import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:levelup/views/custom_card.dart';
import 'package:url_launcher/url_launcher.dart';

class PartTimeJobsScreen extends StatefulWidget {
  const PartTimeJobsScreen({Key? key}) : super(key: key);

  @override
  State<PartTimeJobsScreen> createState() => _PartTimeJobsScreenState();
}

class _PartTimeJobsScreenState extends State<PartTimeJobsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: Data.partTimeJobs.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _launchURL(Data.partTimeJobs[index]['url']!);
            },
            child: CustomCard(
              title: Data.partTimeJobs[index]['title'] ?? '',
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
