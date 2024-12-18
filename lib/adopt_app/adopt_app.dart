import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_primera_app/adopt_app/bloc/animal_bloc.dart';
import 'package:mi_primera_app/adopt_app/widgets/adopt_appbar.dart';
import 'package:mi_primera_app/adopt_app/widgets/adopt_filter.dart';
import 'package:mi_primera_app/adopt_app/widgets/adopt_list.dart';

class AdoptAppPage extends StatelessWidget {
  const AdoptAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimalBloc(),
      child: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDBE8DF),
      body: const Column(
        children: [
          AdoptAppBarWidget(),
          AdoptFilterWidget(),
          AdoptListWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AnimalBloc>().add(LoadAnimalEvent());
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: "Favoritos",
          ),
        ],
      ),
    );
  }
}


// fondo: ddece3
//verde oscuro:8fd2c1
//orange: ff5a06
//cafe letra: 42301c
//subtitulo: b5bdb0