import 'dart:convert';

import 'package:datatest/model/comment.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  Future<List<Comment>> getDataFromApi(String url) async {
    List<Comment> outputData = [];
    var urlParsed = Uri.parse(url);
    try {
      var response = await http.get(urlParsed);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        for (var item in jsonData) {
          var tempComment = Comment.fromJson(item);
          outputData.add(tempComment);
        }

        return outputData;
      } else {
        print(response.statusCode);
        return outputData;
      }
    } catch (e) {
      print(e);
      return outputData;
    }
  }
}
