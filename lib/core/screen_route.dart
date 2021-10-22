import 'package:flutter/material.dart';

enum ScreenRouteDirections { rightToLeft, bottomToTop }

class ScreenRoute extends PageRouteBuilder {
  ScreenRoute({
    required Widget widget,
    required Duration transitionDuration,
    ScreenRouteDirections direction = ScreenRouteDirections.rightToLeft,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionDuration: transitionDuration,
          reverseTransitionDuration: transitionDuration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(
                begin: _getOffsetByDirection(direction), end: Offset.zero);

            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            );

            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: FadeTransition(
                opacity: curvedAnimation,
                child: child,
              ),
            );
          },
        );

  static Offset _getOffsetByDirection(
      ScreenRouteDirections direction) {
    switch (direction) {
      case ScreenRouteDirections.rightToLeft:
        return Offset(0.15, 0.0);
      case ScreenRouteDirections.bottomToTop:
        return Offset(0.0, 0.15);
    }
  }
}
