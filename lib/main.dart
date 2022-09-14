import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghawe/cubit/auth_cubit.dart';
import 'package:ghawe/cubit/page_cubit.dart';
import 'package:ghawe/services/route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: PageRoutes.pages,
        initialRoute: '/',
      ),
    );
  }
}
