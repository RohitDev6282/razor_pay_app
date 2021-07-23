import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:razor_pay_app/model/getTheData.dart';

class RemoteServices {
  static var client = http.Client();

  static Future fetchUser() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    Response response = await get(url);
    print(response.statusCode);
    if(response.statusCode ==200){
      print("success");
      var data = jsonDecode(response.body);
      return userFromJson(data);
    //  final text = data;
    //  print(text);
    }else {
      print("Oops something went wrogn");
    }
  }
}