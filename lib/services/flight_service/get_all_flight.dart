import 'package:airease/config.dart';
import 'package:airease/models/flight_model.dart';
import 'package:dio/dio.dart';

class GetAllFlights {
  final Dio dio;

  GetAllFlights({required this.dio});

  Future<List<FlightModel>> getAllFlighs({country, from, to}) async {
    try {
      Response response;
      if (country != null) {
        response = await dio
            .get('${urlBase}/flight/getAllFlights?to=$country');
      } else if (from != null && to != null) {
        response = await dio.get(
            '${urlBase}/flight/getAllFlights?from=$from&to=$to');
      } else {
        response =
            await dio.get('${urlBase}/flight/getAllFlights');
      }
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> flights = jsonData['flights'];
      List<FlightModel> flightList = [];

      for (var flight in flights) {
        FlightModel flightModel = FlightModel(
          from: flight['from'] ?? 'Unknown',
          to: flight['to'] ?? 'Unknown',
          price: flight['price'] ?? 0,
          departureDate: flight['departureDate'] != null
              ? DateTime.parse(flight['departureDate'])
              : DateTime.now(),
          abbreviationTo: flight['abbreviationDistination'] ?? 'UNK',
          abbreviationFrom: flight['abbreviationFrom'] ?? 'UNK',
          numOfFlightHour: flight['numOfFlightHour'] ?? 0,
          id: flight['_id'] ?? 'Unknown',
          arrivalDate: flight['arrivalDate'] != null
              ? DateTime.parse(flight['arrivalDate'])
              : DateTime.now(),
          busSeats: flight['busSeats'] ?? 0,
          ecoSeats: flight['ecoSeats'] ?? 0,
        );
        flightList.add(flightModel);
      }

      return flightList;
    } on Exception catch (e) {
      return [];
    }
  }
}
