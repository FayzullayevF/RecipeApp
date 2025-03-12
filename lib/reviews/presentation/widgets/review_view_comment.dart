import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';

class ReviewViewComment extends StatelessWidget {
  const ReviewViewComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 36, right: 36),
      child: Text(
        "Comments",
        style: TextStyle(
          color: AppColors.nameColor,
          fontSize: 15,
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}
