import 'package:api_test1/model/articles_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget sports(Articles articles){
  return Card(
    child: ListTile(
      title: Text(
        "${articles.title}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: Text("${articles.publishedAt}"),
      leading: CachedNetworkImage(
        imageUrl: "${articles.urlToImage}",
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) =>
        const Image(image: AssetImage('assets/sports.png')),
      ),
      //trailing: Text("${articles.author}"),
    ),
  );
}