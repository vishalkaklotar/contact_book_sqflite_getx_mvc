import 'package:contact_book_sqflite_getx_mvc/utility/snackbars/permission_error_sbanckbar.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:permission_handler/permission_handler.dart';

import 'permission_service.dart';

class CallingService extends PermissionService{
  Future<void> call({required String on}) async {
    bool phonePermissionStatus = await insurePhoneCallPermission();
    if(phonePermissionStatus) {
      FlutterPhoneDirectCaller.callNumber(on);
    }else{
      showPermissionErrorSnackBar(onSetting: () {
          openAppSettings();
      },);
    }
  }
}