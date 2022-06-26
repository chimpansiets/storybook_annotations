@CodeGen()
library main;

import 'package:flutter/material.dart';
import 'package:storybook_annotations/storybook_annotations.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:super_annotations/super_annotations.dart';

part 'my_widget.g.dart';

@GenerateStory([
  SliderIntParameter(
    'MyHeightLabel',
    initial: 0,
    min: 0,
    max: 200,
    divisions: 100,
  ),
  SliderParameter(
    'MyWidthLabel',
    initial: 0.0,
    min: 0.0,
    max: 250.0,
  ),
  OptionsParameter(
    'ColorLabel',
    initial: Colors.orange,
    options: [
      Option(label: 'Orange', value: Colors.orange),
      Option(label: 'White', value: Colors.white),
    ],
  ),
])
class MyButton extends StatelessWidget {
  final String myText;
  final int height;
  final double width;
  final bool enabled;
  final Color color;

  const MyButton({
    Key? key,
    required this.myText,
    required this.height,
    required this.width,
    required this.enabled,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(width, height.toDouble()),
                padding: const EdgeInsets.all(16.0),
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: enabled ? () {} : null,
              child: Text(myText),
            ),
          ],
        ),
      ),
    );
  }
}
