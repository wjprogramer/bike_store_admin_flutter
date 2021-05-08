import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyAnimatedSize extends ImplicitlyAnimatedWidget {

  const MyAnimatedSize({
    Key key,
    this.child,
    @required this.sizeFactor,
    Curve curve = Curves.linear,
    @required Duration duration,
    VoidCallback onEnd,
    this.alwaysIncludeSemantics = false,
  }) : assert(sizeFactor != null),
        super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  final Widget child;

  final double sizeFactor;

  final bool alwaysIncludeSemantics;

  @override
  _MyAnimatedRotationState createState() => _MyAnimatedRotationState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('opacity', sizeFactor));
  }
}

class _MyAnimatedRotationState extends ImplicitlyAnimatedWidgetState<MyAnimatedSize> {
  Tween<double> _degree;
  Animation<double> _degreeAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _degree = visitor(_degree, widget.sizeFactor, (dynamic value) => Tween<double>(begin: value as double)) as Tween<double>;
  }

  @override
  void didUpdateTweens() {
    _degreeAnimation = animation.drive(_degree);
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      child: widget.child,
      sizeFactor: _degreeAnimation,
    );
  }
}