class KPVDetailModel {
  Data? data;
  bool? error;

  KPVDetailModel({this.data, this.error});

  KPVDetailModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = this.error;
    return data;
  }
}

class Data {
  String? id;
  int? year;
  int? month;
  String? categoryNew;
  String? title;
  String? detail;
  List<AdditionalInfo>? additionalInfo;
  String? image;
  String? status;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? createdByFullName;
  String? updatedByFullName;
  String? updatedBy;

  Data(
      {this.id,
      this.year,
      this.month,
      this.categoryNew,
      this.title,
      this.detail,
      this.additionalInfo,
      this.image,
      this.status,
      this.startDate,
      this.endDate,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.createdByFullName,
      this.updatedByFullName,
      this.updatedBy});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    year = json['year'];
    month = json['month'];
    categoryNew = json['categoryNew'];
    title = json['title'];
    detail = json['detail'];
    if (json['additionalInfo'] != null) {
      additionalInfo = <AdditionalInfo>[];
      json['additionalInfo'].forEach((v) {
        additionalInfo!.add(new AdditionalInfo.fromJson(v));
      });
    }
    image = json['image'];
    status = json['status'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    createdByFullName = json['created_by_full_name'];
    updatedByFullName = json['updated_by_full_name'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['year'] = this.year;
    data['month'] = this.month;
    data['categoryNew'] = this.categoryNew;
    data['title'] = this.title;
    data['detail'] = this.detail;
    if (this.additionalInfo != null) {
      data['additionalInfo'] =
          this.additionalInfo!.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    data['status'] = this.status;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['created_by_full_name'] = this.createdByFullName;
    data['updated_by_full_name'] = this.updatedByFullName;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}

class AdditionalInfo {
  String? title;
  String? detail;
  List<String>? image;

  AdditionalInfo({this.title, this.detail, this.image});

  AdditionalInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    detail = json['detail'];
    image = json['image'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['detail'] = this.detail;
    data['image'] = this.image;
    return data;
  }
}
