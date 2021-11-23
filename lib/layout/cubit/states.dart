import 'package:shop_app/model/favoritesModel/favorites_change.dart';
import 'package:shop_app/model/login_User_Model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomState extends ShopStates {}

class ShopLayoutLoadingState extends ShopStates {}

class ShopLayoutSuccessState extends ShopStates {}

class ShopLayoutErrorState extends ShopStates {
  final String error;
  ShopLayoutErrorState(this.error);
}

class ShopLayoutCategoriesSuccessState extends ShopStates {}

class ShopLayoutCategoriesErrorState extends ShopStates {
  final String error;
  ShopLayoutCategoriesErrorState(this.error);
}

class ShopLayoutChangeFavoritesState extends ShopStates {}

class ShopLayoutChangeFavoritesSuccessState extends ShopStates {
  final FavoritesChangeModel model;

  ShopLayoutChangeFavoritesSuccessState(this.model);
}

class ShopLayoutChangeFavoritesErrorState extends ShopStates {
  final String error;
  ShopLayoutChangeFavoritesErrorState(this.error);
}

class ShopLayoutGetFavoritesLoadingState extends ShopStates {}


class ShopLayoutGetFavoritesSuccessState extends ShopStates {}

class ShopLayoutGetFavoritesErrorState extends ShopStates {
  final String error;
  ShopLayoutGetFavoritesErrorState(this.error);
}

class ShopLayoutUserDataLoadingState extends ShopStates {}


class ShopLayoutUserDataSuccessState extends ShopStates {
  final UserDataModel model;

  ShopLayoutUserDataSuccessState(this.model);
}

class ShopLayoutUserDataErrorState extends ShopStates {
  final String error;
  ShopLayoutUserDataErrorState(this.error);
}

class ShopLayoutUpdateDataLoadingState extends ShopStates {}


class ShopLayoutUpdateDataSuccessState extends ShopStates {
  final UserDataModel model;

  ShopLayoutUpdateDataSuccessState(this.model);
}

class ShopLayoutUpdateDataErrorState extends ShopStates {
  final String error;
  ShopLayoutUpdateDataErrorState(this.error);
}
