
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';

import '../model/category_model.dart';

class CategoryService {
  static Future<CategoryData> getCategory() async {
    final response = await rootBundle.loadString('assets/json/categories.json');

    if (response != null) {
      // return CategoryData.fromJson(json.decode(response));
      return categoryDataFromJson(response);
    } else {
      debugPrint("error in category service");
      throw Exception("Failed  to Load Category");
    }
  }
}