import 'package:vakinha_burger_mobile/app/models/product_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> findAll();
}
