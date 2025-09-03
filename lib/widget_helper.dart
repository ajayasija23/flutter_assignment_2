import 'package:flutter/widgets.dart';

extension SpaceExtension on num {
  /// Horizontal space (width)
  SizedBox get w => SizedBox(width: toDouble());

  /// Vertical space (height)
  SizedBox get h => SizedBox(height: toDouble());
}