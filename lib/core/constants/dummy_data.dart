import 'package:my_market/core/extensions/string_extension.dart';
import 'package:my_market/features/categories/domain/category_model.dart';
import 'package:my_market/features/client/domain/client_type_enum.dart';
import 'package:my_market/features/client/domain/company_client_model.dart';
import 'package:my_market/features/client/domain/credit_client_model.dart';
import 'package:my_market/features/order/domain/order_item_model.dart';
import 'package:my_market/features/order/domain/order_model.dart';
import 'package:my_market/features/order/domain/order_product_model.dart';
import 'package:my_market/features/product/domain/product_model.dart';
import 'package:my_market/features/product/domain/product_price_info_model.dart';
import 'package:my_market/features/users/domain/gender_enum.dart';
import 'package:my_market/features/users/domain/user_model.dart';
import 'package:my_market/features/users/domain/user_role_enum.dart';
import 'package:uuid/uuid.dart';

class DummyData {
  static List<CategoryModel> categoriesList = [
    CategoryModel(name: 'Touts', id: 1),
    CategoryModel(name: 'Dinda Fume', id: 2),
    CategoryModel(name: 'Touts', id: 3),
    CategoryModel(name: 'Framage', id: 4),
    CategoryModel(name: 'Boulangerie', id: 5),
    CategoryModel(name: 'Boisson', id: 6),
    CategoryModel(name: 'Autres', id: 7),
  ];

  static List<UserModel> usersList = [
    UserModel(
      nationalId: 'national id',
      name: 'wleed',
      password: 'password',
      roleId: 1,
      id: 1,
      genderId: 1,
    )
  ];

  static ProductModel product = ProductModel(
    id: 1,
    name: 'coffee',
    desc: '200 mg latte',
    barcode: '123456789',
    shortCode: 'asd123',
    categoryId: 1,
    sellPrice: 27,
    alertCount: 25,
    stockCount: 10,
    providersDetails:
        ProvidersDetails(buyPrice: 22, provider: productProviders.last),
    createdBy: usersList.first.id.toString().toString(),
    createdAt: DateTime(2023, 01, 01),
  );

