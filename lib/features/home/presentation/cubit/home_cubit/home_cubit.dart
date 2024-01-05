
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_check/features/auth/presentation/screen/login_screen.dart';
import 'package:health_check/features/home/presentation/screen/home_body_screen.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Widget> screens = [
    const HomeBodyScreen(),
    const LoginScreen(),
  ];
  int currentIndex = 0;

  void changeIndex(index){
    currentIndex = index ;
    emit(ChangeIndexState());
  }


}