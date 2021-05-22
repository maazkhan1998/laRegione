import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'api_exceptions.dart';


class ApiBaseHelper {
  final String _baseUrl = "https://api.laregione.dev/reader/";

  Map<String,String> header={
    'Accept':'application/json'
  };

  Future<dynamic> get(String url) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl + url),headers:header );
      responseJson = _returnResponse(response);
    } on SocketException catch(e){
      print('No net');
      throw FetchDataException(e.osError.message);
    }
    print(responseJson);
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    print('Api Post, url $url');
    var responseJson;
    try {
      final response = await http.post(Uri.parse(_baseUrl + url), body: body,headers: header);
      responseJson = _returnResponse(response);
    } on SocketException catch(e){
      print('No net');
      throw FetchDataException(e.osError.message);
    }
    print('api post.');
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(Uri.parse(_baseUrl + url), body: body,headers: header);
      responseJson = _returnResponse(response);
    } on SocketException catch(e){
      print('No net');
      throw FetchDataException(e.osError.message);
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(_baseUrl + url),headers: header);
      apiResponse = _returnResponse(response);
    } on SocketException catch(e){
      print('No net');
      throw FetchDataException(e.osError.message);
    }
    print('api delete.');
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
  }
}

String urlForRoute(Map<String,dynamic> params,String endPoint){
 return ApiBaseHelper()._baseUrl+endPoint+'?'+Uri(queryParameters: params).query;
}

String postURLForRoute(String endPoint){
 return ApiBaseHelper()._baseUrl+endPoint;
}