

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/features/login/data/repo/auth_repo.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


  final formKeyLogin = GlobalKey<FormState>();


  login() async  {
    emit(AuthLoading());
    var result = await authRepo.login(
      password: passController.text,
      email: emailController.text,
    );
    result.fold((failure) {
      debugPrint(failure.errMessage);
      emit(AuthFailure(
        error: failure.errMessage,
      ));
    }, (user) async{
      debugPrint(user.toString());
      final key = Hive.generateSecureKey();
      final encryptedBox= await Hive.openBox('userBox', encryptionCipher: HiveAesCipher(key));
      encryptedBox.put('token', 'Bearer ${user.token}');
      print(encryptedBox.get('token'));
      emit(AuthSuccess());
    });
  }


}
