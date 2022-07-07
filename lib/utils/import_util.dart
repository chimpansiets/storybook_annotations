import 'package:super_annotations/super_annotations.dart';

void addImports(Class target, LibraryBuilder output) {
  // TODO: Fix file names dynamically
  output.body.add(
    const Code('part of \'my_widget.dart\';\n'),
  );
}
