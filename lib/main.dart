import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/color_scheme.g.dart';
import 'package:levelup/firebase_options.dart';
import 'package:levelup/views/main_functions.dart/common_home_screen.dart';
import 'package:levelup/views/main_functions.dart/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const LevelUp());
}

class LevelUp extends StatelessWidget {
  const LevelUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins.call().fontFamily,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins.call().fontFamily,
      ),
      home: FirebaseAuth.instance.currentUser != null
          ? LoginScreen()
          : CommonHomeScreen(),
    );
  }
}
