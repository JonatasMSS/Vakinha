import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/services/auth_services.dart';
import 'package:vakinha_burger_mobile/app/core/services/shopping_card_service.dart';
import 'package:vakinha_burger_mobile/app/modules/menu/menu_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/menu/menu_page.dart';

class HomeController extends GetxController {
  final _tabIndex = 0.obs;
  final ShoppingCardService _shoppingCardService;

  final _tabs = ['/menu', '/order/shopping_card', '/exit'];

  HomeController({required ShoppingCardService shoppingCardService})
      : _shoppingCardService = shoppingCardService;
  int get tabIndex => _tabIndex.value;

  int get TotalProdutctsInShoppingCard => _shoppingCardService.totalProducts;

  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == '/exit') {
      Get.find<AuthServices>().logout();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  static const NAVIGATOR_KEY = 1; // Dá uma nomeação á navegação
  Route? onGeneratedRouter(RouteSettings settings) {
    if (settings.name == '/menu') {
      return GetPageRoute(
          settings: settings,
          page: () => const MenuPage(),
          binding: MenuBindings(),
          transition: Transition.fadeIn);
    }
    if (settings.name == '/order/shopping_card') {}
  }
}
