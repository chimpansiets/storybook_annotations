import 'package:super_annotations/super_annotations.dart';

String? getFieldKnobType(Field field) {
  Map<String, String> knobTypes = {
    'String':
        'text(label: \'${field.name}Label\', initial: \'${field.assignment}\');',
  };

  return knobTypes[field.type!.symbol];
}

void initSuperFields(StringBuffer buffer, Class target) {
  List<Field> fields = target.fields.toList();

  for (var field in fields) {
    print(field.name);
    String? fieldKnobType = getFieldKnobType(field);

    if (fieldKnobType == null) {
      continue;
    }

    buffer.writeln('super.${field.name} = context.knobs.$fieldKnobType');
  }
}

String getStoryWrapper(Class target) {
  var storyWrapperBuffer = StringBuffer();

  storyWrapperBuffer.writeln('return Story(');
  storyWrapperBuffer.writeln('name: \'MyButtonStory\',');
  storyWrapperBuffer.writeln('builder: (context) {');
  initSuperFields(storyWrapperBuffer, target);
  storyWrapperBuffer.writeln('return super.build(context);');
  storyWrapperBuffer.writeln('},');
  storyWrapperBuffer.writeln(');');

  return storyWrapperBuffer.toString();
}

Method getStoryMethod(Class target) {
  return Method(
    (p0) => p0
      ..name = 'getStory'
      ..returns = const Reference('Story')
      ..body = Code(
        getStoryWrapper(target),
      ),
  );
}

Iterable<Method> getMethods(Class target) {
  List<Method> methods = [];

  methods.add(getStoryMethod(target));

  return methods;
}
