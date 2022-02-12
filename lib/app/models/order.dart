import 'package:vakinha_burger_mobile/app/models/shopping_card_model.dart';
import 'package:vakinha_burger_mobile/app/modules/order/Shopping_card/Shopping_card_bindings.dart';

class Order {
  int userId;
  String cpf;
  String address;
  List<ShoppingCardModel> items;
  Order({
    required this.userId,
    required this.cpf,
    required this.address,
    required this.items,
  });
}
