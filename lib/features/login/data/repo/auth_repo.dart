
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/features/login/data/models/user_model.dart';


abstract class AuthRepo {

  Future<Either<Failure,UserModel>> login({required String email, required String password});


}