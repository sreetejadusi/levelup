import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
                child: const Icon(
                  Icons.person,
                  size: 60,
                ),
              ),
              const SizedBox(height: 20),
              // User Name
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: const Text(
                  'User Name',
                ),
              ),
              const SizedBox(height: 20),
              ProfileItemWidget(
                title: 'Email',
                iconData: Icons.email_rounded,
              ),
              ProfileItemWidget(
                title: 'Language',
                iconData: Icons.language_rounded,
              ),
              ProfileItemWidget(
                title: 'Dark Mode',
                iconData: Icons.dark_mode_rounded,
              ),
              ProfileItemWidget(
                title: 'Settings',
                iconData: Icons.settings_rounded,
              ),
              ProfileItemWidget(
                title: 'Logout',
                iconData: Icons.logout_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    super.key,
    required this.title,
    required this.iconData,
  });
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Icon(
                iconData,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16), // Added spacing
      ],
    );
  }
}
