class Band {
  
  String id;
  String name;
  int votes;

  Band({this.id, this.name, this.votes});

  factory Band.fromMap(Map<String, dynamic> obj) => Band(
        id: obj['id'],
        name: obj['name'],
        votes: obj['votes'],
      );
}
