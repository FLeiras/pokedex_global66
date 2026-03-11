import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgNavIcon extends StatelessWidget {
  final String path;
  final Color? color;
  final double? width;
  final double? height;

  const SvgNavIcon(
    this.path, {
    this.color,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width ?? 24,
      height: height ?? 24,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
