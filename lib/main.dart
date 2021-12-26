import 'dart:async';

import 'package:fimber/fimber.dart';
import 'package:flapp/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  // Fimber
  if (!kReleaseMode) {
    Fimber.plantTree(DebugTree());
  } else {
    debugPrint = (message, {wrapWidth}) {};
  }

  runZonedGuarded(
    () => runApp(const ProviderScope(child: MyApp())),
    (error, stackTrace) {
      Fimber.e(error.toString());
    },
  );
}
