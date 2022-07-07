<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

- Generates Stories to be used within a StoryBook.

## Getting started

`flutter pub add storybook_annotations`

## Usage

Add the annotation '@GenerateStory()' above the widget you would like to generate a story for.
This copies both boolean, int and double fields with a knob and label.

```dart
@GenerateStory()
class MyWidget extends StatelessWidget {
```

## Additional information

This package is still a work in progress, and not yet fully done. I decided to release this beginning of the workings, and contributions are very welcome!
