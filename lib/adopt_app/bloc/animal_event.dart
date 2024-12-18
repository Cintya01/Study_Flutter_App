part of 'animal_bloc.dart';

sealed class AnimalEvent extends Equatable {
  const AnimalEvent();

  @override
  List<Object> get props => [];
}

class LoadAnimalEvent extends AnimalEvent {
}

class ToggleFavoriteAnimalEvent extends AnimalEvent {
  final String animalId;

  const ToggleFavoriteAnimalEvent(this.animalId);
}

class ChangeFilterEvent extends AnimalEvent {
  final String filter;

  const ChangeFilterEvent(this.filter);
}
