import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 errorBar(String title){
   Get.snackbar(
     "Error: Error",
     title,
     icon: const Icon(
       Icons.error_outline,
       color: Colors.white,
     ),
     snackPosition: SnackPosition.TOP,
     backgroundColor: Colors.red,
     colorText: Colors.white,
     snackbarStatus: (status) {
       debugPrint(status.toString());
       if(status==SnackbarStatus.CLOSED)
       {
       }
     },
   );
 }