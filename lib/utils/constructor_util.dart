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
      const Code(
          'super(key: key, myText: context.knobs.text(label: \'L\', initial: \'T\'),)'),
    );

  return myConstructor.build();
}
