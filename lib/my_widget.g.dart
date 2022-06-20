import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';
import 'my_widget.dart';

class MyButtonStory extends MyButton {
  MyButtonStory({Key? key, required BuildContext this.context})
      : super(key: key) {
    myText = context.knobs.text(label: 'L', initial: 'T');
  }

  final BuildContext context;

  late final String myText;

  Story getStory() {
    return Story(
      name: 'MyButton',
      builder: (context) => super.build(context),
    );
  }
}
