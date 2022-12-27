import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../const.dart';

class RemoteCartService {
  var client = http.Client();

  Future<dynamic> create({
    required int productId,
    required int tagId,
    required int quantity,
    required String token,
  }) async {
    var body = {
      "product": productId,
      "tag": tagId,
      "quantity": quantity
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/cart/me'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(body),
    );
    return response;
  }

  Future<dynamic> get({
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse('$baseUrl/api/cart/me'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }

  Future<dynamic> delete({
    required int itemId,
    required String token,
  }) async {
    var response = await client.delete(
      Uri.parse('$baseUrl/api/cart/me/$itemId'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }
}
