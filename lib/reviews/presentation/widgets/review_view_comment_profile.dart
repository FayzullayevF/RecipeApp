import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewViewCommentProfile extends StatelessWidget {
  const ReviewViewCommentProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 13,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image(
            image: AssetImage("assets/images/andrew-mar.png"),
            width: 35.w,
            height: 35.h,
          ),
        ),
        Text(
          "@Andrew-Mar",
          style: TextStyle(
              color: AppColors.nameColor,
              fontSize: 15,
              fontFamily: "Poppins",
              height: 1),
        ),
        SizedBox(
          width: 43,
        ),
        Text(
          "(15 Mins Ago)",
          style: TextStyle(
              color: AppColors.pinkSubColor,
              fontSize: 15,
              fontFamily: "Poppins",
              height: 1),
        ),
      ],
    );
  }
}
