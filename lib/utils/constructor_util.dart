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
  Map<String, String> symbolToKnobMap = {
    'String':
        'text(label: \'${field.name}Label\', initial: \'${field.name}Initial\')',
    'int':
        'sliderInt(label: \'${field.name}Label\', initial: ${parameters.first.initial}, min: ${parameters.first.min}, max: ${parameters.first.max}, divisions: ${parameters.first.divisions},)',
  };

  return symbolToKnobMap[field.type!.symbol];
}

Code getSuperConstructor(List<dynamic> parameters, Class target) {
  StringBuffer buffer = StringBuffer();

  buffer.writeln('super(key: key,');

  for (var field in target.fields) {
    buffer.writeln(
        '${field.name}: context.knobs.${getKnobType(parameters, field)},');

    // if a parameter was used, pop it from the list
    if (field.type!.symbol == 'int') {
      parameters.removeAt(0);
    }
  }

  buffer.writeln(')');

  return Code(buffer.toString());
}
