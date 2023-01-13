import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inovola_app/modules/trip/api/get_trip_api.dart';
import 'package:inovola_app/modules/trip/model/Trip.dart';

class TripProvider with ChangeNotifier {
  Trip trip;
  bool isTripFetching = false;

  TripProvider(){
    getTrip();
  }

  getTrip() async {
    isTripFetching = true;
    var response = await GetTripApi().getTrip();
    isTripFetching = false;
    notifyListeners();
    Map<String, dynamic> data = json.decode(response);
    trip = Trip.fromJson(data);
    notifyListeners();
  }

  List<String> images =[
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg'
  ];

}
