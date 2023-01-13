class ReservTypes {
  ReservTypes({
      this.id, 
      this.name, 
      this.count, 
      this.price,});

  ReservTypes.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
    price = json['price'];
  }
  int id;
  String name;
  int count;
  int price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['count'] = count;
    map['price'] = price;
    return map;
  }

}