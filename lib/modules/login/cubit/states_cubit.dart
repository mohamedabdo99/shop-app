import 'package:shop_app/model/login_User_Model.dart';

abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterAccessState extends RegisterStates {
  final UserDataModel userModel;
  RegisterAccessState(this.userModel);
}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}

class RegisterChangePasswordVisibilityState extends RegisterStates {}
