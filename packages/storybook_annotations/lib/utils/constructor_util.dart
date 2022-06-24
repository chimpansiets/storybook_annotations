import 'package:storybook_annotations/storybook_annotations.dart';
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
      getSuperConstructor(parameters, target),
    );

  return myConstructor.build();
}

String? getKnobType(List<dynamic> parameters, Field field) {
  print("Symbol of ${field.name}:");
  print(field.type!.symbol);
  Map<String, String> symbolToKnobMap = {
    'String': getTextKnobInitializer(field),
    'int': getSliderIntInitializer(
        parameters.firstWhere((element) => element is SliderIntParameter)),
    'double': getSliderInitializer(
        parameters.firstWhere((element) => element is SliderParameter)),
  };

  return symbolToKnobMap[field.type!.symbol];
}

String getTextKnobInitializer(Field field) =>
    'text(label: \'${field.name}Label\', initial: \'${field.name}Initial\')';

String getSliderInitializer(SliderParameter parameter) =>
    'slider(label: \'${parameter.label}\', initial: ${parameter.initial}, min: ${parameter.min}, max: ${parameter.max},)';

String getSliderIntInitializer(SliderIntParameter parameter) =>
    'sliderInt(label: \'${parameter.label}\', initial: ${parameter.initial}, min: ${parameter.min}, max: ${parameter.max}, divisions: ${parameter.divisions},)';

Code getSuperConstructor(List<dynamic> parameters, Class target) {
  StringBuffer buffer = StringBuffer();

  buffer.writeln('super(key: key,');

  for (var field in target.fields) {
    print("Field: $field");
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
  }

  buffer.writeln(')');

  return Code(buffer.toString());
}
