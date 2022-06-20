import 'package:new_example/utils/constructor_util.dart';
import 'package:new_example/utils/fields_util.dart';
import 'package:new_example/utils/import_util.dart';
import 'package:new_example/utils/constructor_util.dart';
import 'package:super_annotations/super_annotations.dart';
import 'utils/fields_util.dart';

class StoryAnnotation extends ClassAnnotation {
  final List<Object> parameters;

  const StoryAnnotation(this.parameters);

  String _getStoryWrapper(Class target) {
    var storyWrapperBuffer = StringBuffer();

    storyWrapperBuffer.writeln('return Story(');
    storyWrapperBuffer.writeln('name: \'${target.name}\',');
    storyWrapperBuffer.writeln('builder: (context) => super.build(context),');
    storyWrapperBuffer.writeln(');');

    return storyWrapperBuffer.toString();
  }

  @override
  void apply(Class target, LibraryBuilder output) {
    addImports(target, output);

    output.body.add(
      Class(
        (b) => b
          ..name = '${target.name}Story'
          ..extend = Reference(target.name)
          ..methods.add(
            Method(
              (p0) => p0
                ..name = 'getStory'
                ..returns = const Reference('Story')
                ..body = Code(
                  _getStoryWrapper(target),
                ),
            ),
          )
          ..fields.addAll(getFields(target))
          ..constructors.add(getConstructor(target)),
      ),
    );
  }
}
