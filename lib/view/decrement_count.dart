import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/riverpod_as_solution/counter.dart';

class DecrementCount extends ConsumerWidget {
  const DecrementCount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Decrement Count"),
        toolbarHeight: 80,
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          return Text(
            ref.watch(incrementCountProvider).toString(),
            style: const TextStyle(
              fontSize: 50,
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(incrementCountProvider.notifier).state--;
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
