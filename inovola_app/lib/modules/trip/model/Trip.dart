import 'ReservTypes.dart';

class Trip {
  Trip({
      this.id, 
      this.title, 
      this.img, 
      this.interest, 
      this.price, 
      this.date, 
      this.address, 
      this.trainerName, 
      this.trainerImg, 
      this.trainerInfo, 
      this.occasionDetail, 
      this.latitude, 
      this.longitude, 
      this.isLiked, 
      this.isSold, 
      this.isPrivateEvent, 
      this.hiddenCashPayment, 
      this.specialForm, 
      this.questionnaire, 
      this.questExplanation, 
      this.reservTypes,});

  Trip.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    img = json['img'] != null ? json['img'].cast<String>() : [];
    interest = json['interest'];
    price = json['price'];
    date = json['date'];
    address = json['address'];
    trainerName = json['trainerName'];
    trainerImg = json['trainerImg'];
    trainerInfo = json['trainerInfo'];
    occasionDetail = json['occasionDetail'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isLiked = json['isLiked'];
    isSold = json['isSold'];
    isPrivateEvent = json['isPrivateEvent'];
    hiddenCashPayment = json['hiddenCashPayment'];
    specialForm = json['specialForm'];
    questionnaire = json['questionnaire'];
    questExplanation = json['questExplanation'];
    if (json['reservTypes'] != null) {
      reservTypes = [];
      json['reservTypes'].forEach((v) {
        reservTypes.add(ReservTypes.fromJson(v));
      });
    }
  }
  int id;
  String title;
  List<String> img;
  String interest;
  int price;
  String date;
  String address;
  String trainerName;
  String trainerImg;
  String trainerInfo;
  String occasionDetail;
  String latitude;
  String longitude;
  bool isLiked;
  bool isSold;
  bool isPrivateEvent;
  bool hiddenCashPayment;
  int specialForm;
  dynamic questionnaire;
  dynamic questExplanation;
  List<ReservTypes> reservTypes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['img'] = img;
    map['interest'] = interest;
    map['price'] = price;
    map['date'] = date;
    map['address'] = address;
    map['trainerName'] = trainerName;
    map['trainerImg'] = trainerImg;
    map['trainerInfo'] = trainerInfo;
    map['occasionDetail'] = occasionDetail;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['isLiked'] = isLiked;
    map['isSold'] = isSold;
    map['isPrivateEvent'] = isPrivateEvent;
    map['hiddenCashPayment'] = hiddenCashPayment;
    map['specialForm'] = specialForm;
    map['questionnaire'] = questionnaire;
    map['questExplanation'] = questExplanation;
    if (reservTypes != null) {
      map['reservTypes'] = reservTypes.map((v) => v.toJson()).toList();
    }
    return map;
  }

}