import 'package:flutter/material.dart';
import 'package:github_repo_projects/utils/styles.dart';
import 'package:github_repo_projects/widgets/touchable_opacity.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CardWidget extends StatelessWidget {
  final String label;
  final void Function() onTap;
  final IconData? icon;
  const CardWidget({
    Key? key,
    required this.label,
    required this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 6.0,
          horizontal: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: S.colors.textDarkBlue,
              ),
            ),
            Icon(
              icon ?? MdiIcons.chevronRight,
              color: S.colors.textBlue,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}
