import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cubit/home/view/home_screen.dart';
import 'package:shop_cubit/home/cubit/post_cubit.dart';
import 'package:shop_cubit/home/data/network_service.dart';
import 'package:shop_cubit/home/data/repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Repository repository = Repository(networkService: NetworkService());
    return MaterialApp(
      title: 'Flutter BloC/Cubit and Repository Pattern',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (BuildContext context) => PostCubit(repository: repository),
          child: HomeScreen()),
    );
  }
}
