class Duaa{
  final int id;
  final String duaa;


  const Duaa({
    required this.id,
    required this.duaa,
  });


  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': duaa
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Duaa{id: $id, duaa: $duaa, }';
  }

}