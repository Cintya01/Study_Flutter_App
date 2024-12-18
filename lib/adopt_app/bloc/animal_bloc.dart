import 'package:equatable/equatable.dart';
import 'package:mi_primera_app/adopt_app/animal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_primera_app/adopt_app/data.dart';

part 'animal_event.dart';
part 'animal_state.dart';

class AnimalBloc extends Bloc<AnimalEvent, AnimalState> {
  AnimalBloc() : super(AnimalState.initial()) {
    on<LoadAnimalEvent>(_onLoadAnimals);
    on<ToggleFavoriteAnimalEvent>(_onToggleFavorite);
    on<ChangeFilterEvent>(_onChangeFilter);
  }

  void _onLoadAnimals(LoadAnimalEvent event, Emitter<AnimalState> emit) async {
    emit(state.copyWith(screenState: AnimalScreenState.loading));
    //logica
    try {
      await Future.delayed(const Duration(seconds: 3));
      // throw Exception('BarException');
      final animals = animalData.map(
        (json) {
          return AnimalModel(
            id: json['id'],
            name: json['name'],
            breed: json['breed'],
            age: json['age'],
            imageUrl: json['imageUrl'],
            species: json['species'],
          );
        },
      ).toList();
      emit(state.copyWith(
          animals: animals, screenState: AnimalScreenState.sucess));
    } catch (e) {
      emit(state.copyWith(screenState: AnimalScreenState.failure));
    }
  }

  void _onToggleFavorite(
      ToggleFavoriteAnimalEvent event, Emitter<AnimalState> emit) {
    final animals = state.animals.map((animal) {
      if (animal.id == event.animalId) {
        return animal.copyWith(isFavorite: !animal.isFavorite);
      }
      return animal;
    }).toList();
    emit(state.copyWith(animals: animals));
  }

  void _onChangeFilter(ChangeFilterEvent event, Emitter<AnimalState> emit) {}
}
