import 'package:chef_staff/core/presentations/bottom_navigation_bar.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/reviews/presentation/widgets/review_view_comment.dart';
import 'package:chef_staff/reviews/presentation/widgets/review_view_main_column.dart';
import 'package:chef_staff/reviews/presentation/widgets/review_view_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 36),
          child: SvgPicture.asset("assets/icons/back-arrow.svg"),
        ),
        title: Text(
          "Review",
          style: TextStyle(
            color: AppColors.nameColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
          ),
        ),
      ),
      body: ListView(
        children: [
          ReviewViewContainer(),
          SizedBox(
            height: 28.h,
          ),
          ReviewViewComment(),
          SizedBox(
            height: 24,
          ),
          ReviewViewMainColumn()
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
