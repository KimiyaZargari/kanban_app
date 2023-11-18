class ProjectEntity {
  int? id;

  String name;
  int todo, done, inProgress;

  ProjectEntity(
      {this.id,
      required this.name,
      required this.inProgress,
      required this.done,
      required this.todo});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectEntity && other.id == id && other.name == name;
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);
}
