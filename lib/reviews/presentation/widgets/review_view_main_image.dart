import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewViewMainImage extends StatelessWidget {
  const ReviewViewMainImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14.34),
      child: Image(
        image: AssetImage("assets/images/review.png"),
        width: 162.w,
        height: 163.h,
      ),
    );
  }
}
