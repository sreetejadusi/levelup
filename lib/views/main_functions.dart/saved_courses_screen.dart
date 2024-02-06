// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedCoursesScreen extends StatefulWidget {
  const SavedCoursesScreen({Key? key}) : super(key: key);

  @override
  State<SavedCoursesScreen> createState() => _SavedCoursesScreenState();
}

class _SavedCoursesScreenState extends State<SavedCoursesScreen> {
  List<Map<String, String>> savedCourses = [];

  void getSavedData() {
    savedCourses.clear();
    SharedPreferences.getInstance().then((value) {
      for (var element in (value.getStringList('data') ?? [])) {
        savedCourses
            .add(Data.getData().firstWhere((_) => _['title'] == element));
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSavedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: savedCourses.isEmpty
          ? Center(
              child: Text('No saved courses.'),
            )
          : ListView.builder(
              itemCount: savedCourses.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  margin: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    title: Text(savedCourses[index]['title'] ?? ''),
                    trailing: IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).clearMaterialBanners();
                          SharedPreferences.getInstance().then((value) {
                            List<String> current =
                                value.getStringList('data') ?? [];
                            current.remove(savedCourses[index]['title']);
                            ScaffoldMessenger.of(context).showMaterialBanner(
                                MaterialBanner(
                                    content: Text('Removed'),
                                    actions: [
                                  IconButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .clearMaterialBanners();
                                      },
                                      icon: Icon(Icons.close_rounded))
                                ]));
                            value.setStringList('data', current);
                            setState(() {
                              getSavedData();
                            });
                          });
                        },
                        icon: Icon(Icons.delete_rounded)),
                  ),
                );
              },
            ),
    );
  }
}
