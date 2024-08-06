import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static showSuccessMessage(message){
    Get.snackbar("Success","$message",backgroundColor: Colors.green,colorText: Colors.white);
  }
  static showFailedMessage(message){
    Get.snackbar("Error","$message",backgroundColor: Colors.red,colorText: Colors.white);
  }
}