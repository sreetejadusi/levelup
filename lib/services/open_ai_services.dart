import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  static String get openAIAPIKey => apiKey;
  static const String apiUrl = 'https://api.openai.com/v1/completions';

  static get apiKey => openAIAPIKey;

  static Future<String> generateArticle(String courseTitle) async {
    // Define your predefined prompts based on the course title
    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          'prompt': getPredefinedPrompt(courseTitle),
          'max_tokens': 200,
          'temperature': 0.7,
          // Adjust as needed
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body)['choices'][0]['text'];
      } else {
        // Handle API error
        if (kDebugMode) {
          print('Error: ${response.statusCode}');
        }
        return 'Error fetching article';
      }
    } catch (e) {
      // Handle other errors
      if (kDebugMode) {
        print('Error: $e');
      }
      return 'Error fetching article';
    }
  }

  static String getPredefinedPrompt(String courseTitle) {
    // Define your prompts based on the course title
    // You can customize this based on your requirements
    return '''
      Introduction to $courseTitle. 
      Future scope of $courseTitle.
      Salaries levels in India for $courseTitle from fresher to experienced.
      Top companies hiring $courseTitle.
      Interview tips for $courseTitle.
      Resume tips for $courseTitle.
      How to learn $courseTitle.
      $courseTitle course duration.
    ''';
  }
}
