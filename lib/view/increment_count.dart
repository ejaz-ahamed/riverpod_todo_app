import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/riverpod_as_solution/counter.dart';
import 'package:state_management/view/decrement_count.dart';

class IncrementCount extends ConsumerWidget {
  const IncrementCount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Increment Count"),
        toolbarHeight: 80,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DecrementCount(),
                  ));
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
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
          ref.read(incrementCountProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
