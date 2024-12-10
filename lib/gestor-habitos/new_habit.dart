import 'package:flutter/material.dart';

class NewHabit extends StatefulWidget {
  final Function(String, String) submitHabit;

  const NewHabit({super.key, required this.submitHabit});

  @override
  State<NewHabit> createState() => _NewHabitState();
}

class _NewHabitState extends State<NewHabit> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void submitData() {
    final name = _nameController.text;
    final description = _descriptionController.text;

    if (name.isNotEmpty && description.isNotEmpty) {
      widget.submitHabit(name, description);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nuevo hábito"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Nombre del hábito",
                  ),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: "Descripción del hábito",
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: submitData,
                  child: const Text("Agregar"),
                ),
              ],
            )));
  }
}
