import 'package:super_annotations/super_annotations.dart';

class StoryAnnotation extends ClassAnnotation {
  final List<Type> parameters;

  const StoryAnnotation(this.parameters);

  List<Field> _fieldsToKnobs(List<Field> fields) {
    var _knobFields = <Field>[];

    _knobFields.add(
      (FieldBuilder()
            ..type = const Reference('BuildContext')
            ..name = 'buildContext')
          .build(),
    );

    fields.forEach(
      (element) {
        var tmp_field = element.toBuilder();

        tmp_field.assignment = Code(
          'context.knobs.text(label: \'L\', initial: \'T\')',
        );

        var built_field = tmp_field.build();

        print(tmp_field.assignment.toString());
        _knobFields.add(tmp_field.build());
      },
    );

    return _knobFields;
  }

  @override
  void apply(Class target, LibraryBuilder output) {
    _addImports(output);

    var storyWrapperBuffer = StringBuffer();

    _writeStoryWrapper(storyWrapperBuffer, target);

    Iterable<Field> _knobFields = _fieldsToKnobs(target.fields.toList());

    output.body.add(
      Class(
        (b) => b
          ..name = '${target.name}Story'
          ..extend = target.extend
          ..methods.add(
            Method(
              (p0) => p0
                ..name = 'getStory'
                ..returns = const Reference('Story')
                ..body = Code(
                  storyWrapperBuffer.toString(),
                ),
            ),
          )
          ..fields.addAll(_knobFields),
      ),
    );
  }

  void _addImports(LibraryBuilder output) {
    output.body.add(
      Code('import \'package:storybook_flutter/storybook_flutter.dart\';\n'),
    );

    output.body.add(
      Code('import \'package:flutter/material.dart\';\n'),
    );
  }

  void _writeStoryWrapper(StringBuffer buffer, Class target) {
    buffer.writeln('return Story(');
    buffer.writeln('name: \'${target.name}\',');
    buffer.writeln('builder: (context) => super.build(context),');
    buffer.writeln(');');
  }
}
