import 'package:imversion/models/source_models.dart';

class Article {
  Source source;
  String? author;
  String title;
  String url;
  String urlToImage;
  String publishedAt;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json["source"]),
      author: json["author"] ?? "",
      title: json["title"] ??"",
      url: json["url"] ?? "",
      urlToImage: json["urlToImage"] ??"",
      publishedAt: json["publishedAt"] ??"",
    );
  }
}
