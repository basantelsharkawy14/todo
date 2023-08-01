import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/core/service/notification_service.dart';
import 'package:todo/core/utils/api_service.dart';
import 'package:todo/features/login/data/repo/auth_repo_impl.dart';
import 'package:todo/features/login/presentation/views/login_view.dart';
import 'package:todo/features/todo_tasks/data/models/todo_model.dart';
import 'package:todo/features/todo_tasks/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:todo/features/todo_tasks/presentation/views/todo_view.dart';

import 'constants.dart';
import 'core/utils/service_locator.dart';
import 'features/login/presentation/manager/auth_cubit/auth_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init(); //
  await NotificationService().requestIOSPermissions(); //
  setupServiceLocator();
  await Hive.initFlutter();

 // Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>(kTodoBox);
  await Hive.openBox("userBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
              AuthRepoImpl(
                getIt.get<ApiService>(),
              )
          ),
        ),
        BlocProvider(
          create: (context) => NotesCubit()..fetchAllNotes()
        )
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  Hive.box('userBox').get("token") == null?
        const LoginView():
            const TodoView()
      ),
    );
  }
}


