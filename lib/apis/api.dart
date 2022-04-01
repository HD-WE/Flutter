/*import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = 'http://~~~~~';

class API {
  static Future getUsers() {
    var url = baseUrl + '/parents/childs';
    return http.get(url);
  }
}
*/

import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://jsonplaceholder.typicode.com";

class API {
  static Future getUsers() {
    var url = baseUrl + "/users";
    return http.get(url);
  }
}
