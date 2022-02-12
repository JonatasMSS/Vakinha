import 'package:vakinha_burger_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/app/models/order.dart';
import 'package:vakinha_burger_mobile/app/models/order_pix.dart';

import './i_order_repository.dart';

class OrderRepository implements IOrderRepository {
  final RestClient _restClient;

  OrderRepository({required RestClient restClient}) : _restClient = restClient;

  @override
  Future<OrderPix> createOrder(Order order) async {
    final result = await _restClient.post('/order/', {
      'userId': order.userId,
      'cpf': order.cpf,
      'address': order.address,
      'items': order.items.map((shoppingCard) => {
            'quantity': shoppingCard.quantity,
            'productID': shoppingCard.product.id,
          })
    });
  }
}
