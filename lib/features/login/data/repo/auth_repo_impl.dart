

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/core/utils/api_service.dart';
import 'package:todo/features/login/data/models/user_model.dart';
import 'package:todo/features/login/data/repo/auth_repo.dart';


class AuthRepoImpl implements AuthRepo{
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UserModel>> login({required String email, required String password}) async {

    try {
      var data = await apiService.post(
          endPoint:
          'auth/login', body: {
        "email": email,
        "password": password
      });

      UserModel user =
      UserModel.fromJson(data['data']);

      return right(user);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }


}