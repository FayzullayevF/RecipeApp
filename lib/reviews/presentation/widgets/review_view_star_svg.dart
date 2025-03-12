import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewViewStarSvg extends StatelessWidget {
  const ReviewViewStarSvg({
    super.key,
    this.svg = Colors.white
  });

  final Color svg;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/icons/star.svg",
      colorFilter: ColorFilter.mode(
        svg,
        BlendMode.srcIn,
      ),
    );
  }
}
