import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';
import 'my_widget.dart';

class MyButtonStory extends MyButton {
  MyButtonStory({Key? key, required BuildContext context}) : super(key: key);

  BuildContext context;

  final String myText = context.knobs.text(label: 'L', initial: 'T');

  Story getStory() {
    return Story(
      name: 'MyButton',
      builder: (context) => super.build(context),
    );
  }
}
