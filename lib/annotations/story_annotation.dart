import 'package:storybook_annotations/utils/constructor_util.dart';
import 'package:storybook_annotations/utils/fields_util.dart';
import 'package:storybook_annotations/utils/import_util.dart';
import 'package:super_annotations/super_annotations.dart';

part '../parameters/sliderint_parameter.dart';
part '../parameters/slider_parameter.dart';
part '../parameters/options_parameter.dart';

class GenerateStory extends ClassAnnotation {
  final List<dynamic> parameters;

  const GenerateStory(this.parameters);

  @override
  void apply(Class target, LibraryBuilder output) {
    addImports(target, output);

    output.body.add(
      _generatePublicStoryClass(target),
    );

    output.body.add(
      _generatePrivateExtensionClass(target),
    );
  }

  Class _generatePublicStoryClass(Class target) {
    return Class(
      (b) => b
        ..name = '${target.name}Story'
        ..fields.add(
          Field(
            ((p0) => p0
              ..name = 'story'
              ..type = const Reference('Story')
              ..assignment = Code(
                  'Story(name: \'${target.name}Story\',builder: (context) => _\$${target.name}Story(context: context),)')),
          ),
        ),
    );
  }

  Class _generatePrivateExtensionClass(Class target) {
    return Class(
      (b) => b
        ..name = '_\$${target.name}Story'
        ..extend = Reference(target.name)
        ..fields.addAll(getFields(target))
        ..constructors.add(getConstructor(parameters, target)),
    );
  }
}
