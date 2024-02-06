import 'package:flutter/material.dart';
import 'package:levelup/services/open_ai_services.dart';

class ArticleScreen extends StatefulWidget {
  final String courseName;

  const ArticleScreen({
    super.key,
    required this.courseName,
    required String generatedArticle,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  String generatedArticle = '';

  @override
  void initState() {
    super.initState();
    _fetchArticleContent(widget.courseName);
  }

  Future<void> _fetchArticleContent(String courseTitle) async {
    String prompt = 'Generate an article about $courseTitle';
    String article = await OpenAIService.generateArticle(prompt);

    setState(() {
      generatedArticle = article;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.courseName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(generatedArticle),
      ),
    );
  }
}
