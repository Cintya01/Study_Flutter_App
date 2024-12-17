import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  addTask(String title) {
    _tasks.add(Task(title: title));
    notifyListeners();
  }

  updateStatus(int index) {
    _tasks[index].isComplete = !_tasks[index].isComplete;
    notifyListeners();
  }
}

class Task {
  String title;
  bool isComplete;

  Task({
    required this.title,
    this.isComplete = false,
  });
}

class TodoProvider extends StatelessWidget {
  const TodoProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("To Do Provider"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: taskProvider._tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  final task = taskProvider._tasks[index];
                  return ListTile(
                    title: Text(
                      task.title,
                      style: TextStyle(
                          decoration: task.isComplete
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    trailing: Checkbox(
                        value: task.isComplete,
                        onChanged: (value) => taskProvider.updateStatus(index)),
                  );
                },
              ),
            ),
            ToDoInputText(),
          ],
        ));
  }
}

class ToDoInputText extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  ToDoInputText({super.key});

  _addTask(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    if (_controller.text.isNotEmpty) {
      taskProvider.addTask(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: "Nueva tarea"),
        )),
        ElevatedButton(
            onPressed: () => _addTask(context), child: const Text("Agregar")),
      ],
    );
  }
}
