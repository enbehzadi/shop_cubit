import 'package:shop_cubit/home/model/model.dart';
import 'network_service.dart';

class Repository {
  final NetworkService networkService;

  Repository({this.networkService});

  Future<List<ProductModel>> fetchPost() async {
    final product = await networkService.fetchPost();
    return product.map((e) => ProductModel.fromJson(e)).toList();
  }


}
