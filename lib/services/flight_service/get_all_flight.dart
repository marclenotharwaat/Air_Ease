import 'package:airease/models/flight_model.dart';
import 'package:dio/dio.dart';

class GetAllFlights {
  final Dio dio;

  GetAllFlights({required this.dio});

  Future<List<FlightModel>> getAllFlighs() async {
    try {
      Response response =
          await dio.get('http://192.168.1.6:10000/flight/getAllFlights');
      print(response);
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> flights = jsonData['flights'];
      List<FlightModel> flihgtList = [];
      for (var flight in flights) {
        FlightModel flightModel = FlightModel(
          from: flight['from'],
          distination: flight['distination'],
          price: flight['price'],
          departureDate: DateTime.parse(flight['departureDate']),
          abbreviationDistination: flight['abbreviationDistination'],
          abbreviationFrom: flight['abbreviationFrom'],
          numOfFlightHour: flight['numOfFlightHour'],
          id: flight['_id'],
          arrivalDate: DateTime.parse(flight['arrivalDate']),
          busSeats: flight['busSeats'],
          ecoSeats: flight['ecoSeats'],
        );
        flihgtList.add(flightModel);
      }
      return flihgtList;
    } on Exception catch (e) {
      return [];
    }
  }
}
