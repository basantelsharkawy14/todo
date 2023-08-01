import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:todo/core/functions/custom_snak_bar.dart';
import 'package:todo/core/utils/styles.dart';
import 'package:todo/core/widgets/default_button.dart';
import 'package:todo/core/widgets/default_text_field.dart';
import 'package:todo/features/login/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:todo/features/todo_tasks/presentation/views/todo_view.dart';
import 'package:todo/theme.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            customSnackBar(context, "Error", state.error);
          } else if (state is AuthSuccess) {
             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const TodoView()),(Route<dynamic> route) => false);
          } else if (state is AuthLoading) {
            // LoadingScreen.show(context);
          }
        },
        builder: (context, state) => Container(
          color: AppTheme.white,
                child: FooterLayout(
              footer: SingleChildScrollView(
                child: Container(
                  height: size.height * .73,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                  child: Form(
                    key:  BlocProvider.of<AuthCubit>(context).formKeyLogin,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Email *', style: Styles.textStyle14),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        DefaultTextField(
                          controller:
                              BlocProvider.of<AuthCubit>(context).emailController,
                          label: 'Enter your email',
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'wrong email';
                            }
                            if (value.isEmpty) {
                              return 'Field Required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Password *', style: Styles.textStyle14),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        DefaultTextField(
                            controller: BlocProvider.of<AuthCubit>(context)
                                .passController,
                            password: true,
                            validator: (value) {
                              if (value!.length < 6) {
                                return 'wrong password';
                              }
                              if (value.isEmpty) {
                                return 'Field Required';
                              }
                              return null;
                            },
                            label: 'Enter your password',
                            icon: Icons.security),
                        const SizedBox(
                          height: 35,
                        ),
                        Center(
                          child: DefaultButton(
                            function: () {
                              if (!BlocProvider.of<AuthCubit>(context)
                                  .formKeyLogin
                                  .currentState!
                                  .validate()) {
                                return;
                              }
                              BlocProvider.of<AuthCubit>(context)
                                  .formKeyLogin
                                  .currentState!
                                  .save();

                              BlocProvider.of<AuthCubit>(context).login();
                            },
                            isLoad: state is AuthLoading,
                            height: 60,
                            width: size.width ,
                            font: size.height * 0.022,
                            radius: 35,
                            textColor: AppTheme.white,
                            title: 'Sign in',
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 30, top: 90),
                        child: const Text('Login', style: Styles.textStyle30)),
                  ],
                ),
              ),
            )));
  }
}
