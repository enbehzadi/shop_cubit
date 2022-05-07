import 'package:bloc/bloc.dart';
import 'package:shop_cubit/home/model/model.dart';
import 'package:shop_cubit/home/data/repository.dart';
import 'package:meta/meta.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cubit/home/view/home_screen.dart';

import 'package:shop_cubit/home/cubit/post_cubit.dart';
import 'package:shop_cubit/home/data/network_service.dart';
import 'package:shop_cubit/home/data/repository.dart';
import 'package:shop_cubit/home/cubit/post_state.dart';

class PostCubit extends Cubit<PostState> {

  PostCubit({this.repository}) : super(PostInitial());
  Map<int, bool> favorites = {};
  static PostCubit get(context) => BlocProvider.of(context);

  final Repository repository;


  Future<List<ProductModel>> fetchPost() async {
    try {
      emit(PostInitial());
      repository.fetchPost().then((posts) {
        if (posts != null) {
          emit(PostLoaded(post: posts));
        } else {
          emit(PostErrorState(message: "Error while fetching Posts"));
        }
      });
    } catch (e) {
      print("Try Catch000");
      print(e);
      emit(PostErrorState(message: e.toString()));
    }
  }


}
