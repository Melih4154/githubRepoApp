import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_repo_projects/utils/assets.dart';

enum _ImageType { network, asset }

class CustomImage extends StatelessWidget {
  final String? image;
  final _ImageType type;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final ColorFilter? svgColor;
  final Widget? placeHolder;
  final Widget? errorWidget;
  final double? height;
  final double? width;
  final int? memCacheHeight;
  final int? memCacheWidth;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final Alignment alignment;
  final EdgeInsetsGeometry? margin;

  const CustomImage.asset(
    this.image, {
    Key? key,
    this.fit = BoxFit.contain,
    this.borderRadius,
    this.svgColor,
    this.placeHolder,
    this.errorWidget,
    this.height,
    this.width,
    this.border,
    this.boxShadow,
    this.memCacheHeight,
    this.memCacheWidth,
    this.alignment = Alignment.center,
    this.margin,
  })  : type = _ImageType.asset,
        super(key: key);

  const CustomImage.network(
    this.image, {
    Key? key,
    this.fit = BoxFit.contain,
    this.borderRadius,
    this.svgColor,
    this.placeHolder,
    this.errorWidget,
    this.height,
    this.width,
    this.border,
    this.boxShadow,
    this.memCacheHeight,
    this.memCacheWidth,
    this.alignment = Alignment.center,
    this.margin,
  })  : type = _ImageType.network,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSVG() => image!.endsWith('.svg');
    bool isNetwork() => type == _ImageType.network ? true : false;

    dynamic tempImage;

    if (isNetwork()) {
      if (isSVG()) {
        tempImage = SvgPicture.network(
          image!,
          width: width,
          height: height,
          fit: fit!,
          alignment: alignment,
        );
      } else {
        tempImage = CachedNetworkImage(
          imageUrl: image!,
          width: width,
          height: height,
          fit: fit,
          memCacheHeight: memCacheHeight,
          memCacheWidth: memCacheWidth,
          placeholder: (_, __) => Center(
            child: placeHolder ?? const CircularProgressIndicator(),
          ),
          errorWidget: (_, __, ___) =>
              errorWidget ?? Image.asset(R.images.logo),
        );
      }
    } else {
      if (isSVG()) {
        tempImage = SvgPicture.asset(
          image!,
          width: width,
          height: height,
          colorFilter: svgColor,
          fit: fit!,
          alignment: alignment,
        );
      } else {
        tempImage = Image.asset(
          image!,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
        );
      }
    }

    return Container(
      margin: margin ?? margin,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        border: border,
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: tempImage,
      ),
    );
  }
}
