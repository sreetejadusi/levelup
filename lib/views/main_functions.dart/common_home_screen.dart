import 'package:flutter/material.dart';
import 'package:levelup/services/open_ai_services.dart';
import 'package:levelup/views/main_functions.dart/careers_screen.dart';
import 'package:levelup/views/main_functions.dart/home_screen.dart';
import 'package:levelup/views/main_functions.dart/profile_screen.dart';
import 'package:levelup/views/main_functions.dart/saved_courses_screen.dart';
import 'package:levelup/views/main_functions.dart/search_screen.dart';

class CommonHomeScreen extends StatefulWidget {
  const CommonHomeScreen({super.key});

  @override
  State<CommonHomeScreen> createState() => _CommonHomeScreenState();
}

class _CommonHomeScreenState extends State<CommonHomeScreen> {
  final OpenAIService openAIService = OpenAIService();
  String? generatedContent;
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selected,
        onTap: (int value) {
          setState(() {
            selected = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.link_rounded),
            label: "Careers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save_rounded),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          selected == 0
              ? 'Level Up'
              : selected == 1
                  ? 'Careers'
                  : selected == 2
                      ? 'Search'
                      : selected == 3
                          ? 'Saved'
                          : 'Profile',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: selected == 0
          ? const HomeScreen()
          : selected == 1
              ? const CareerScreen()
              : selected == 2
                  ? const SearchScreen()
                  : selected == 3
                      ? const SavedCoursesScreen()
                      : const ProfileScreen(),
    );
  }
}
