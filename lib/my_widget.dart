@CodeGen()
library main;

import 'package:new_example/annotations/story_annotation.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:super_annotations/super_annotations.dart';
import 'package:flutter/material.dart';

part 'my_widget.g.dart';

@GenerateStory([
  SliderIntOptions(
    'MyHeightLabel',
    initial: 0,
    min: 0,
    max: 200,
    divisions: 100,
  ),
  SliderIntOptions(
    'MyWidthLabel',
    initial: 0,
    min: 0,
    max: 250,
    divisions: 100,
  )
])
class MyButton extends StatelessWidget {
  final String myText;
  final int height;
  final int width;

  const MyButton(
      {Key? key,
      required this.myText,
      required this.height,
      required this.width})
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
          Container(
            height: 100,
            width: 100,
            color: Colors.orange.withOpacity(0.8),
          ),
        ],
      ),
    );
  }
}
