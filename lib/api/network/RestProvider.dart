import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'NetworkException.dart';

class RestProvider {
  final String _baseUrl = "my-json-server.typicode.com";

  Future<dynamic> getRequest(String url, { Map<String, String>? headers, Map<String, dynamic>? queryParameters }) async {
    try {
      http.Response response = await http.get(Uri.http(_baseUrl, url, queryParameters), headers: headers);
      print('response.request');
      print(response.request);
      print(response.statusCode);
      // print(response.body);
      print('response.request');
      return _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return json.decode(response.body.toString());
      case 400:
        throw BadRequestException(json.decode(response.body.toString())['message']);
      case 401:
      case 403:
        throw UnauthorisedException(json.decode(response.body.toString())['message']);
      case 500:
      default:
        throw FetchDataException('Error while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

}