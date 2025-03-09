class Plant {
  final String name;
  final String imageUrl;
  final List<Disease> diseases;

  Plant({required this.name, required this.imageUrl, required this.diseases});
}

class Disease {
  final String name;
  final String description;
  final List<String> pesticides;

  Disease({required this.name, required this.description, required this.pesticides});
}
