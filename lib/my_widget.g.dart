import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';

class MyButtonStory extends StatelessWidget {
  BuildContext buildContext;

  final String myText = context.knobs.text(label: 'L', initial: 'T');

  Story getStory() {
    return Story(
      name: 'MyButton',
      builder: (context) => super.build(context),
    );
  }
}
