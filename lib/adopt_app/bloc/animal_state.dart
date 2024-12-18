part of 'animal_bloc.dart';

enum AnimalScreenState { none, loading, sucess, failure }

class AnimalState extends Equatable {
  final List<AnimalModel> animals;
  final List<AnimalModel> favoriteAnimals;
  final AnimalScreenState screenState;
  final String filter;

  const AnimalState({
    required this.animals,
    required this.favoriteAnimals,
    required this.screenState,
    required this.filter,
  });

  factory AnimalState.initial() {
    return AnimalState(
      animals: List.empty(),
      favoriteAnimals: List.empty(),
      screenState: AnimalScreenState.none,
      filter: '',
    );
  }

  AnimalState copyWith({
    List<AnimalModel>? animals,
    List<AnimalModel>? favoriteAnimals,
    AnimalScreenState? screenState,
    String? filter,
  }) {
    return AnimalState(
      animals: animals ?? this.animals,
      favoriteAnimals: favoriteAnimals ?? this.favoriteAnimals,
      screenState: screenState ?? this.screenState,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object> get props => [animals, favoriteAnimals, screenState, filter];
}

// final class AnimalInitial extends AnimalState {}
