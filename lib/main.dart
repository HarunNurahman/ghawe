import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghawe/cubit/page_cubit.dart';
import 'package:ghawe/services/route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: PageRoutes.pages,
        initialRoute: '/',
      ),
    );
  }
}
