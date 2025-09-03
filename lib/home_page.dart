import 'package:emojis_demo/widget_helper.dart';
import 'package:emojis_demo/util/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        title: Text("Mood Swing", style: TextStyle(
            color: Theme
                .of(context)
                .colorScheme
                .onPrimary
        ),),
      ),
      body: _buildHomeBody(count),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildHomeBody(int index) {
    final dynamic mood = Constants.moodList[index%4];

    return SafeArea(
      minimum: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Counter at the top
          Text(
            "counter=$index",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Centered emoji + text
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min, // Wrap content vertically
                children: [
                  Text(
                    mood["emoji"],
                    style: const TextStyle(
                      fontSize: 80, // Bigger emoji
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    mood["text"],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
