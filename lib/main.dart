import 'package:flutter/material.dart';
import 'package:new_example/annotations/sliderint_annotation.dart';
import 'package:new_example/my_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(const CodeGenExample());
}

class CodeGenExample extends StatelessWidget {
  const CodeGenExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(
      const SliderIntOptions('Test',
          initial: 0, min: 0, max: 100, divisions: 100),
    );
    return Storybook(
      stories: [
        MyButtonStory().story,
      ],
    );
  }
}
