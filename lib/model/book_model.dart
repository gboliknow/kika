import 'dart:convert';

import 'package:flutter/foundation.dart';

class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;
  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  ImageLinks copyWith({
    String? smallThumbnail,
    String? thumbnail,
  }) {
    return ImageLinks(
      smallThumbnail: smallThumbnail ?? this.smallThumbnail,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'smallThumbnail': smallThumbnail,
      'thumbnail': thumbnail,
    };
  }

  factory ImageLinks.fromMap(Map<String, dynamic> map) {
    return ImageLinks(
      smallThumbnail: map['smallThumbnail'],
      thumbnail: map['thumbnail'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageLinks.fromJson(String source) =>
      ImageLinks.fromMap(json.decode(source));

  @override
  String toString() =>
      'ImageLinks(smallThumbnail: $smallThumbnail, thumbnail: $thumbnail)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageLinks &&
        other.smallThumbnail == smallThumbnail &&
        other.thumbnail == thumbnail;
  }

  @override
  int get hashCode => smallThumbnail.hashCode ^ thumbnail.hashCode;
}

class BookModel with ChangeNotifier {
  String? title;
  String? subtitle;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  int? pageCount;
  int? averageRating;
  bool isFavorite;
  List<String>? categories;
  String? printType;
  ImageLinks? imageLinks;
  BookModel({
    this.title,
    this.isFavorite = false,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.averageRating,
    this.categories,
    this.printType,
    this.imageLinks,
  });
  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  BookModel copyWith({
    String? title,
    String? subtitle,
    List<String>? authors,
    String? publisher,
    String? publishedDate,
    String? description,
    int? pageCount,
    int? averageRating,
    List<String>? categories,
    String? printType,
    ImageLinks? imageLinks,
  }) {
    return BookModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      authors: authors ?? this.authors,
      publisher: publisher ?? this.publisher,
      publishedDate: publishedDate ?? this.publishedDate,
      description: description ?? this.description,
      pageCount: pageCount ?? this.pageCount,
      averageRating: averageRating ?? this.averageRating,
      categories: categories ?? this.categories,
      printType: printType ?? this.printType,
      imageLinks: imageLinks ?? this.imageLinks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'authors': authors,
      'publisher': publisher,
      'publishedDate': publishedDate,
      'description': description,
      'pageCount': pageCount,
      'averageRating': averageRating,
      'categories': categories,
      'printType': printType,
      'imageLinks': imageLinks?.toMap(),
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      title: map['title'] == null ? null : map['title'],
      subtitle: map['subtitle'] == null ? null : map['subtitle'],
      authors:
          map['authors'] == null ? null : List<String>.from(map['authors']),
      publisher: map['publisher'] == null ? null : map['publisher'],
      publishedDate: map['publishedDate'] == null ? null : map['publishedDate'],
      description: map['description'] == null ? null : map['description'],
      pageCount: map['pageCount'] == null ? null : map['pageCount']?.toInt(),
      averageRating:
          map['averageRating'] == null ? null : map['averageRating']?.toInt(),
      categories: map['categories'] == null
          ? null
          : List<String>.from(map['categories']),
      printType: map['printType'] == null ? null : map['printType'],
      imageLinks: map['imageLinks'] != null
          ? ImageLinks.fromMap(map['imageLinks'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookModel(title: $title, subtitle: $subtitle, authors: $authors, publisher: $publisher, publishedDate: $publishedDate, description: $description, pageCount: $pageCount, averageRating: $averageRating, categories: $categories, printType: $printType, imageLinks: $imageLinks)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookModel &&
        other.title == title &&
        other.subtitle == subtitle &&
        listEquals(other.authors, authors) &&
        other.publisher == publisher &&
        other.publishedDate == publishedDate &&
        other.description == description &&
        other.pageCount == pageCount &&
        other.averageRating == averageRating &&
        listEquals(other.categories, categories) &&
        other.printType == printType &&
        other.imageLinks == imageLinks;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        subtitle.hashCode ^
        authors.hashCode ^
        publisher.hashCode ^
        publishedDate.hashCode ^
        description.hashCode ^
        pageCount.hashCode ^
        averageRating.hashCode ^
        categories.hashCode ^
        printType.hashCode ^
        imageLinks.hashCode;
  }
}
