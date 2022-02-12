import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/order/finishied/finishied_page.dart';

class OrderRouters {
  OrderRouters._();

  static final routers = <GetPage>[
    GetPage(name: '/orders/finished', page: () => const FinishiedPage()),
  ];
}
