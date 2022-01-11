import 'dart:convert';
import 'package:http/http.dart';

import 'homeresponce.dart';

class HttpService {
  final String getURL = "http://Accounts.productsdemo.xyz/api/";

  Future<HomeResponce> getStudentList(String url) async {
    Response res = await get(Uri.parse(getURL + url));

    if (res.statusCode == 200) {
      HomeResponce student = HomeResponce.fromJson(jsonDecode(res.body));
      print("student");
      return student;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}


