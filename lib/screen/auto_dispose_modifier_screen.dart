import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemange/layout/default_layout.dart';
import 'package:statemange/riverpod/auto_dispose_modifier_provider.dart';

class AutoDisposedModifierScreen extends ConsumerWidget {
  const AutoDisposedModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoDisposeModifierProvider);

    return DefaultLayout(
      title: 'AutoDisposeModifierScreen',
      body: Center(
        child: state.when(
          data: (data) => (Text(data.toString())),
          error: (err, stack) => Text(err.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
