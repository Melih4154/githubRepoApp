import 'package:flutter/material.dart';

class S {
  static final colors = _Colors();
  static final textStyles = _TextStyles();
}

class _Colors {
  final transparent = Colors.transparent;
  final appbarColor = Colors.green.shade700;
  final backgroundColor = Colors.grey.shade50;
  final orange = Colors.orange.shade800;
  final goldenColor = const Color(0xFFFED500);

  final white = Colors.white;

  final black = Colors.black;
  final black87 = Colors.black87;
  final grey = Colors.grey;
  final grey800 = Colors.grey[800];

  final yellow = const Color(0xffFED500);
  final yellowButton = const Color(0xFFf6ce00);
  final blue = const Color(0xff006AD8);
  final darkBlue = const Color(0xff6C99C6);
  final textBlue = const Color(0xff025FBF);
  final textDarkBlue = const Color(0xff024992);
  final darkGrey = const Color(0xff404040);
  final lightGrey = const Color(0xFFefeffb);
  final bg = const Color(0xffF5F8FC);
  final shadow = const Color(0xff000000).withAlpha(32);
  final green = const Color(0xff5DEC69);
  final greenButton = const Color(0xFF5dec69);
  final red = const Color(0xffFE4F4E);
  final secondaryColor = const Color(0xff025fbf);

  final drawerTextColor = const Color(0xff404040);

  final redGradient = const [
    Color(0xffFE4F4E),
    Color(0xffFF8988),
  ];
  final greenGradient = const [
    Color(0xff15D05A),
    Color(0xff80FBAD),
  ];
  final blueGradient = const [
    Color(0xff2179CB),
    Color(0xff87C4FC),
  ];
}

class _TextStyles {
  final authPageTitle = TextStyle(
    color: S.colors.orange, //Colors.grey.shade700,
    fontWeight: FontWeight.w600,
    fontSize: 13,
  );

  final title = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: S.colors.orange,
  );

  final authText = TextStyle(
    color: S.colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 19,
  );

  final cardText = TextStyle(
    color: S.colors.grey800,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
}
