import 'dart:convert';

VehicleModel vehicleModelFromJson(String str) => VehicleModel.fromJson(json.decode(str));

String vehicleModelToJson(VehicleModel data) => json.encode(data.toJson());

Vehicles vehiclesFromJson(String str) => Vehicles.fromJson(json.decode(str));
String vehiclesToJson(Vehicles data) => json.encode(data.toJson());

class VehicleModel {
  VehicleModel({
    required this.status,
    required this.vehicles,
  });
  late final bool status;
  late final List<Vehicles> vehicles;

  VehicleModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    vehicles = List.from(json['vehicles']).map((e)=>Vehicles.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['vehicles'] = vehicles.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Vehicles {
  Vehicles({
    required this.id,
    required this.dealerId,
    required this.type,
    required this.vehicleName,
    this.vehicleType,
    required this.vehicleModel,
    this.vehicleNumber,
    required this.color,
    required this.fuelAverage,
    required this.mileage,
    required this.features,
    required this.vehicleDescription,
    this.workshopName,
    required this.phone,
    required this.address,
    this.imageId,
    required this.price,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int dealerId;
  late final int type;
  late final String vehicleName;
  late final Null vehicleType;
  late final String vehicleModel;
  late final Null vehicleNumber;
  late final String color;
  late final String fuelAverage;
  late final String mileage;
  late final String features;
  late final String vehicleDescription;
  late final Null workshopName;
  late final Null partCondition;
  late final String phone;
  late final String address;
  late final Null imageId;
  late final int price;
  late final int status;
  late final String createdAt;
  late final String updatedAt;

  Vehicles.fromJson(Map<String, dynamic> json){
    id = json['id'];
    dealerId = json['dealer_id'];
    type = json['type'];
    vehicleName = json['vehicle_name'];
    vehicleType = null;
    vehicleModel = json['vehicle_model'];
    vehicleNumber = null;
    color = json['color'];
    fuelAverage = json['fuel_average'];
    mileage = json['mileage'];
    features = json['features'];
    vehicleDescription = json['vehicle_description'];
    workshopName = null;
    partCondition = null;
    phone = json['phone'];
    address = json['address'];
    imageId = null;
    price = json['price'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['dealer_id'] = dealerId;
    _data['type'] = type;
    _data['vehicle_name'] = vehicleName;
    _data['vehicle_type'] = vehicleType;
    _data['vehicle_model'] = vehicleModel;
    _data['vehicle_number'] = vehicleNumber;
    _data['color'] = color;
    _data['fuel_average'] = fuelAverage;
    _data['mileage'] = mileage;
    _data['features'] = features;
    _data['vehicle_description'] = vehicleDescription;
    _data['workshop_name'] = workshopName;
    _data['part_condition'] = partCondition;
    _data['phone'] = phone;
    _data['address'] = address;
    _data['image_id'] = imageId;
    _data['price'] = price;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}