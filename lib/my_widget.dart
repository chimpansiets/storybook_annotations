@CodeGen()
library main;

import 'package:storybook_flutter/storybook_flutter.dart';
import 'story_method.dart';
import 'package:super_annotations/super_annotations.dart';
import 'package:flutter/material.dart';

part 'my_widget.g.dart';

@StoryAnnotation([])
class MyButton extends StatelessWidget {
  final String myText;

  const MyButton({Key? key, required this.myText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(myText),
      ),
    );
  }
}
