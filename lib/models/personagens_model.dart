class Personagens {
  final int id;
  final String name;
  final String status;
  final String species;
  final String image;

  Personagens({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
  });

  factory Personagens.fromJson(Map<String, dynamic> json) {
    return Personagens(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      image: json['image'],
    );
  }
}
