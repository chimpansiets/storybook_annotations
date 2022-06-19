import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

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
          builder: (context) => TextButton(
            onPressed: () {},
            child: Text('Hello'),
          ),
        ),
      ],
    );
  }
}
