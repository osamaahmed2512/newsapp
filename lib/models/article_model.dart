class ArticleModel {
  final String? image;
  final String title;
  final String? subtite;
  final String url;

  ArticleModel(
      {required this.url,
      required this.image,
      required this.title,
      required this.subtite});

  factory ArticleModel.fromjson(json) {
    return ArticleModel(
          url:json["url"] ,
          image: json["urlToImage"],
          title: json["title"],
          subtite: json["description"], 
        );
  }
}
