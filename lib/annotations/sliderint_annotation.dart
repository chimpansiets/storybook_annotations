part of 'story_annotation.dart';

class SliderIntOptions {
  final String label;
  final int initial;
  final int min;
  final int max;
  final int divisions;

  const SliderIntOptions(
    this.label, {
    required this.initial,
    required this.min,
    required this.max,
    required this.divisions,
  });
}
