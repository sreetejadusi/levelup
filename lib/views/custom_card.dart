import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.isCareers = false,
  });
  final String title;
  final String subtitle;
  final bool isCareers;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  List<String> savedCourses = [];

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((value) {
      savedCourses = value.getStringList('data') ?? [];
      setState(() {
        savedCourses.toSet().toList();
      });
    });
    bool saved = savedCourses.contains(widget.title);
    return InkWell(
      child: Card(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  if (widget.isCareers)
                    Text(
                      widget.subtitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).clearMaterialBanners();
                    SharedPreferences.getInstance().then((value) {
                      List<String> current = value.getStringList('data') ?? [];
                      if (saved) {
                        current.remove(widget.title);
                        ScaffoldMessenger.of(context).showMaterialBanner(
                            MaterialBanner(content: Text('Removed'), actions: [
                          IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .clearMaterialBanners();
                              },
                              icon: Icon(Icons.close_rounded))
                        ]));
                      } else {
                        current.add(widget.title);
                        ScaffoldMessenger.of(context).showMaterialBanner(
                            MaterialBanner(content: Text('Added'), actions: [
                          IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .clearMaterialBanners();
                              },
                              icon: Icon(Icons.close_rounded))
                        ]));
                      }
                      value.setStringList('data', current);
                      setState(() {});
                    });
                  },
                  icon: Icon(saved
                      ? Icons.delete_outline_rounded
                      : Icons.save_rounded),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
