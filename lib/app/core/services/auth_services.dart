import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';

// Item de serviço que nunca "Morre"

class AuthServices extends GetxService {
  final _isLogged = RxnBool();

  final _getStorage = GetStorage();

  Future<AuthServices> init() async {
    _getStorage.listenKey(Constants.USER_KEY, (value) {
      // if (value != null) {
      //  isLogged(true);
      //} else {
      //  isLogged(false);
      // }

      _isLogged(value != null);
    });

    ever<bool?>(_isLogged, (isLogged) {
      if (isLogged == null || !isLogged) {
        Get.offAllNamed('/auth/login');
      } else {
        Get.offAllNamed('/home');
      }
    });

    //final isLoggedData = GetUserId() != null;
    _isLogged(getUserId() != null);

    return this;
  }

  void logout() => _getStorage.write(Constants.USER_KEY, null);

  int? getUserId() => _getStorage.read(Constants.USER_KEY);
}
