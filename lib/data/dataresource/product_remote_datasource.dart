
import 'package:canteen_app/data/model/response/product_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import 'auth_local_datasource.dart';

class ProductRemoteDatasouce{
  Future<Either<String, ProductResponseModel>> getProducts() async {
    final authData = await AuthLocalResource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/all-products'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData.accessToken}'
      },
    );

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }
}