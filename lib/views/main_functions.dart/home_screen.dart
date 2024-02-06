import 'package:flutter/material.dart';
import 'package:levelup/views/courses_category.dart/cloud_computing.dart';
import 'package:levelup/views/courses_category.dart/demanded_courses.dart';
import 'package:levelup/views/courses_category.dart/fresher_courses.dart';
import 'package:levelup/views/courses_category.dart/high_salary_courses.dart';
import 'package:levelup/views/courses_category.dart/it_courses.dart';
import 'package:levelup/views/courses_category.dart/mba_jobs.dart';
import 'package:levelup/views/courses_category.dart/non_it.dart';
import 'package:levelup/views/courses_category.dart/programming_languages.dart';
import 'package:levelup/views/courses_category.dart/software_tools.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 9, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabAlignment: TabAlignment.start,
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Demanded'),
            Tab(text: 'Freshers'),
            Tab(text: 'High Salary'),
            Tab(text: 'IT'),
            Tab(text: 'Non-IT'),
            Tab(text: 'Tools'),
            Tab(text: 'Cloud Computing'),
            Tab(text: 'Programming Languages'),
            Tab(text: 'MBA'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              DemandedCourse(),
              FresherCourse(),
              HighSalaryCourses(),
              ITCourses(),
              NonItCourses(),
              SoftwareTools(),
              CloudComputing(),
              ProgrammingLanguages(),
              MBAJobs(),
            ],
          ),
        ),
      ],
    );
  }
}
