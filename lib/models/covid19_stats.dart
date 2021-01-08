import 'dart:convert';
import 'package:http/http.dart';

class CovidStat {
  String country; //name of country to be searched on
  Map results;

  CovidStat(this.country);

  Future<void> getAllCovidInfo() async {
    try {
      Response response =
          await get('https://corona.lmao.ninja/v3/covid-19/countries/$country');
      Map data = jsonDecode(response.body);

      results = data;
    } catch (e) {
      results = {'q': 'could not get data'};
    }
  }

//  /// This method will return the total statistics
//  Future<Map<String, dynamic>> allCovidInfo(http.Client httpClient) async {
//    final httpResponse = await httpClient.get('https://corona.lmao.ninja/all');
//    if (httpResponse.statusCode == 200) {
//      final jsonBody = json.decode(httpResponse.body);
//      return jsonBody;
//    } else {
//      throw Exception();
//    }
//  }

  /// This method will return the statistics based on the country
//  Future<Map<String, dynamic>> countryCovidInfo(
//      String country, http.Client httpClient) async {
//    final httpResponse =
//    await httpClient.get('https://corona.lmao.ninja/countries/$country');
//    if (httpResponse.statusCode == 200) {
//      final jsonBody = json.decode(httpResponse.body);
//      return jsonBody;
//    } else {
//      throw Exception();
//    }
//  }

}
