import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> insurePhoneCallPermission() async {
    PermissionWithService phonePermission = Permission.phone;
    PermissionStatus phonePermissionStatus = await phonePermission.status;
    if (phonePermissionStatus.isDenied) {
      return await phonePermission.request() == PermissionStatus.granted;
    }
    return phonePermissionStatus.isGranted;
  }
}
