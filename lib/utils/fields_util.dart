import 'package:super_annotations/super_annotations.dart';

List<Field> fieldsToKnobs(List<Field> fields) {
  var knobFields = <Field>[];

  knobFields.add(
    (FieldBuilder()
          ..type = const Reference('final BuildContext')
          ..name = 'context')
        .build(),
  );

  return knobFields;
}

Iterable<Field> getFields(Class target) {
  Iterable<Field> knobFields = fieldsToKnobs(target.fields.toList());

  return knobFields;
}
