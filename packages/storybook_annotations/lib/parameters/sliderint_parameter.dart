part of '../annotations/story_annotation.dart';

class SliderIntParameter {
  final String label;
  final int? initial;
  final int? min;
  final int? max;
  final int? divisions;

  const SliderIntParameter(
    this.label, {
    this.initial,
    this.min,
    this.max,
    this.divisions,
  });
}
