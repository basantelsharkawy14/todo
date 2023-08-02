

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/core/utils/api_service.dart';
import 'package:todo/features/login/data/models/user_model.dart';
import 'package:todo/features/login/data/repo/auth_repo.dart';
import 'package:todo/features/todo_tasks/data/repo/todo_repo.dart';


class TodoRepoImpl implements TodoRepo{
  final ApiService apiService;

  TodoRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UserModel>> refreshToken() async {
    try {
      String token = Hive.box('userBox').get("token");

      var data = await apiService.post(
          endPoint:
          'auth/refresh-token', token:token );

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