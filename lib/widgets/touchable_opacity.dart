import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_repo_projects/utils/utils.dart';

class TouchableOpacity extends HookWidget {
  final Widget child;
  final void Function()? onTap;
  const TouchableOpacity({Key? key, this.onTap, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDown = useState(false);
    return RepaintBoundary(
      child: GestureDetector(
        onTap: () {
          Utils.closeKeyboard(context);
          if (onTap != null) onTap!();
        },
        onTapDown: (_) => isDown.value = true,
        onTapUp: (_) => isDown.value = false,
        onTapCancel: () => isDown.value = false,
        child: AnimatedOpacity(
          child: child,
          duration: const Duration(milliseconds: 50),
          opacity: isDown.value ? 0.5 : 1,
        ),
      ),
    );
  }
}
