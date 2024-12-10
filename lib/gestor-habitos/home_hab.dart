import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mi_primera_app/gestor-habitos/new_habit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HabitosHomePage extends StatefulWidget {
  const HabitosHomePage({super.key});

  @override
  State<HabitosHomePage> createState() => _HabitosHomePageState();
}

class _HabitosHomePageState extends State<HabitosHomePage> {
  final List<Habit> habits = [];
  late final SharedPreferences prefs;
    String? action;

  @override
  void initState() {
    super.initState();
    initShared();
  }

  initShared() async {
    prefs = await SharedPreferences.getInstance();
    getData();
  }

  saveData() async {
    await prefs.setString('test', 'Test 2');
    getData();
  }

  getData() {
    setState(() {
      action = prefs.getString('test') ?? "Sin data";
    });
    log(action!);
  }

  void _addHabit(String name, String description) {
    setState(() {
      habits.add(Habit(name: name, description: description));
    });
  }

  void changeStatus(int index) {
    setState(() {
      habits[index].isComplete = !habits[index].isComplete;
    });
  }

  // Escritura de datos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Gestor de hábitos"),
        ),
        body: ListView.builder(
          itemCount: habits.length,
          itemBuilder: (context, index) {
            String name = habits[index].name;
            String description = habits[index].description;
            bool isComplete = habits[index].isComplete;

            return ListTile(
              onTap: () {
                changeStatus(index);
              },
              title: Text(name),
              subtitle: Text(description),
              trailing: isComplete
                  ? const Icon(Icons.check_box)
                  : const Icon(Icons.check_box_outline_blank),
            );
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "btn1",
              onPressed: () {
                saveData();
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            NewHabit(submitHabit: _addHabit)));
              },
              child: const Icon(Icons.add),
            ),
          ],
        ));
  }
}

class Habit {
  String name;
  String description;
  bool isComplete;

  Habit(
      {required this.name, required this.description, this.isComplete = false});

  @override
  String toString() {
    return "name: $name, description: $description, isComplete: $isComplete";
  }
}
