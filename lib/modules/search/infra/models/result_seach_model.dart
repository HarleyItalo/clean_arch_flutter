import 'dart:convert';

import 'package:clean_arch/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final name;
  final String img;
  final title;

  ResultSearchModel({this.name, this.img, this.title});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'img': img,
      'title': title,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultSearchModel(
      name: map['id'].toString(),
      img: map['avatar_url'].toString(),
      title: map['login'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
