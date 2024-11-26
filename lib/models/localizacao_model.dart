class Localizacao {
  final int id;
  final String name;
  final String type;

  Localizacao({
    required this.id,
    required this.name,
    required this.type,
  });

  factory Localizacao.fromJson(Map<String, dynamic> json) {
    return Localizacao(
      id: json['id'],
      name: json['name'],
      type: json['type'],
    );
  }
}
