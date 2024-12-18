import 'package:equatable/equatable.dart';
import 'package:mi_primera_app/adopt_app/animal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      await Future.delayed(const Duration(seconds: 4));
      throw Exception('BarException');
      emit(state.copyWith(screenState: AnimalScreenState.sucess));
    } catch (e) {
      emit(state.copyWith(screenState: AnimalScreenState.failure));
    }
  }

  void _onToggleFavorite(
      ToggleFavoriteAnimalEvent event, Emitter<AnimalState> emit) {}

  void _onChangeFilter(ChangeFilterEvent event, Emitter<AnimalState> emit) {}
}
