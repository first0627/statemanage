import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemange/layout/default_layout.dart';
import 'package:statemange/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    //state 가 bool이된다. isSpicy가 바뀔때만 봐라 이때는 build 재시작
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));

    //listen중 HasBought 누르면 print 출력됨 build 재시작 안함
    ref.listen(
      selectProvider.select((value) => value.hasBought),
      (previous, next) {
        print('next: $next');
      },
    );
    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.toString()),
            // Text(
            //   state.name,
            // ),
            // Text(
            //   state.hasBought.toString(),
            // ),
            // Text(
            //   state.isSpicy.toString(),
            // ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleIsSpicy();
              },
              child: const Text('Spicy Toggle'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleHasBought();
              },
              child: const Text('HasBought Toggle'),
            ),
          ],
        ),
      ),
    );
  }
}
