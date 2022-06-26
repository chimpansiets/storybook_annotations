import 'package:flutter/material.dart';
import 'package:new_example/my_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(const CodeGenExample());
}

class CodeGenExample extends StatelessWidget {
  const CodeGenExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.knobs.options(
      label: 'MyLabel',
      initial: Colors.orange,
      options: [
        const Option(label: 'MyOption1', value: Colors.orange),
      ],
    );
    return Storybook(
      stories: [
        MyButtonStory().story,
      ],
    );
  }
}
