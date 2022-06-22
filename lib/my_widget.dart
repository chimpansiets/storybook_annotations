@CodeGen()
library main;

import 'package:storybook_flutter/storybook_flutter.dart';
import 'story_method.dart';
import 'package:super_annotations/super_annotations.dart';
import 'package:flutter/material.dart';

part 'my_widget.g.dart';

@GenerateStory([])
class MyButton extends StatelessWidget {
  final String myText;
  final String mySecondText;

  const MyButton({Key? key, required this.myText, required this.mySecondText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(myText),
          ),
          Text(mySecondText),
        ],
      ),
    );
  }
}
