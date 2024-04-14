import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';

class PersonMarker extends AnimatedMarker {
  PersonMarker({
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
            color: Colors.redAccent,
          ),
        ),
      );
    },
  );

  static const markerSize = 50.0;
}
