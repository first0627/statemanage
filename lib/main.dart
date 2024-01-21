import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemange/riverpod/provider_observer.dart';
import 'package:statemange/screen/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        Logger(),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}

void log(String name, dynamic value) {
  debugPrint('$name = $value');

  // 1. 1초 후에 실행
  SchedulerBinding.instance.addPostFrameCallback((_) {
    // 2. 1초 후에 실행되는 코드
    debugPrint('$name = $value');
  });

  //3. 1에서 100까지 숫자중 하나를 랜덤으로 출력
  debugPrint('${Random().nextInt(100)}');
}
