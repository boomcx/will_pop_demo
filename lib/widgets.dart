import 'dart:io';

import 'package:flutter/material.dart';

// Practical use
class PopScopeFuncAppBar<T> extends StatelessWidget
    implements PreferredSizeWidget {
  const PopScopeFuncAppBar({super.key, required this.title, this.onPopInvoked});

  final String title;

  /// Returns true to pop, false to keep on screen
  final Future<void> Function(bool didPop, T? result)? onPopInvoked;

  @override
  Widget build(BuildContext context) {
    final appBar = PopScope(
      canPop: onPopInvoked == null,
      onPopInvokedWithResult: (didPop, T? result) async {
        print('  `onPopInvokedWithResult` didPop: $didPop, result: $result');
        if (didPop) return;
        await onPopInvoked?.call(didPop, result);
      },
      child: AppBar(title: Text(title)),
    );

    if (Platform.isIOS) {}

    return appBar;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
}

/// Test use
class PopScopeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PopScopeAppBar({
    super.key,
    required this.title,
    this.canPop = false,
    this.onPopInvokedWithResult,
  });

  final String title;
  final bool canPop;
  final PopInvokedWithResultCallback? onPopInvokedWithResult;

  @override
  Widget build(BuildContext context) {
    final appbar = PopScope(
      canPop: canPop,
      onPopInvokedWithResult: onPopInvokedWithResult,
      child: AppBar(title: Text(title)),
    );

    // if (canPop) {
    //   return AppBar(title: Text(title));
    // }

    if (Platform.isIOS) {}

    return appbar;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
}
