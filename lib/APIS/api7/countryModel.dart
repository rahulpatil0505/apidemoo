
class CountryData {
  bool? status;
  String? message;
  List<dynamic>? error;
  Data? data;

  CountryData({this.status, this.message, this.error, this.data});

  CountryData.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool) {
      status = json["status"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["error"] is List) {
      error = json["error"] ?? [];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(error != null) {
      _data["error"] = error;
    }
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  List<Countries>? countries;

  Data({this.countries});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["countries"] is List) {
      countries = json["countries"] == null ? null : (json["countries"] as List).map((e) => Countries.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(countries != null) {
      _data["countries"] = countries?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Countries {
  String? id;
  String? name;
  String? locale;
  String? alphaCode2;
  String? alphaCode3;
  int? dialCode;
  String? region;
  String? subregion;
  String? currencyCode;
  String? currencyName;
  String? currencySymbol;
  String? timezone;
  MobileRegex? mobileRegex;
  int? mobileLengthMax;
  int? mobileLengthMin;
  String? flag;

  Countries({this.id, this.name, this.locale, this.alphaCode2, this.alphaCode3, this.dialCode, this.region, this.subregion, this.currencyCode, this.currencyName, this.currencySymbol, this.timezone, this.mobileRegex, this.mobileLengthMax, this.mobileLengthMin, this.flag});

  Countries.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["locale"] is String) {
      locale = json["locale"];
    }
    if(json["alpha_code_2"] is String) {
      alphaCode2 = json["alpha_code_2"];
    }
    if(json["alpha_code_3"] is String) {
      alphaCode3 = json["alpha_code_3"];
    }
    if(json["dial_code"] is int) {
      dialCode = json["dial_code"];
    }
    if(json["region"] is String) {
      region = json["region"];
    }
    if(json["subregion"] is String) {
      subregion = json["subregion"];
    }
    if(json["currency_code"] is String) {
      currencyCode = json["currency_code"];
    }
    if(json["currency_name"] is String) {
      currencyName = json["currency_name"];
    }
    if(json["currency_symbol"] is String) {
      currencySymbol = json["currency_symbol"];
    }
    if(json["timezone"] is String) {
      timezone = json["timezone"];
    }
    if(json["mobile_regex"] is Map) {
      mobileRegex = json["mobile_regex"] == null ? null : MobileRegex.fromJson(json["mobile_regex"]);
    }
    if(json["mobile_length_max"] is int) {
      mobileLengthMax = json["mobile_length_max"];
    }
    if(json["mobile_length_min"] is int) {
      mobileLengthMin = json["mobile_length_min"];
    }
    if(json["flag"] is String) {
      flag = json["flag"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["locale"] = locale;
    _data["alpha_code_2"] = alphaCode2;
    _data["alpha_code_3"] = alphaCode3;
    _data["dial_code"] = dialCode;
    _data["region"] = region;
    _data["subregion"] = subregion;
    _data["currency_code"] = currencyCode;
    _data["currency_name"] = currencyName;
    _data["currency_symbol"] = currencySymbol;
    _data["timezone"] = timezone;
    if(mobileRegex != null) {
      _data["mobile_regex"] = mobileRegex?.toJson();
    }
    _data["mobile_length_max"] = mobileLengthMax;
    _data["mobile_length_min"] = mobileLengthMin;
    _data["flag"] = flag;
    return _data;
  }
}

class MobileRegex {
  String? regex;
  String? options;

  MobileRegex({this.regex, this.options});

  MobileRegex.fromJson(Map<String, dynamic> json) {
    if(json["regex"] is String) {
      regex = json["regex"];
    }
    if(json["options"] is String) {
      options = json["options"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["regex"] = regex;
    _data["options"] = options;
    return _data;
  }
}