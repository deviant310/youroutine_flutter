import 'package:flutter/material.dart';

enum AnimatedPageRouteBuilderDirections { rightToLeft, bottomToTop }

class AnimatedPageRouteBuilder extends PageRouteBuilder {
  AnimatedPageRouteBuilder({
    required Widget widget,
    required Duration transitionDuration,
    AnimatedPageRouteBuilderDirections direction =
        AnimatedPageRouteBuilderDirections.rightToLeft,
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

  static Offset _getOffsetByDirection(AnimatedPageRouteBuilderDirections direction) {
    switch (direction) {
      case AnimatedPageRouteBuilderDirections.rightToLeft:
        return Offset(0.15, 0.0);
      case AnimatedPageRouteBuilderDirections.bottomToTop:
        return Offset(0.0, 0.15);
    }
  }
}
