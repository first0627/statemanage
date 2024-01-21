import 'package:flutter/material.dart';
import 'package:statemange/screen/auto_dispose_modifier_screen.dart';
import 'package:statemange/screen/code_generation_screen.dart';
import 'package:statemange/screen/future_provider_screen.dart';
import 'package:statemange/screen/listen_provider_screen.dart';
import 'package:statemange/screen/provider_screen.dart';
import 'package:statemange/screen/select_provider_screen.dart';
import 'package:statemange/screen/state_notifier_provider_screen.dart';
import 'package:statemange/screen/state_provider_screen.dart';
import 'package:statemange/screen/stream_provider_screen.dart';

import '../layout/default_layout.dart';
import 'family_modifier_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'HomeScreen',
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StateProviderScreen(),
                ),
              );
            },
            child: const Text('StateProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StateNotifierProviderScreen(),
                ),
              );
            },
            child: const Text('StateNotifierProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const FutureProviderScreen(),
                ),
              );
            },
            child: const Text('FutureProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StreamProviderScreen(),
                ),
              );
            },
            child: const Text('StreamProviderScreen'),
          ),
          /**/
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const FamilyModifierScreen(),
                ),
              );
            },
            child: const Text('FamilyModifierScreen'),
          ),
          /**/
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AutoDisposedModifierScreen(),
                ),
              );
            },
            child: const Text('AutoDisposedModifierScreen'),
          ),
          /**/
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ListenProviderScreen(),
                ),
              );
            },
            child: const Text('ListenProviderScreen'),
          ),
          /**/
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SelectProviderScreen(),
                ),
              );
            },
            child: const Text('SelectProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ProviderScreen(),
                ),
              );
            },
            child: const Text('ProviderScreen'),
          ),
          /**/
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CodeGenerationScreen(),
                ),
              );
            },
            child: const Text('CodeGenerationScreen'),
          ), /**/
        ],
      ),
    );
  }
}
