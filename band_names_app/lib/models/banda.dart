class Banda {
  String id;
  String name;
  int votes;

  Banda({required this.id, required this.name, required this.votes});

  factory Banda.fromMap(Map<String, dynamic> obj) {
    return Banda(id: obj['id'], name: obj['name'], votes: obj['votes']);
  }
}
