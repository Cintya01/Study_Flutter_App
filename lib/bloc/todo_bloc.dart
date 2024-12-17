import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_primera_app/class/task.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState.initial()) {
    on<AddTaskEvent>((event, emit) {
      final newList = List<Task>.from(state.tasks);
      newList.add(Task(title: event.title));
      emit(state.copyWith(tasks: newList));
    });
  }
}
