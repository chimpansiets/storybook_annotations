import 'package:new_example/utils/constructor_util.dart';
import 'package:new_example/utils/fields_util.dart';
import 'package:new_example/utils/import_util.dart';
import 'package:new_example/utils/constructor_util.dart';
import 'package:new_example/utils/methods_util.dart';
import 'package:super_annotations/super_annotations.dart';
import 'utils/fields_util.dart';

class StoryAnnotation extends ClassAnnotation {
  final List<Object> parameters;

  const StoryAnnotation(this.parameters);

  @override
  void apply(Class target, LibraryBuilder output) {
    addImports(target, output);

    output.body.add(
      Class(
        (b) => b
          ..name = '${target.name}Story'
          ..extend = Reference(target.name)
          ..methods.addAll(
            getMethods(target),
          )
          ..fields.addAll(getFields(target))
          ..constructors.add(getConstructor(target)),
      ),
    );
  }
}
