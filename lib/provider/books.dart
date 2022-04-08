import 'package:flutter/material.dart';
import 'package:kika/core/http/http_repos.dart';
import 'package:kika/model/book_model.dart';

class BooksProvider extends ChangeNotifier {
  List<BookModel>? books = [];
  List<BookModel>? fantasyBooks = [];

  //Used map to get all the books by mapping each book to its category
  Map<String, List<BookModel>> allBooks = {};

  bookList() async {
    await HttpRepos.booksApi.getBooks().then((value) {
      books = value;
    });
    notifyListeners();
  }

  Future bookCategoryList(String category) async {
    //If the book is not in the map already, get it. If it is there, don't
    if (!allBooks.containsKey(category)) {
      await HttpRepos.booksApi.getBooksByCategory(category).then((value) {
        allBooks[category] = value;
      });
    }
    // log(category);
    //
    // await HttpRepos.booksApi.getBooksByCategory(category).then((value) {
    //   fantasyBooks = value;
    // });

    //log(category);
    notifyListeners();
    return allBooks;
  }

  Future bookCategoryId(id) async {
    await HttpRepos.booksApi.getBooksByID(id).then((value) {
      fantasyBooks = value;
    });

    notifyListeners();
    return fantasyBooks;
  }
}
