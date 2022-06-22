import 'package:super_annotations/super_annotations.dart';

Constructor getConstructor(Class target) {
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
      getSuperConstructor(target),
    );

  return myConstructor.build();
}

String? getKnobType(Field field) {
  print(field.type!.symbol);
  Map<String, String> symbolToKnobMap = {
    'String':
        'text(label: \'${field.name}Label\', initial: \'${field.name}Initial\')',
  };

  return symbolToKnobMap[field.type!.symbol];
}

Code getSuperConstructor(Class target) {
  StringBuffer buffer = StringBuffer();

  buffer.writeln('super(key: key,');

  for (var field in target.fields) {
    buffer.writeln('${field.name}: context.knobs.${getKnobType(field)}');
  }

  buffer.writeln(',)');

  return Code(buffer.toString());
}
