import 'dart:async';
import 'dart:convert';
import 'models/models.dart';
import 'package:http/http.dart' as http;

class Repository {

  final baseUrl = "https://www.googleapis.com/books/v1/volumes?";

  Future<List<Book>> getBooks(String query) async{
    try {
      final url = "${baseUrl}q=$query";
      var response = await http.get(url);

      if (response.statusCode == 200) {
        print('ok');
        var data = response.body;
        var booksApi = BooksApiModel.fromJson(jsonDecode(data));
        return booksApi.items;
      }
      else {
        return null;
      }
    }catch(e){
      print(e);
      return null;
    }
  }
}
