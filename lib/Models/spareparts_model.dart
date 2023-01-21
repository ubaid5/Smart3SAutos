import 'dart:convert';

SparePartModel sparePartModelFromJson(String str) => SparePartModel.fromJson(json.decode(str));

String sparePartModelToJson(SparePartModel data) => json.encode(data.toJson());

SpareParts sparePartsFromJson(String str) => SpareParts.fromJson(json.decode(str));

String sparePartsToJson(SpareParts data) => json.encode(data.toJson());

class SparePartModel {
  SparePartModel({
    required this.status,
    required this.spareParts,
  });
  late final bool status;
  late final List<SpareParts> spareParts;

  SparePartModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    spareParts = List.from(json['spareParts']).map((e)=>SpareParts.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['spareParts'] = spareParts.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class SpareParts {
  SpareParts({
    required this.id,
    required this.dealerId,
    required this.type,
    this.color,
    required this.partName,
    required this.partId,
    required this.workshopName,
    required this.partCondition,
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
  late final Null color;
  late final String partName;
  late final String partId;
  late final String workshopName;
  late final String partCondition;
  late final String phone;
  late final String address;
  late final Null imageId;
  late final int price;
  late final int status;
  late final String createdAt;
  late final String updatedAt;

  SpareParts.fromJson(Map<String, dynamic> json){
    id = json['id'];
    dealerId = json['dealer_id'];
    type = json['type'];
    color = null;
    partName = json['part_name'];
    partId = json['part_id'];
    workshopName = json['workshop_name'];
    partCondition = json['part_condition'];
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
    _data['color'] = color;
    _data['part_name'] = partName;
    _data['part_id'] = partId;
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