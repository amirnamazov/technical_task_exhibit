class Exhibit {

  Exhibit({
    required this.title,
    required this.images,
  });

  final String title;
  final List<String> images;

  factory Exhibit.fromJson(Map<String, dynamic> json) => Exhibit(
    title: json['title'],
    images: List<String>.from(json["images"].map((x) => x.toString())),
  );
}