class Exhibit {

  Exhibit({this.title, this.images});

  String? title;
  List<String>? images;

  factory Exhibit.fromJson(Map<String, dynamic> json) => Exhibit(
    title: json['title'],
    images: List<String>.from(json["images"].map((x) => x.toString())),
  );
}