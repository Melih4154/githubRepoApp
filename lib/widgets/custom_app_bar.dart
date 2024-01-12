import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_repo_projects/utils/constants.dart';
import 'package:github_repo_projects/utils/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.bottom = const SizedBox(),
    this.bottomHeight = 0,
    this.actions,
    this.elevation = 0.0,
    this.onBack,
    this.showBackButton = true,
    this.isBgColor = false,
    this.title,
    this.leading,
  }) : super(key: key);
  final bool isBgColor;
  final Widget bottom;
  final double bottomHeight;
  final List<Widget>? actions;
  final double? elevation;
  final void Function()? onBack;
  final bool showBackButton;
  final String? title;
  final IconData? leading;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AppBar(
        key: UniqueKey(),
        elevation: elevation,
        backgroundColor:
            isBgColor ? S.colors.transparent : S.colors.appbarColor,
        leading: showBackButton
            ? Center(
                child: IconButton(
                  onPressed: onBack ?? Get.back,
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: S.colors.white,
                    size: 24,
                  ),
                ),
              )
            : Center(
                child: IconButton(onPressed: () {}, icon: Icon(leading)),
              ),
        title: title != null
            ? Text(
                title!,
                style: TextStyle(
                  color: S.colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            : Text(
                C.title,
                style: TextStyle(
                  color: S.colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(bottomHeight),
          child: bottom,
        ),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + bottomHeight);
}
