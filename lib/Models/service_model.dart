import 'dart:convert';

ServicesModel servicesModelFromJson(String str) => ServicesModel.fromJson(json.decode(str));

String servicesModelToJson(ServicesModel data) => json.encode(data.toJson());

Services servicesFromJson(String str) => Services.fromJson(json.decode(str));

String servicesToJson(Services data) => json.encode(data.toJson());

class ServicesModel {
  ServicesModel({
    required this.status,
    required this.services,
  });
  late final bool status;
  late final List<Services> services;

  ServicesModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    services = List.from(json['services']).map((e)=>Services.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['services'] = services.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Services {
  Services({
    required this.id,
    required this.dealerId,
    required this.type,
    required this.serviceName,
    required this.serviceDetail,
    required this.serviceDate,
    required this.serviceTime,
    this.workshopName,
    this.phone,
    this.address,
    required this.price,
    required this.status,
    this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int dealerId;
  late final int type;
  late final String serviceName;
  late final String serviceDetail;
  late final String serviceDate;
  late final String serviceTime;
  late final Null workshopName;
  late final Null phone;
  late final Null address;
  late final int price;
  late final int status;
  late final String? createdAt;
  late final String updatedAt;

  Services.fromJson(Map<String, dynamic> json){
    id = json['id'];
    dealerId = json['dealer_id'];
    type = json['type'];
    serviceName = json['service_name'];
    serviceDetail = json['service_detail'];
    serviceDate = json['service_date'];
    serviceTime = json['service_time'];
    workshopName = null;
    phone = null;
    address = null;
    price = json['price'];
    status = json['status'];
    createdAt = null;
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['dealer_id'] = dealerId;
    _data['type'] = type;
    _data['service_name'] = serviceName;
    _data['service_detail'] = serviceDetail;
    _data['service_date'] = serviceDate;
    _data['service_time'] = serviceTime;
    _data['workshop_name'] = workshopName;
    _data['phone'] = phone;
    _data['address'] = address;
    _data['price'] = price;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}