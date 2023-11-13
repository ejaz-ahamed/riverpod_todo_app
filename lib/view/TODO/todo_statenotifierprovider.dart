import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/model/todo_class.dart';
import 'package:state_management/riverpod_as_solution/todo_statenotifier.dart';

class TodoNotifierProvider extends ConsumerWidget {
  TodoNotifierProvider({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
      ),
      body: ListView.builder(
        itemCount: ref.watch(todoProvider).length,
        itemBuilder: (context, index) => ListTile(
          title: Text(ref.watch(todoProvider)[index].task),
          leading: Checkbox(
            value: ref.watch(todoProvider)[index].isChanged,
            onChanged: (value) {
              ref.read(todoProvider.notifier).updateTodo(
                  index,
                  Todo(
                      isChanged: value!,
                      task: ref.watch(todoProvider)[index].task));
            },
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Add your List"),
                        content: TextField(
                          controller: controller,
                          cursorColor: Colors.black,
                          showCursor: true,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            filled: true,
                            fillColor: Colors.blue,
                            hintText: 'Enter Your List Here...',
                            hintStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              ref.read(todoProvider.notifier).updateTodo(
                                  index,
                                  Todo(
                                      isChanged: false, task: controller.text));
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text("Edit"),
                          ),
                        ],
                      );
                    },
                  );
                  controller.text = ref.watch(todoProvider)[index].task;
                },
                child: const Icon(Icons.edit),
              ),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.read(todoProvider.notifier).delTask(index);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.black,
                  ),
                  child: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add your List"),
                content: TextField(
                  controller: controller,
                  cursorColor: Colors.black,
                  showCursor: true,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    filled: true,
                    fillColor: Colors.blue,
                    hintText: 'Enter Your List Here...',
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        ref.read(todoProvider.notifier).addTodo(
                            Todo(isChanged: false, task: controller.text));
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Add"))
                ],
              );
            },
          );
          controller.clear();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
