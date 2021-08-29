import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyAnimatedRotation extends ImplicitlyAnimatedWidget {

  const MyAnimatedRotation({
    Key? key,
    this.child,
    required this.degree,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
    this.alwaysIncludeSemantics = false,
  }) : assert(degree != null),
        super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  final Widget? child;

  final double degree;

  final bool alwaysIncludeSemantics;

  @override
  _MyAnimatedRotationState createState() => _MyAnimatedRotationState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('opacity', degree));
  }
}

class _MyAnimatedRotationState extends ImplicitlyAnimatedWidgetState<MyAnimatedRotation> {
  Tween<double?>? _degree;
  late Animation<double?> _degreeAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _degree = visitor(_degree, widget.degree, (dynamic value) => Tween<double>(begin: value as double?)) as Tween<double?>?;
  }

  @override
  void didUpdateTweens() {
    _degreeAnimation = animation.drive(_degree!);
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      child: widget.child,
      turns: _degreeAnimation as Animation<double>,
    );
  }
}