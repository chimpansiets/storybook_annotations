part of 'my_widget.dart';

class MyButtonStory {
  Story story = Story(
    name: 'MyButtonStory',
    builder: (context) => _$MyButtonStory(context: context),
  );
}

class _$MyButtonStory extends MyButton {
  _$MyButtonStory({Key? key, required this.context})
      : super(
          key: key,
          myText: context.knobs
              .text(label: 'myTextLabel', initial: 'myTextInitial'),
          height: context.knobs.sliderInt(
            label: 'MyHeightLabel',
            initial: 0,
            min: 0,
            max: 200,
            divisions: 100,
          ),
          width: context.knobs.slider(
            label: 'MyWidthLabel',
            initial: 0.0,
            min: 0.0,
            max: 250.0,
          ),
        );

  final BuildContext context;
}
