class Episodios {
  final int id;
  final String name;
  final String airDate;
  final String episode;

  Episodios({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
  });

  factory Episodios.fromJson(Map<String, dynamic> json) {
    return Episodios(
      id: json['id'],
      name: json['name'],
      airDate: json['air_date'],
      episode: json['episode'],
    );
  }
}