  static List<ProductModel> productsList = [
    ProductModel(
      id: 1,
      name: 'coffee',
      desc: '200 mg latte',
      barcode: '123456789',
      shortCode: 'asc123',
      categoryId: 2,
      sellPrice: 25,
      alertCount: 20,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 21, provider: productProviders[0]),
      createdBy: usersList.first.id.toString(),
      createdAt: DateTime.now(),
    ),
    ProductModel(
      id: 2,
      name: 'chocalate',
      desc: '200 mg Ulker chocolate',
      barcode: '123456789',
      shortCode: 'asd123',
      categoryId: 1,
      sellPrice: 27,
      alertCount: 25,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 22, provider: productProviders[0]),
      createdBy: usersList.first.id.toString(),
      createdAt: DateTime.now(),
    ),
    ProductModel(
      id: 3,
      name: 'milk',
      desc: '1.5 L ici milk',
      barcode: '123458945',
      shortCode: 'asd323',
      categoryId: 3,
      sellPrice: 22,
      alertCount: 10,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 18, provider: productProviders[1]),
      createdBy: usersList.last.id.toString(),
      createdAt: DateTime.now(),
    ),
    ProductModel(
      id: 5,
      name: 'bread',
      desc: '10 piece bread bag',
      barcode: '313456789',
      shortCode: 'aqz157',
      categoryId: 4,
      sellPrice: 10,
      alertCount: 25,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 7, provider: productProviders[2]),
      createdBy: usersList.last.id.toString(),
      createdAt: DateTime.now(),
    ),
    ProductModel(
      id: 6,
      name: 'meat',
      desc: '100g meat bag',
      barcode: '413456789',
      shortCode: 'aqp157',
      categoryId: 5,
      sellPrice: 10,
      alertCount: 25,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 8, provider: productProviders[2]),
      createdBy: usersList.first.id.toString(),
      createdAt: DateTime.now(),
    ),
    ProductModel(
      id: 7,
      name: 'chicken',
      desc: '500 g chicken bag',
      barcode: '353456719',
      shortCode: 'aqy157',
      categoryId: 6,
      sellPrice: 15,
      alertCount: 25,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 12, provider: productProviders[2]),
      createdBy: usersList.first.id.toString(),
      createdAt: DateTime.now(),
    ),
    ProductModel(
      id: 8,
      name: 'biskuit',
      desc: '1 piece biskuit bag',
      barcode: '313456779',
      shortCode: 'aqz167',
      categoryId: 7,
      sellPrice: 11,
      alertCount: 25,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 9, provider: productProviders[2]),
      createdBy: usersList.first.id.toString(),
      createdAt: DateTime.now(),
    ),
    ProductModel(
      id: 9,
      name: '3 biskuit',
      desc: '3 piece biskuit bag',
      barcode: '313456721',
      shortCode: 'aqq167',
      categoryId: 7,
      sellPrice: 30,
      alertCount: 25,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 20, provider: productProviders[2]),
      createdBy: usersList.first.id.toString(),
      createdAt: DateTime.now(),
    ),
    ProductModel(
      id: 10,
      name: 'kinder',
      desc: '1 piece kinder bag',
      barcode: '313456731',
      shortCode: 'aqw167',
      categoryId: 7,
      sellPrice: 15,
      alertCount: 25,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 10, provider: productProviders[2]),
      createdBy: usersList.first.id.toString(),
      createdAt: DateTime.now(),
    ),
    ProductModel(
      id: 11,
      name: 'mars',
      desc: '1 piece mars bag',
      barcode: '313456777',
      shortCode: 'aqx167',
      categoryId: 1,
      sellPrice: 15,
      alertCount: 25,
      stockCount: 10,
      providersDetails:
          ProvidersDetails(buyPrice: 9, provider: productProviders[2]),
      createdBy: usersList.first.id.toString(),
      createdAt: DateTime.now(),
    ),
  ];

  static List<ProductModel> categoryProducts(String categoryId) {
    return productsList
        .where((element) => element.categoryId == categoryId)
        .toList();
  }

  static List<ProductProviderModel> productProviders = [
    ProductProviderModel(name: 'provider 1'),
    ProductProviderModel(name: 'provider 2', id: 2),
    ProductProviderModel(name: 'provider 3', id: 3),
  ];

  static List<OrderItemModel> orderItems = [
    OrderItemModel(
      product: OrderProductModel.fromProduct(productsList[0]),
      quantity: 1,
    ),
    OrderItemModel(
      product: OrderProductModel.fromProduct(productsList[1]),
      quantity: 3,
    ),
    OrderItemModel(
      product: OrderProductModel.fromProduct(productsList[2]),
      quantity: 2,
    ),
  ];

  static CreditOrderModel order = CreditOrderModel(
    isPaid: false,
    orderItems: [
      OrderItemModel(
        product: OrderProductModel.fromProduct(productsList[0]),
        quantity: 1,
      ),
      OrderItemModel(
        product: OrderProductModel.fromProduct(productsList[1]),
        quantity: 3,
      ),
      OrderItemModel(
        product: OrderProductModel.fromProduct(productsList[2]),
        quantity: 2,
      ),
    ],
    createdBy: usersList[0].id,
  );

  static CategoryModel category = CategoryModel(
    id: 1,
    name: 'test category',
  );

  static List<CreditClientModel> creditClients = [
    CreditClientModel(
        fullName: 'fullName',
        id: const Uuid().v4(),
        code: '11',
        phoneNumber: 'phoneNumber',
        createdBy: 'currentUser',
        createdAt: DateTime.now()),
    CreditClientModel(
        fullName: 'fullName 2',
        id: const Uuid().v4(),
        code: '22',
        phoneNumber: 'phoneNumber',
        createdBy: 'currentUser',
        createdAt: DateTime.now()),
  ];

  static List<CompanyClientModel> companyClients = [
    CompanyClientModel(
      id: '1',
      code: '11',
      clientTypeId: ClientType.companyClient.typeIndex,
      fullName: 'fullName 1',
      phoneNumber: 'phoneNumber',
      companyName: 'companyName 1',
      ice: 'ice 1',
      iF: 'iF 1',
      email: 'email',
      createdBy: 'currentUser',
    ),
    CompanyClientModel(
      id: '2',
      clientTypeId: ClientType.companyClient.typeIndex,
      code: '22',
      fullName: 'fullName 2',
      phoneNumber: 'phoneNumber 2',
      companyName: 'companyName 2',
      ice: 'ice 2',
      iF: 'iF 2',
      email: 'email 2',
      createdBy: 'currentUser',
    ),
  ];

  static UserModel localDbUser = UserModel(
    nationalId: 'national id',
    genderId: Gender.male.id,
    name: 'Nejim'.trimAndLower,
    password: 'tester'.trim(),
    roleId: UserRole.admin.id,
  );
}
