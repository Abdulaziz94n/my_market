import 'package:my_market/features/categories/domain/categories_model.dart';
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
    createdBy: 'admin user',
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
      createdBy: 'admin user',
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
      createdBy: 'admin user 2',
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
      createdBy: 'admin user',
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
      createdBy: 'admin user',
      createdAt: DateTime.now(),
    ),
    Product(
      id: '6',
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
      createdBy: 'admin user',
      createdAt: DateTime.now(),
    ),
    Product(
      id: '7',
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
      createdBy: 'admin user',
      createdAt: DateTime.now(),
    ),
    Product(
      id: '8',
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
      createdBy: 'admin user',
      createdAt: DateTime.now(),
    ),
  ];

  static List<String> productProviders = [
    'Provider 1',
    'Provider 2',
    'Provider 3',
    'Provider 4',
  ];
}
