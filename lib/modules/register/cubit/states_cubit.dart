import 'package:shop_app/model/login_User_Model.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginAccessState extends LoginStates {
  final UserDataModel userModel;
  LoginAccessState(this.userModel);
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class LoginChangePasswordVisibilityState extends LoginStates {}
