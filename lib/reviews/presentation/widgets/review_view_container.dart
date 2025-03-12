import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/reviews/presentation/widgets/review_view_main_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewViewContainer extends StatelessWidget {
  const ReviewViewContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(36, 30, 36, 30),
      width: 430.w,
      height: 223.h,
      decoration: BoxDecoration(
        color: AppColors.nameColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ReviewViewMainRow(),
    );
  }
}
