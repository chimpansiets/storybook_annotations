import 'package:super_annotations/super_annotations.dart';

class OptionAnnotation extends FunctionAnnotation {
  @override
  void apply(Method target, LibraryBuilder output) {
    // TODO: implement apply
  }
}

class StoryAnnotation extends ClassAnnotation {
  final List<Object> parameters;

  const StoryAnnotation(this.parameters);

  List<Field> _fieldsToKnobs(List<Field> fields) {
    var _knobFields = <Field>[];

    _knobFields.add(
      (FieldBuilder()
            ..type = const Reference('final BuildContext')
            ..name = 'context')
          .build(),
    );

    fields.forEach(
      (element) {
        var tmp_field = element.toBuilder()..late = true;

        var built_field = tmp_field.build();

        _knobFields.add(tmp_field.build());
      },
    );

    return _knobFields;
  }

  Iterable<Field> _getFields(Class target) {
    Iterable<Field> _knobFields = _fieldsToKnobs(target.fields.toList());

    return _knobFields;
  }

  String _getStoryWrapper(Class target) {
    var storyWrapperBuffer = StringBuffer();

    storyWrapperBuffer.writeln('return Story(');
    storyWrapperBuffer.writeln('name: \'${target.name}\',');
    storyWrapperBuffer.writeln('builder: (context) => super.build(context),');
    storyWrapperBuffer.writeln(');');

    return storyWrapperBuffer.toString();
  }

  Constructor _getConstructor(Class target) {
    var keyParameter = (ParameterBuilder()
          ..name = 'key'
          ..type = Reference('Key?')
          ..named = true)
        .build();

    var buildContextParameter = (ParameterBuilder()
          ..name = 'this.context'
          ..type = Reference('BuildContext')
          ..named = true
          ..required = true)
        .build();

    var myConstructor = ConstructorBuilder()
      ..optionalParameters.addAll([keyParameter, buildContextParameter])
      ..initializers.add(Code('super(key: key)'))
      ..body =
          Code('myText = context.knobs.text(label: \'L\', initial: \'T\');');

    return myConstructor.build();
  }

  @override
  void apply(Class target, LibraryBuilder output) {
    _addImports(target, output);

    output.body.add(
      Class(
        (b) => b
          ..name = '${target.name}Story'
          ..extend = Reference('${target.name}')
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
          ..fields.addAll(_getFields(target))
          ..constructors.add(_getConstructor(target)),
      ),
    );
  }

  void _addImports(Class target, LibraryBuilder output) {
    output.body.add(
      Code('import \'package:storybook_flutter/storybook_flutter.dart\';\n'),
    );

    output.body.add(
      Code('import \'package:flutter/material.dart\';\n'),
    );

    // Allocator().allocate('MyButton', '')

    output.body.add(
      Code('import \'my_widget.dart\';\n'),
    );
  }
}
