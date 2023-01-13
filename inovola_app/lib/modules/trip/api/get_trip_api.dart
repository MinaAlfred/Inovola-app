import 'package:http/http.dart' as http;

class GetTripApi {
  Future<String> getTrip() async {
    http.Response response = await http.get(
        Uri.parse('https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34'),
        headers: {"Accept" : "application/json"}
    );
    return response.body;
  }
}
