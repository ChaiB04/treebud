import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';

class TreeMarker extends AnimatedMarker {
  TreeMarker({
    required super.point,
    VoidCallback? onTap,
  }) : super(
    width: markerSize,
    height: markerSize,
    builder: (context, animation) {
      final size = markerSize * animation.value;

      return GestureDetector(
        onTap: onTap,
        child: Opacity(
          opacity: animation.value,
          child: Icon(
            Icons.room,
            size: size,
              color:  const Color.fromRGBO(41, 57, 33, 1.0),
          ),
        ),
      );
    },
  );

  static const markerSize = 50.0;
}
