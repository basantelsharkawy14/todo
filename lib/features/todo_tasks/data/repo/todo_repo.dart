
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/features/login/data/models/user_model.dart';


abstract class TodoRepo {

  Future<Either<Failure,UserModel>> refreshToken();


}