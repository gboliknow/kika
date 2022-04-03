import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kika/core/http/http_repos.dart';
import 'package:kika/model/book_model.dart';

class BooksProvider extends ChangeNotifier {
  List<BookModel>? books = [];

  List<BookModel>? sciencebooks = [];

  bookList() async {
    await HttpRepos.booksApi.getBooks().then((value) {
      books = value;
    });
    notifyListeners();
  }

  Future bookCategoryList(category) async {
    log(category);

    await HttpRepos.booksApi.getBooksByCategory(category).then((value) {
      books = value;
    });

    log(category);
    notifyListeners();
    return books;
  }

  // void clearSearch() {
  //   searchbooks!.clear();
  //   notifyListeners();
  // }

  Future bookCategoryid(id) async {
    await HttpRepos.booksApi.getBooksByID(id).then((value) {
      books = value;
    });

    notifyListeners();
    return books;
  }
}
