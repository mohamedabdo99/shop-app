import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data/remote/dio_helper.dart';
import 'package:shop_app/data/remote/end_point.dart';
import 'package:shop_app/model/login_User_Model.dart';
import 'package:shop_app/modules/login/cubit/states_cubit.dart';
import 'package:shop_app/modules/register/cubit/states_cubit.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  UserDataModel? userModel;
  // INSTANCE
  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(LoginLoadingState());

    DioHelper.postData(url: LOGIN, data:
    {
      'email':email,
      'password':password,
    }).then((value)
    {
     userModel = UserDataModel.fromJson(value.data);
     print( value.data.toString());
     emit(LoginAccessState(userModel!));
    }).catchError((error)
    {
      print(error.toString()+"Login");
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changeIconSuffix(){
      isPassword = !isPassword;
      suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
      emit(LoginChangePasswordVisibilityState());
  }

}