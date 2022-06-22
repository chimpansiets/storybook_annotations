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
        );

  final BuildContext context;
}
