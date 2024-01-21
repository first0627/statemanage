import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  //업데이트 되었을떄 무조건 불림
  //ProviderContainer 는 flutter사용할때 신경 안써도 됨
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    print(
        '[Provider Updated] provider: $provider / pv : $previousValue/ nv : $newValue');
  }

  //프로바이더를 추가하면 불리는 함수
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    print('[Provider Added] provider: $provider / value : $value');
  }

  //Disposed되면 불림
  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    print('[Provider Disposed] provider: $provider');
  }
}
