part of 'my_widget.dart';

class MyButtonStory extends MyButton {
  MyButtonStory({Key? key, required this.context})
      : super(
          key: key,
          myText: context.knobs.text(label: 'L', initial: 'T'),
        );

  final BuildContext context;

  Story getStory() {
    return Story(
      name: 'MyButton',
      builder: (context) => super.build(context),
    );
  }
}
