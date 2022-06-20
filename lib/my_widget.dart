@CodeGen()
library main;

import 'story_method.dart';
import 'package:super_annotations/super_annotations.dart';
import 'package:flutter/material.dart';
import 'package:code_builder/code_builder.dart';

part 'my_widget.g.dart';

@StoryAnnotation([])
class MyButton extends StatelessWidget {
  final myText = 'Hello';

  const MyButton({Key? key}) : super(key: key);

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
