import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.getUrl});
  final String getUrl;

  var dataToSend;

  Future<void> getData() async {
    var url = Uri.parse(getUrl);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      dataToSend = jsonDecode(data);
      return dataToSend;
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }
}
