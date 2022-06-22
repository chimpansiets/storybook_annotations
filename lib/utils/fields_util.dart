import 'package:super_annotations/super_annotations.dart';

Field fieldToKnob(Field field) {
  return (field.toBuilder()
        ..name = '${field.name}Knob'
        ..modifier = FieldModifier.var$
        ..late = true)
      .build();
}

List<Field> fieldsToKnobs(List<Field> fields) {
  var knobFields = <Field>[];

  knobFields.add(
    (FieldBuilder()
          ..type = const Reference('final BuildContext')
          ..name = 'context')
        .build(),
  );

  for (var field in fields) {
    knobFields.add(fieldToKnob(field));
  }

  return knobFields;
}

Iterable<Field> getFields(Class target) {
  Iterable<Field> knobFields = fieldsToKnobs(target.fields.toList());

  return knobFields;
}
