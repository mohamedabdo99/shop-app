import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data/remote/dio_helper.dart';
import 'package:shop_app/data/remote/end_point.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/model/categoriesmodel/categories_model.dart';
import 'package:shop_app/model/favoritesModel/favorites_change.dart';
import 'package:shop_app/model/favoritesModel/favorites_get.dart';
import 'package:shop_app/model/homeLayout/home_model.dart';
import 'package:shop_app/model/login_User_Model.dart';
import 'package:shop_app/modules/cateogries/cateogries_screen.dart';
import 'package:shop_app/modules/favorites/favourits_screen.dart';
import 'package:shop_app/modules/producets/products_screen.dart';
import 'package:shop_app/modules/settings/settings_screen.dart';
import 'package:shop_app/shared/contants/constants.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  //INSTANCE
  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreen = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ShopChangeBottomState());
  }

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "products",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.apps),
      label: "categories",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: "favorite",
    ),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
  ];

  HomeModel? homeModel;

  CategoriesModel? categoriesModel;

  FavoritesChangeModel? favoritesChangeModel;

  FavouritesGetModel? favouritesGetModel;

  Map<int, bool> favorites = {};

  void getData() {
    emit(ShopLayoutLoadingState());

    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      homeModel!.data.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });
      print(favorites);
      emit(ShopLayoutSuccessState());
    }).catchError((error) {
      print(error.toString() + "mmg");
      emit(ShopLayoutErrorState(error.toString()));
    });
  }

  void getCategoriesData() {
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(ShopLayoutCategoriesSuccessState());
    }).catchError((error) {
      print(error.toString() + "mmg");
      emit(ShopLayoutCategoriesErrorState(error.toString()));
    });
  }

  void postFavoritesChange(int productId)
  {
    favorites[productId] = !(favorites[productId]??false);

    emit(ShopLayoutChangeFavoritesState());

    DioHelper.postData(
      url: FAVORITES,
      data: {'product_id': productId},
      token: token,
     ).then((value)
    {
      favoritesChangeModel = FavoritesChangeModel.fromJson(value.data);
      print(value.data.toString() + " = Favorites");
      if(!(favoritesChangeModel!.status??true)){
        favorites[productId] = !(favorites[productId]??false);
      }
      else{
        getFavoritesData();
      }
      emit(ShopLayoutChangeFavoritesSuccessState(favoritesChangeModel!));
    }).catchError((error) {
      favorites[productId] = !(favorites[productId]??false);
      emit(ShopLayoutChangeFavoritesErrorState(error.toString()));
    });
  }

  void getFavoritesData()
  {
    emit(ShopLayoutGetFavoritesLoadingState());

    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value)
    {
      favouritesGetModel = FavouritesGetModel.fromJson(value.data);
      print("favouritesGetModel  "+value.data.toString());
      emit(ShopLayoutGetFavoritesSuccessState());
    }).catchError((error) {
      print(error.toString() + "mmg");
      emit(ShopLayoutGetFavoritesErrorState(error.toString()));
    });
  }

  UserDataModel? userModel;

  void getUserData()
  {
    emit(ShopLayoutUserDataLoadingState());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value)
    {
      userModel = UserDataModel.fromJson(value.data);
      print("***************"+value.data.toString());
      emit(ShopLayoutUserDataSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString() + "***************");
      emit(ShopLayoutUserDataErrorState(error.toString()));
    });
  }

  void updateUserData({
  required String name,
  required String email,
  required String phone,
})
  {
    emit(ShopLayoutUpdateDataLoadingState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token, data: {
        'name':name,
        'email':email,
        'phone':phone,
    },
    ).then((value)
    {
      userModel = UserDataModel.fromJson(value.data);
      print("***************"+value.data.toString());
      emit(ShopLayoutUpdateDataSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString() + "***************");
      emit(ShopLayoutUpdateDataErrorState(error.toString()));
    });
  }
}
