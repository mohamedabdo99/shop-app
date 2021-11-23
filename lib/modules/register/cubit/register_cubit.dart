import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data/remote/dio_helper.dart';
import 'package:shop_app/data/remote/end_point.dart';
import 'package:shop_app/model/login_User_Model.dart';
import 'package:shop_app/modules/login/cubit/states_cubit.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  UserDataModel? userModel;
  // INSTANCE
  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
  })
  {
    emit(RegisterLoadingState());

    DioHelper.postData(url: REGISTER, data:
    {
      'name':name,
      'phone':phone,
      'email':email,
      'password':password,
    }).then((value)
    {
     userModel = UserDataModel.fromJson(value.data);
     print( value.data.toString());
     emit(RegisterAccessState(userModel!));
    }).catchError((error)
    {
      print(error.toString()+"Login");
      emit(RegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changeIconSuffix(){
      isPassword = !isPassword;
      suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
      emit(RegisterChangePasswordVisibilityState());
  }

}