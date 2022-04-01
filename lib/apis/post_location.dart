import 'package:http/http.dart' as http;

dynamic postLocation(double lat, double long, String data) async {
  String url = 'http://~~~~~//child/{child_id}/measured_data';

  http.Response response = await http.post(
    url,
    headers: <String, String>{
      'measured_data': data,
      'lat': lat.toString(),
      'long': long.toString(),
    },
  );
}
