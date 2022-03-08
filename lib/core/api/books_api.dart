import 'package:kika/core/http/http_client.dart';
import 'package:kika/model/book_model.dart';

class BooksApi {
  final HttpClient _http = HttpClient();

  Future<List<BookModel>> getBooks() async {
    final response = await _http.getRequest('volumes?q=politics');

    List<BookModel> model = [];
    var list = response.body['items'];
    for (var info in list) {
      model.add(BookModel.fromMap(info['volumeInfo']));
    }
    print(model);
    return model;
  }

  Future<List<BookModel>> getBooksByCategory(category) async {
    final response = await _http.getRequest('volumes?q=subject:$category');

    List<BookModel> model = [];
    var list = response.body['items'];
    for (var info in list) {
      model.add(BookModel.fromMap(info['volumeInfo']));
    }

    return model;
  }
}
