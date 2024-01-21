import 'package:flutter_riverpod/flutter_riverpod.dart';

//provider를 생성을 할때 생성하는 순간에 변수를 입력해줘서 변수로 provider안의 로직을 변경을 해야 할때 쓴다.
final familyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(const Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
});
