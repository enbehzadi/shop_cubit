import 'package:shop_cubit/home/model/model.dart';

abstract class PostState {}

class PostInitial extends PostState {}


class AppChangeFavoriteDataErrorState extends PostState {}

class AppFavoriteState extends PostState {}
class PostLoaded extends PostState {
  final List<ProductModel> post;

  PostLoaded({this.post});
}

class PostErrorState extends PostState {
  final message;

  PostErrorState({this.message});
}

class AppGetHomeDataLoadingState extends PostState {}
class AppGetHomeDataErrorState extends PostState {}
class AppGetHomeDataSuccessState extends PostState {}
