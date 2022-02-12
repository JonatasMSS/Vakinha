import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/services/auth_services.dart';
import 'package:vakinha_burger_mobile/app/core/services/shopping_card_service.dart';
import 'package:vakinha_burger_mobile/app/models/shopping_card_model.dart';

class ShoppingCardController extends GetxController {
  final AuthServices _authServices;
  final ShoppingCardService _shoppingCardService;

  final _address = ''.obs;
  final _cpf = ''.obs;

  ShoppingCardController(
      {required AuthServices authServices,
      required ShoppingCardService shoppingCardService})
      : _authServices = authServices,
        _shoppingCardService = shoppingCardService;
  List<ShoppingCardModel> get products => _shoppingCardService.products;
  double get totalValue => _shoppingCardService.totalValue;

  set address(String address) => _address.value = address;
  set cpf(String cpf) => _cpf.value = cpf;

  void addQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
        shoppingCardModel.product,
        quantity: shoppingCardModel.quantity + 1);
  }

  void subtractQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
        shoppingCardModel.product,
        quantity: shoppingCardModel.quantity - 1);
  }

  void clear() => _shoppingCardService.clear();
}
