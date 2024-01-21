import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemange/layout/default_layout.dart';
import 'package:statemange/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');

    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      num1: 10,
      num2: 20,
    ));

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('State1 : $state1'),
          state2.when(
            data: (data) {
              return Text(
                'State2 : $data',
                textAlign: TextAlign.center,
              );
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          state3.when(
            data: (data) {
              return Text(
                'State3 : $data',
                textAlign: TextAlign.center,
              );
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Text('State4 : $state4'),
          //이렇게 해서 랜더링이 필요한 위젯만 부분적으로 가능
          Consumer(
            builder: (context, ref, child) {
              print('builder build');
              final state5 = ref.watch(gStateNotifierProvider);
              return Row(
                children: [
                  Text('State5: $state5'),
                  if (child != null) child,
                ],
              );
            },
            //렌더링 하기에 퍼포먼스가 많이 필요하거나 싫은 위젯을 여기에
            child: const Text('hello'),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: const Text('Increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: const Text('Decrement'),
              ),
            ],
          ),
          //invalidate()
          //유효하지 않게 하다
          ElevatedButton(
            onPressed: () {
              ref.invalidate(gStateNotifierProvider);
            },
            child: const Text('Invalidate'),
          ),
        ],
      ),
    );
  }
}

class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5 = ref.watch(gStateNotifierProvider);
    return Text('State5 : $state5');
  }
}
