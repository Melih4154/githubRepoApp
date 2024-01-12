// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:github_repo_projects/providers/state_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'loading_widget.dart';

class LoadingOverlay extends HookConsumerWidget {
  final Widget child;
  final Widget? loadingWidget;
  final List? list;
  const LoadingOverlay(
      {Key? key, required this.child, this.loadingWidget, this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isBusy = ref.watch(loadingProvider);
    if (list == null) {
      if (!isBusy) return child;
    }
    if (list != null) if (list!.isNotEmpty || !isBusy) return child;
    return Stack(
      children: [
        child,
        const Opacity(
          child: ModalBarrier(dismissible: false, color: Colors.black),
          opacity: 0.5,
        ),
        Center(child: loadingWidget ?? const LoadingWidget()),
      ],
    );
  }
}
