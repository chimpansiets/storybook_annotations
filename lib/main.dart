import 'package:flutter/material.dart';
import 'package:new_example/my_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:super_annotations/super_annotations.dart';

void main() {
  runApp(const CodeGenExample());
}

class CodeGenExample extends StatelessWidget {
  const CodeGenExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Storybook(
      stories: [
        Story(
          name: 'myStory',
          builder: (context) => MyButtonStory(context: context),
        ),
      ],
    );
  }
}
