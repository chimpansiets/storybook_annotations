part of 'my_widget.dart';

class MyButtonStory extends MyButton {
  final BuildContext context;
  late String myTextKnob;

  MyButtonStory({Key? key, required this.context})
      : super(key: key, myText: 'T');

  @override
  Widget build(BuildContext context) {
    myTextKnob = context.knobs.text(label: 'myTextLabel', initial: 'null');

    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(myTextKnob),
      ),
    );
  }

  Story getStory() {
    return Story(
      name: 'MyButtonStory',
      builder: (context) {
        return build(context);
      },
    );
  }
}
