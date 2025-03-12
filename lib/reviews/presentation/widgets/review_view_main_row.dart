import 'package:chef_staff/reviews/presentation/widgets/review_view_main_image.dart';
import 'package:chef_staff/reviews/presentation/widgets/review_view_main_row_text.dart';
import 'package:flutter/material.dart';

class ReviewViewMainRow extends StatelessWidget {
  const ReviewViewMainRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ReviewViewMainImage(),
        SizedBox(
          width: 10,
        ),
        ReviewViewMainRowText()
      ],
    );
  }
}
