import 'package:my_market/features/auth/domain/app_user_model.dart';
import 'package:my_market/features/categories/domain/categories_model.dart';
import 'package:my_market/features/order/domain/order_item_model.dart';
import 'package:my_market/features/order/domain/order_model.dart';
import 'package:my_market/features/order/domain/order_product_model.dart';
import 'package:my_market/features/product/domain/product_model.dart';
import 'package:my_market/features/product/domain/product_price_info_model.dart';

class DummyData {
  static List<Category> categoriesList = [
    Category(name: 'Touts', id: '1'),
    Category(name: 'Dinda Fume', id: '2'),
    Category(name: 'Touts', id: '3'),
    Category(name: 'Framage', id: '4'),
    Category(name: 'Boulangerie', id: '5'),
    Category(name: 'Boisson', id: '6'),
    Category(name: 'Autres', id: '7'),
  ];

  static List<AppUser> usersList = [
    AppUser(id: '1', name: 'admin user', role: 'admin', email: 'me@me.com'),
    AppUser(
        id: '2', name: 'cashier user', role: 'cashier', email: 'you@you.com')
  ];

  static Product product = Product(
    id: '1',
    name: 'coffee',
    desc: '200 mg latte',
    barcode: '123456789',
    shortCode: 'asd123',
    categoryId: '2',
    sellPrice: 27,
    alertCount: 25,
    stockCount: 10,
    providersDetails:
        ProvidersDetails(buyPrice: 22, providerName: productProviders.last),
    createdBy: usersList.first.id,
    createdAt: DateTime(2023, 01, 01),
  );

  static List<Product> productsList = [
    Product(
      id: '1',
      name: 'coffee',
      desc: '200 mg latte',
      barcode: '123456789',
      shortCode: 'asc123',
      categoryId: '2',
      sellPrice: 25,
      alertCount: 20,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 21, providerName: productProviders[0]),
      createdBy: usersList.first.id,
      createdAt: DateTime.now(),
    ),
    Product(
      id: '2',
      name: 'chocalate',
      desc: '200 mg Ulker chocolate',
      barcode: '123456789',
      shortCode: 'asd123',
      categoryId: '2',
      sellPrice: 27,
      alertCount: 25,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 22, providerName: productProviders[0]),
      createdBy: usersList.first.id,
      createdAt: DateTime.now(),
    ),
    Product(
      id: '3',
      name: 'milk',
      desc: '1.5 L ici milk',
      barcode: '123458945',
      shortCode: 'asd323',
      categoryId: '3',
      sellPrice: 22,
      alertCount: 10,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 18, providerName: productProviders[1]),
      createdBy: usersList.last.id,
      createdAt: DateTime.now(),
    ),
    Product(
      id: '5',
      name: 'bread',
      desc: '10 piece bread bag',
      barcode: '313456789',
      shortCode: 'aqz157',
      categoryId: '2',
      sellPrice: 10,
      alertCount: 25,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 7, providerName: productProviders[2]),
      createdBy: usersList.last.id,
      createdAt: DateTime.now(),
    ),
    Product(
      id: '6',
      name: 'meat',
      desc: '100g meat bag',
      barcode: '413456789',
      shortCode: 'aqp157',
      categoryId: '2',
      sellPrice: 10,
      alertCount: 25,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 8, providerName: productProviders[2]),
      createdBy: usersList.first.id,
      createdAt: DateTime.now(),
    ),
    Product(
      id: '7',
      name: 'chicken',
      desc: '500 g chicken bag',
      barcode: '353456719',
      shortCode: 'aqy157',
      categoryId: '2',
      sellPrice: 15,
      alertCount: 25,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 12, providerName: productProviders[2]),
      createdBy: usersList.first.id,
      createdAt: DateTime.now(),
    ),
    Product(
      id: '8',
      name: 'biskuit',
      desc: '1 piece biskuit bag',
      barcode: '313456779',
      shortCode: 'aqz167',
      categoryId: '3',
      sellPrice: 11,
      alertCount: 25,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 9, providerName: productProviders[2]),
      createdBy: usersList.first.id,
      createdAt: DateTime.now(),
    ),
  ];

  static List<String> productProviders = [
    'Provider 1',
    'Provider 2',
    'Provider 3',
    'Provider 4',
  ];

  static OrderModel order = OrderModel(
    orderItems: [
      OrderItemModel(
        product: OrderProductModel.fromProduct(productsList[0]),
        quantity: 1,
      ),
      OrderItemModel(
        product: OrderProductModel.fromProduct(productsList[1]),
        quantity: 1,
      ),
    ],
    createdBy: usersList[0].id,
  );
}
