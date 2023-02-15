import 'package:dartz/dartz.dart';

import '../dio/api.dart';
import '../dio/api_dio.dart';
import '../dio/api_request_handler.dart';
import '../models/failures.dart';
import '../models/food_model.dart';

class FoodProvider {
  final _api = ApiDio.instance;

  Future<Either<Failure, List<FoodModel>>> getFoods() async {
    try {
      final result = await ApiRequestHandler.send(
        request: _api.dio.get(foodPath),
        decoder: (data) =>
            (data as List).map((item) => FoodModel.fromJson(item)).toList(),
      );
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
