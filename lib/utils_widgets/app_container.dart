import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    this.border,
    this.color,
    this.borderRadius,
    this.image,
    this.boxShadow,
    this.child,
    this.height,
    this.width,
    this.padding,
    this.shape = BoxShape.rectangle,
    this.alignment,
    this.margin,
    this.duration = Duration.zero,
    this.gradient,
  });
  final Color? color;
  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final ImageProvider<Object>? image;
  final Border? border;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;
  final Alignment? alignment;
  final BoxShape shape;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: height,
      width: width,
      margin: margin,
      alignment: alignment,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        border: border,
        image:
            image == null
                ? null
                : DecorationImage(image: image!, fit: BoxFit.cover),
        shape: shape,
        boxShadow: boxShadow,
        borderRadius: borderRadius,
      ),
      duration: duration,
      child: child,
    );
  }
}
