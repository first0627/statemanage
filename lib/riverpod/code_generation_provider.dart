import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

//1)  어떤 Provider를 사용할지 결정할 고민 할 필요 없도록
// (ex Provider, FutureProvider, StreamProvider 등등 고민하지마~)
// StateNotifierProvider는 명시적으로 가능

final _testProvider = Provider<String>((ref) => 'Hello Code Generation');

@riverpod
String gState(GStateRef ref) {
  return 'Hello Code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(const Duration(seconds: 3));

  return 10;
}

@Riverpod(
  keepAlive: true,
  //반대는 Autodispose
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(const Duration(seconds: 3));

  return 10;
}

//2)  Parameter 즉 rivierpod에선 Family
//파라미터를 일반 함수처럼 사용할 수 있도록

class Parameter {
  final int num1;
  final int num2;

  Parameter({
    required this.num1,
    required this.num2,
  });
}

final _testFamilyProvider = Provider.family<int, Parameter>(
  (ref, parameter) => parameter.num1 * parameter.num2,
);

@riverpod
int gStateMultiply(
  GStateMultiplyRef ref, {
  required int num1,
  required int num2,
}) {
  return num1 * num2;
}

@riverpod
class GStateNotifier extends _$GStateNotifier {
  //초기값 지정
  @override
  int build() {
    return 0;
  }

  increment() {
    state++;
  }

  decrement() {
    state--;
  }
}
