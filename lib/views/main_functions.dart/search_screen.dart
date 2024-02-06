import 'package:flutter/material.dart';
import 'package:levelup/data.dart';
import 'package:levelup/views/custom_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  late List<Map<String, String>> data;
  @override
  void initState() {
    super.initState();
    data = Data.getData();
  }

  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(48)),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Search for a course...',
                prefixIcon:
                    Icon(Icons.search), // Set search icon color to white
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              onChanged: (value) {
                data.clear();
                if (_controller.text.isNotEmpty) {
                  setState(() {
                    data = Data.getData()
                        .where((element) => element['title']!
                            .trim()
                            .toLowerCase()
                            .contains(_controller.text.trim().toLowerCase()))
                        .toSet()
                        .toList();
                  });
                } else {
                  setState(() {
                    data = Data.getData().toSet().toList();
                  });
                }
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                final course = data[index];
                return GestureDetector(
                  onTap: () async {
                    try {
                      // final generatedArticle =
                      //     await OpenAIService.generateArticle(
                      //         course['title'] ?? '');
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => ArticleScreen(
                      //     courseName: course['title'] ?? '',
                      //     generatedArticle: generatedArticle,
                      //   ),
                      // ));
                      print(course);
                    } catch (e) {
                      // Handle error
                      // Optionally show a snackbar or alert dialog
                    }
                  },
                  child: CustomCard(
                    title: course['title'] ?? '',
                    subtitle: course['avgSalary'] ?? '',
                    isCareers: course['url'] == null,
                  ),
                );
              },
              itemCount: data.length,
            ),
          )
        ],
      ),
    );
  }
}
