part of '../annotations/story_annotation.dart';

class SliderParameter {
  final String label;
  final String? description;
  final double? initial;
  final double? min;
  final double? max;

  const SliderParameter(
    this.label, {
    this.description,
    this.initial,
    this.min,
    this.max,
  });
}
