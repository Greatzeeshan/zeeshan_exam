import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';
import '../service/api_service.dart';


class UserDataController extends GetxController{

  var isLoading = false.obs;
  var newLoading = false.obs;
  var userData = UserData();

  void fetchUserData() async {
    try {
      isLoading(true);
      var type = await UserService.fetchUsers();
      if (type != null) {
        isLoading(false);
        userData = type;
          debugPrint("User Data controller check********");
      }
    } finally {
      isLoading(false);
    }
  }
}