
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';
import '../utils/urls.dart';
import '../widgets/common_bar.dart';

class UserService {
  static var client=http.Client();

  static Future fetchUsers() async {

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.mobile &&
          connectivityResult != ConnectivityResult.wifi) {
        errorBar("No Internet");
        return null;
      }
      var response = await http.get(Uri.parse(URLS.baseUrl + URLS.users),);
      debugPrint("user data API print : ${URLS.baseUrl + URLS.users}");

      debugPrint(response.body);
      var statusCode = response.statusCode;
      switch (statusCode) {
        case HttpStatus.ok:
          var jsonString = response.body;
          return userDataFromJson(jsonString);
          break;
        case HttpStatus.gatewayTimeout:
          errorBar("No Server");
          return null;
          break;
        default:
          errorBar("Went Wrong");
          return null;
          break;
      }
    }catch(e)
    {
      debugPrint(e.toString());
      errorBar("Went Wrong " + e.toString());
      return null;
    }
  }

}