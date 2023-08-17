import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:todo_clean_architecture/feature/todo/presentation/binding/todo.binding.dart';
import 'package:todo_clean_architecture/feature/todo/presentation/views/home.view.dart';
import 'package:todo_clean_architecture/firebase_options.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp (
      title: 'Todo app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomeView(),
      initialBinding: TodoBinding(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page:()=> HomeView(),binding: TodoBinding())
      ],
    );
  }
}
