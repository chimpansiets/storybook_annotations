part of '../annotations/story_annotation.dart';

class OptionsParameter {
  final String label;
  final dynamic initial;
  final List<dynamic>? options;

  const OptionsParameter(this.label, {required this.initial, this.options});
}
