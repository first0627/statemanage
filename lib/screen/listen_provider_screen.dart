import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemange/layout/default_layout.dart';
import 'package:statemange/riverpod/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

//watch는 값의 변경을 감지하여 위젯을 다시 빌드하는 데 사용되며, listen은 다시 빌드하지 않고 값의 변경을 감지하여 부수적인 효과를 만들기 위해 사용됩니다.
class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    //build함수안에서 써도 중복안되게 쓸수있게된다. dispose필요 없음
    ref.listen<int>(listenProvider, (previous, next) {
      if (previous != next) {
        controller.animateTo(
          next,
        );
      }
    });

    return DefaultLayout(
      title: 'ListenProviderScreen',
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(index.toString()),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(listenProvider.notifier)
                      .update((state) => state == 10 ? 10 : state + 1);
                },
                child: const Text('다음'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(listenProvider.notifier)
                      .update((state) => state == 0 ? 0 : state - 1);
                },
                child: const Text('뒤로'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
