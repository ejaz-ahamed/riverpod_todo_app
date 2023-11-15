import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/riverpod_as_solution/api_future_provider.dart';

class HomePageFutureProvider extends ConsumerWidget {
  const HomePageFutureProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API HomePage "),
      ),
      body: ref.watch(getPostProvider).when(
            data: (data) => ListView.separated(
              itemCount: data!.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(data[index].title),
                subtitle: Text(data[index].body),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
            ),
            error: (error, stackTrace) => const Center(
              child: Text("Something went wrong..Retry..!"),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
