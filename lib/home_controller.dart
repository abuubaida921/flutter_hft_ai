
import 'package:flutter_hft_ai/app_routes/app_routes.dart';
import 'package:flutter_hft_ai/utils.dart';
import 'package:get/get.dart';

import 'authentication_helper.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;

  void logout() {
    AuthenticationHelper().signOut();
    Get.offAllNamed(Routes.SIGNIN);
    Utils.showSuccessMessage('Logout Success');
  }
}
