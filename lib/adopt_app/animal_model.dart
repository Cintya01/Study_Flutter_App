class AnimalModel {
  final String id;
  final String name;
  final String breed;
  final int age;
  final String imageUrl;
  final String species;
  final bool isFavorite;

  const AnimalModel({
    required this.id,
    required this.name,
    required this.breed,
    required this.age,
    required this.imageUrl,
    required this.species,
    this.isFavorite = false,
  });

  AnimalModel copyWith({bool? isFavorite}) {
    return AnimalModel(
      id: id,
      name: name,
      breed: breed,
      age: age,
      imageUrl: imageUrl,
      species: species,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
