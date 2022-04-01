import 'package:http/http.dart' as http;
Future <dynamic> postRemoveChild(String name) async {
  String url = 'http://~~~~~/user/login_parents';

  http.Response response = await http.post(
    url,
    headers: <String, String>{
      'name': name,
    },
  );
}
