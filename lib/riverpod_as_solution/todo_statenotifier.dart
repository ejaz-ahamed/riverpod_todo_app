import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/model/todo_class.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(Todo task) {
    state = [
      ...state,
      task,
    ];
  }

  void delTask(int index) {
    state = [
      for (Todo task in state)
        if (task != state[index]) task
    ];
  }

  void updateTodo(int index, Todo updatedTask) {
    state = [
      for (Todo task in state)
        if (task != state[index]) task else updatedTask
    ];
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier();
});
