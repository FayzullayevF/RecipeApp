import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view_model.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChefStuffCategoryItem extends StatelessWidget {
  const ChefStuffCategoryItem({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.rating,
    required this.time,
  });

  final String title, desc, image;
  final num rating, time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
                width: 159.5 * AppSizes.wRatio,
                height: 76 * AppSizes.hRatio,
                decoration: BoxDecoration(
                  color: AppColors.whiteBeige,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                ),
                child: Column(
                  spacing: 2,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      desc,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            color: AppColors.pinkSubColor,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        SvgPicture.asset('assets/icons/star.svg'),
                        SizedBox(
                          width: 20,
                        ),
                        SvgPicture.asset('assets/icons/clock.svg'),
                        Text(
                          "$time min",
                          style: TextStyle(
                            color: AppColors.pinkSubColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Image.network(
              image,
              fit: BoxFit.cover,
            ),
            Container(
              width: 28 * AppSizes.wRatio,
              height: 28 * AppSizes.hRatio,
              decoration: BoxDecoration(
                color: AppColors.nameColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: SvgPicture.asset('assets/icons/heart.svg'),
              ),
            )
          ],
        )
      ],
    );
  }
}
