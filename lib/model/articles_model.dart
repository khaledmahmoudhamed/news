// class NewsModel {
//   List<Articles>? articles;
//
//   NewsModel({this.articles});
//
//   NewsModel.fromJson(Map<String, dynamic> json) {
//     if (json['articles'] != null) {
//       articles = <Articles>[];
//       json['articles'].forEach((v) {
//         articles!.add(new Articles.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.articles != null) {
//       data['articles'] = this.articles!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class Articles {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content});

  Map<String, dynamic> toMap() {
    return {
      'author': this.author,
      'title': this.title,
      'description': this.description,
      'url': this.url,
      'urlToImage': this.urlToImage,
      'publishedAt': this.publishedAt,
      'content': this.content,
    };
  }

   Articles.fromMap(Map<String, dynamic> map) {
      author= map['author'];
      title= map['title'];
      description= map['description'];
      url= map['url'] ;
      urlToImage= map['urlToImage'] ;
      publishedAt= map['publishedAt'];
      content= map['content'] ;

  }



  // Articles.fromJson({required Map<String, dynamic> json}) {
  //
  //   author = json['author'];
  //   title = json['title'];
  //   description = json['description'];
  //   url = json['url'];
  //   urlToImage = json['urlToImage'];
  //   publishedAt =json['publishedAt'];
  //   content = json['content'];
  //
  // }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  <String, dynamic>{};
//
//     data['author'] = author;
//     data['title'] = title;
//     data['description'] = description;
//     data['url'] = url;
//     data['urlToImage'] = urlToImage;
//     data['publishedAt'] = publishedAt;
//     data['content'] = content;
//     return data;
//   }

}

