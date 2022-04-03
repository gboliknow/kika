import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kika/core/http/http_repos.dart';
import 'package:kika/model/book_model.dart';

class SearchProvider extends ChangeNotifier {
  List<BookModel>? searchbooks = [];
  Future SearchList(category) async {
    log(category);

    await HttpRepos.booksApi.getBooksByCategory(category).then((value) {
      searchbooks = value;
    });

    log(category);
    notifyListeners();
    return searchbooks;
  }
}
