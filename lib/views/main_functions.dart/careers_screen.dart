import 'package:flutter/material.dart';
import 'package:levelup/views/links_categories.dart/freelancings.dart';
import 'package:levelup/views/links_categories.dart/internships_search.dart';
import 'package:levelup/views/links_categories.dart/jobs_search.dart';
import 'package:levelup/views/links_categories.dart/learnings.dart';
import 'package:levelup/views/links_categories.dart/part_time_jobs.dart';

class CareerScreen extends StatefulWidget {
  const CareerScreen({super.key});

  @override
  State<CareerScreen> createState() => _CareerScreenState();
}

class _CareerScreenState extends State<CareerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Container(
              child: TabBar(
                tabAlignment: TabAlignment.start,
                controller: _tabController,
                isScrollable: true,
                tabs: const [
                  Tab(text: 'Learnings'),
                  Tab(text: 'Jobs'),
                  Tab(text: 'Internships'),
                  Tab(text: 'Freelancing'),
                  Tab(text: 'Part-time Jobs'),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                LearningPortalsScreen(),
                JobPortalScreen(),
                InternshipPortalsScreen(),
                FreelancingPortalsScreen(),
                PartTimeJobsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
