import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/reviews/presentation/widgets/review_view_comment_profile.dart';
import 'package:flutter/material.dart';

import 'review_view_star_svg.dart';

class ReviewViewMainColumn extends StatelessWidget {
  const ReviewViewMainColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 36, right: 36),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewViewCommentProfile(),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
            "Praesent fringilla eleifend purus vel dignissim. Praesent urna ante, iaculis at lobortis eu.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w300,
              fontFamily: "Poppins",
            ),
          ),
          Row(
            spacing: 3,
            children: [
              ReviewViewStarSvg(
                svg: AppColors.nameColor,
              ),
              ReviewViewStarSvg(
                svg: AppColors.nameColor,
              ),
              ReviewViewStarSvg(
                svg: AppColors.nameColor,
              ),
              ReviewViewStarSvg(
                svg: AppColors.nameColor,
              ),
              ReviewViewStarSvg(),
            ],
          ),
          Divider(
            color: AppColors.pinkSubColor,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
