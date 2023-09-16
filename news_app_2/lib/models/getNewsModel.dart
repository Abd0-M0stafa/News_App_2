class GetNewsModel {
  final String? image;
  final String title;
  final String? subTitle;

  GetNewsModel(
      {required this.image, required this.title, required this.subTitle});

  factory GetNewsModel.fromJson(json) {
    return GetNewsModel(
        image: json["urlToImage"],
        title: json["title"],
        subTitle: json["description"]);
  }
}
