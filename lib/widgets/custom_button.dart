import 'package:flutter/material.dart';
import 'package:github_repo_projects/utils/extensions.dart';
import 'package:github_repo_projects/utils/styles.dart';
import 'package:github_repo_projects/widgets/touchable_opacity.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.title,
    this.bgColor,
    this.borderColor,
    this.radius,
    this.borderWidth,
    required this.onTap,
    this.style,
    this.height,
    this.width,
    this.padding,
  });

  final String? title;
  final Color? bgColor;
  final Color? borderColor;
  final double? radius;
  final double? borderWidth;
  final void Function()? onTap;
  final TextStyle? style;
  final double? height;
  final double? width;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 30.h,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius ?? 5),
          border: Border.all(
            color: borderColor ?? S.colors.transparent,
            width: borderWidth ?? 0,
          ),
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(5),
          child: Text(
            title!,
            style: style,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
