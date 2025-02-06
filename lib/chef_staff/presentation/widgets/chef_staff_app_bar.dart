import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view_model.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChefStaffAppBarBody extends StatelessWidget
    implements PreferredSizeWidget {
  const ChefStaffAppBarBody({super.key, required this.vm});

  @override
  Size get preferredSize => const Size(double.infinity, 190);

  final ChefStaffViewModel vm;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.mainBackgroundColor,
        leadingWidth: 102 * AppSizes.wRatio,
        toolbarHeight: 102 * AppSizes.hRatio,
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(51),
            child: Image.network(
              vm.model!.profilePhoto,
              fit: BoxFit.cover,
            )),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            Text(
              vm.model!.fullName,
              style: TextStyle(
                color: AppColors.nameColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "@${vm.model!.username}",
              style: TextStyle(
                color: AppColors.nameColor,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              vm.model!.bio,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
        actions: [
          Row(
            spacing: 5,
            children: [
              Container(
                width: 28 * AppSizes.wRatio,
                height: 28 * AppSizes.hRatio,
                decoration: BoxDecoration(
                  color: AppColors.actionContainerColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SvgPicture.asset('assets/icons/plus.svg'),
                ),
              ),
              Container(
                width: 28 * AppSizes.wRatio,
                height: 28 * AppSizes.hRatio,
                decoration: BoxDecoration(
                  color: AppColors.actionContainerColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SvgPicture.asset('assets/icons/categories.svg'),
                ),
              )
            ],
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 10),
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 37, right: 37),
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      ShareContainer(text: "Edit Profile"),
                      ShareContainer(text: "Share Profile"),
                    ],
                  ),
                  FollowingFollowers(),

                  // TabBar(tabs: [
                  //   Text("!"),
                  //
                  // ])
                ],
              ),
            ),
          ),
        ));
  }
}

class ShareContainer extends StatelessWidget {
  const ShareContainer({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 172 * AppSizes.wRatio,
      height: 27 * AppSizes.hRatio,
      decoration: BoxDecoration(
        color: AppColors.actionContainerColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.pinkSubColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class FollowingFollowers extends StatelessWidget {
  const FollowingFollowers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 356,
      height: 49.57,
      decoration: BoxDecoration(
        color: AppColors.mainBackgroundColor,
        border: Border.all(
          color: AppColors.actionContainerColor,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }
}
