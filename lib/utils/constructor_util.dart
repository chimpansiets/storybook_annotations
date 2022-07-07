import 'package:storybook_annotations/annotations/story_annotation.dart';
import 'package:super_annotations/super_annotations.dart';

Constructor getConstructor(List<dynamic> parameters, Class target) {
  var keyParameter = (ParameterBuilder()
        ..name = 'key'
        ..type = const Reference('Key?')
        ..named = true)
      .build();

  var buildContextParameter = (ParameterBuilder()
        ..name = 'this.context'
        ..named = true
        ..required = true)
      .build();

  var myConstructor = ConstructorBuilder()
    ..optionalParameters.addAll([keyParameter, buildContextParameter])
    ..initializers.add(
      // TODO: Go through super.fields and initialize them with knobs
      // instead of this hardcoded text knob
      // Code('super(key: key)'),
      getSuperConstructor(parameters, target),
    );

  return myConstructor.build();
}

String? getKnobType(List<dynamic> parameters, Field field) {
  print(field.type!.symbol);
  switch (field.type!.symbol) {
    case 'String':
      return getTextKnobInitializer(field);
    case 'int':
      return getSliderIntInitializer(
          parameters.firstWhere((element) => element is SliderIntParameter));
    case 'double':
      return getSliderInitializer(
          parameters.firstWhere((element) => element is SliderParameter));
    case 'bool':
      return getBooleanInitializer(field);
    default:
      return getOptionsInitializer(
        parameters.firstWhere((element) => element is OptionsParameter),
      );
  }
}

String getOptionsInitializer(OptionsParameter parameter) =>
    'options(label: ${parameter.label}, initial: ${parameter.initial}, options: ${parameter.options.toString()},)';

String getBooleanInitializer(Field field) =>
    'boolean(label: \'${field.name}Label\', initial: false,)';

String getTextKnobInitializer(Field field) =>
    'text(label: \'${field.name}Label\', initial: \'${field.name}Initial\',)';

String getSliderInitializer(SliderParameter parameter) =>
    'slider(label: \'${parameter.label}\', initial: ${parameter.initial}, min: ${parameter.min}, max: ${parameter.max},)';

String getSliderIntInitializer(SliderIntParameter parameter) =>
    'sliderInt(label: \'${parameter.label}\', initial: ${parameter.initial}, min: ${parameter.min}, max: ${parameter.max}, divisions: ${parameter.divisions},)';

Code getSuperConstructor(List<dynamic> parameters, Class target) {
  StringBuffer buffer = StringBuffer();

  buffer.writeln('super(key: key,');

  for (var field in target.fields) {
    buffer.writeln(
        '${field.name}: context.knobs.${getKnobType(parameters, field)},');

    // if a parameter was used, pop it from the list
    if (field.type!.symbol == 'int') {
      parameters.remove(
          parameters.firstWhere((element) => element is SliderIntParameter));
    } else if (field.type!.symbol == 'double') {
      parameters.remove(
          parameters.firstWhere((element) => element is SliderParameter));
    }
    // else {
    //   parameters.remove(
    //       parameters.firstWhere((element) => element is OptionsParameter));
    // }
  }

  buffer.writeln(')');

  return Code(buffer.toString());
}
