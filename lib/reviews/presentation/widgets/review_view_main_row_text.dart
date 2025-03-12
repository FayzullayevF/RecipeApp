import 'package:chef_staff/core/presentations/recipe_eleveted_button.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/reviews/presentation/widgets/review_view_star_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewViewMainRowText extends StatelessWidget {
  const ReviewViewMainRowText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [
        Text(
          "Chicken Burger",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            fontFamily: "Poppins",
          ),
        ),
        Row(
          spacing: 3,
          children: [
            ReviewViewStarSvg(),
            ReviewViewStarSvg(),
            ReviewViewStarSvg(),
            ReviewViewStarSvg(),
            ReviewViewStarSvg(),
            Text(
              "(459 review)",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontSize: 11,
              ),
            )
          ],
        ),
        Row(
          spacing: 3,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(
                image: AssetImage("assets/images/andrew-mar.png"),
                width: 32.w,
                height: 33.h,
              ),
            ),
            Column(
              spacing: 3,
              children: [
                Text(
                  "@Andrew-Mar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: "Poppins",
                      height: 1),
                ),
                Text(
                  "Andrew Martinez-Chef",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      fontFamily: "League Spartan",
                      height: 1),
                )
              ],
            )
          ],
        ),
        RecipeElevatedButton(
          text: "Add Review",
          fontSize: 11,
          textColor: AppColors.nameColor,
          callback: () {},
          backgroundColor: Colors.white,
          size: Size(126.w, 24.h),
        )
      ],
    );
  }
}
