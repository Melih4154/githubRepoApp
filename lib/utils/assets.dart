class R {
  static final images = _Images();
}

class _Images {
  static const path = 'assets/images';
  final logo = '$path/logo.png';

  final success = '$path/success.webp';
  final fail = '$path/fail.webp';
  final warning = '$path/warning.webp';
  final errorPage = '$path/error_page.webp';
}

final cacheImageList = [
  R.images.logo,
  R.images.success,
  R.images.fail,
  R.images.warning,
  R.images.errorPage,
];
