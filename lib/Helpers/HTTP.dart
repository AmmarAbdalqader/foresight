import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

class HTTP {
  static Future<http.Response> get(String url) async {
    final r = RetryOptions(maxAttempts: 3);
    log(url);
    final response = await r.retry(
      () => http.get(Uri.parse(url)).timeout(Duration(seconds: 3)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    log(response.statusCode.toString());
    return response;
  }

  static Future<http.Response> post(String url, Map body) async {
    log(url);

    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
        },
        body: jsonEncode(body));
    log(response.statusCode.toString());

    return response;
  }
}
