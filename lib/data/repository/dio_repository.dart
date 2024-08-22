import 'package:dio/dio.dart';
import 'package:fake_store_one/data/models/product_model.dart';

class DioRepository {
  final Dio dio = Dio();

  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get('https://api.escuelajs.co/api/v1/products');

    List<dynamic> results = response.data;

    final List<ProductModel> products = results
        .map(
          (e) => ProductModel.fromJson(e),
        )
        .toList();
    print(results);
    print(results.length);
    return products;
  }
}
