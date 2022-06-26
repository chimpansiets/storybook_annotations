import 'dart:core';
import 'dart:isolate';

import 'package:storybook_annotations/annotations/story_annotation.dart';
import 'package:super_annotations/super_annotations.dart';

void main(List<String> args, SendPort port) {
  CodeGen.currentFile = 'my_widget.dart';
  CodeGen.currentTarget = 'g';
  var library = Library((l) {
    Class((c) => c
      ..name = 'MyButton'
      ..extend = TypeReference((t) => t
        ..symbol = 'StatelessWidget'
        ..isNullable = false)
      ..fields.addAll([
        Field((f) => f
          ..name = 'myText'
          ..type = TypeReference((t) => t
            ..symbol = 'String'
            ..isNullable = false)
          ..modifier = FieldModifier.final$
          ..static = false
          ..late = false),
        Field((f) => f
          ..name = 'height'
          ..type = TypeReference((t) => t
            ..symbol = 'int'
            ..isNullable = false)
          ..modifier = FieldModifier.final$
          ..static = false
          ..late = false),
        Field((f) => f
          ..name = 'width'
          ..type = TypeReference((t) => t
            ..symbol = 'double'
            ..isNullable = false)
          ..modifier = FieldModifier.final$
          ..static = false
          ..late = false),
        Field((f) => f
          ..name = 'enabled'
          ..type = TypeReference((t) => t
            ..symbol = 'bool'
            ..isNullable = false)
          ..modifier = FieldModifier.final$
          ..static = false
          ..late = false),
        Field((f) => f
          ..name = 'color'
          ..type = TypeReference((t) => t
            ..symbol = 'Color'
            ..isNullable = false)
          ..modifier = FieldModifier.final$
          ..static = false
          ..late = false)
      ])
      ..constructors.addAll([
        Constructor((c) => c
          ..factory = false
          ..constant = true
          ..optionalParameters.addAll([
            Parameter((p) => p
              ..name = 'key'
              ..type = TypeReference((t) => t
                ..symbol = 'Key'
                ..isNullable = true)
              ..toThis = false
              ..named = true
              ..required = false
              ..defaultTo = null),
            Parameter((p) => p
              ..name = 'myText'
              ..type = TypeReference((t) => t
                ..symbol = 'String'
                ..isNullable = false)
              ..toThis = true
              ..named = true
              ..required = true
              ..defaultTo = null),
            Parameter((p) => p
              ..name = 'height'
              ..type = TypeReference((t) => t
                ..symbol = 'int'
                ..isNullable = false)
              ..toThis = true
              ..named = true
              ..required = true
              ..defaultTo = null),
            Parameter((p) => p
              ..name = 'width'
              ..type = TypeReference((t) => t
                ..symbol = 'double'
                ..isNullable = false)
              ..toThis = true
              ..named = true
              ..required = true
              ..defaultTo = null),
            Parameter((p) => p
              ..name = 'enabled'
              ..type = TypeReference((t) => t
                ..symbol = 'bool'
                ..isNullable = false)
              ..toThis = true
              ..named = true
              ..required = true
              ..defaultTo = null),
            Parameter((p) => p
              ..name = 'color'
              ..type = TypeReference((t) => t
                ..symbol = 'Color'
                ..isNullable = false)
              ..toThis = true
              ..named = true
              ..required = true
              ..defaultTo = null)
          ]))
      ])
      ..methods.addAll([
        Method((m) => m
          ..name = 'build'
          ..returns = TypeReference((t) => t
            ..symbol = 'Widget'
            ..isNullable = false)
          ..types.addAll([])
          ..requiredParameters.addAll([
            Parameter((p) => p
              ..name = 'context'
              ..type = TypeReference((t) => t
                ..symbol = 'BuildContext'
                ..isNullable = false)
              ..toThis = false
              ..named = false
              ..required = false
              ..defaultTo = null)
          ])
          ..optionalParameters.addAll([])
          ..static = false
          ..annotations.addAll([ResolvedAnnotation(override, '@override')]))
      ])
      ..annotations.addAll([
        ResolvedAnnotation(
            GenerateStory([
              SliderIntParameter('MyHeightLabel',
                  initial: 0, min: 0, max: 200, divisions: 100),
              SliderParameter('MyWidthLabel',
                  initial: 0.0, min: 0.0, max: 250.0),
              OptionsParameter('ColorLabel', initial: Colors.orange, options: [
                Option(label: 'Orange', value: Colors.orange),
                Option(label: 'White', value: Colors.white)
              ])
            ]),
            '@GenerateStory([SliderIntParameter(\'MyHeightLabel\', initial: 0, min: 0, max: 200, divisions: 100), SliderParameter(\'MyWidthLabel\', initial: 0.0, min: 0.0, max: 250.0), OptionsParameter(\'ColorLabel\', initial: Colors.orange, options: [Option(label: \'Orange\', value: Colors.orange), Option(label: \'White\', value: Colors.white)])])')
      ])
      ..run((c) => GenerateStory([
            SliderIntParameter('MyHeightLabel',
                initial: 0, min: 0, max: 200, divisions: 100),
            SliderParameter('MyWidthLabel', initial: 0.0, min: 0.0, max: 250.0),
            OptionsParameter('ColorLabel', initial: Colors.orange, options: [
              Option(label: 'Orange', value: Colors.orange),
              Option(label: 'White', value: Colors.white)
            ])
          ]).modify(c)))
      ..run((c) => GenerateStory([
            SliderIntParameter('MyHeightLabel',
                initial: 0, min: 0, max: 200, divisions: 100),
            SliderParameter('MyWidthLabel', initial: 0.0, min: 0.0, max: 250.0),
            OptionsParameter('ColorLabel', initial: Colors.orange, options: [
              Option(label: 'Orange', value: Colors.orange),
              Option(label: 'White', value: Colors.white)
            ])
          ]).apply(c, l));
  });
  port.send(
      library.accept(DartEmitter.scoped(useNullSafetySyntax: true)).toString());
}
