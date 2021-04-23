abstract class RepositoryParam {
  String queryString() => '';

  Map<String, dynamic> toMap();

  @override
  String toString() {
    return toMap().toString();
  }
}
