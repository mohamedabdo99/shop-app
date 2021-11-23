import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data/remote/dio_helper.dart';
import 'package:shop_app/data/remote/end_point.dart';
import 'package:shop_app/model/search_model/search.dart';
import 'package:shop_app/modules/search/cubit/states.dart';
import 'package:shop_app/shared/contants/constants.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(InitialStateSearch());

  // GET INSTANCE

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;

  void searchProducts({
    required String text,
  }) {
    emit(LoadingStateSearch());

    DioHelper.postData(
      url: SEARCH,
      data: {
        'text' : text,
      },
      token: token,
    ).then((value) {
      model  = SearchModel.fromJson(value.data);
      print(value.data.toString());
      emit(SuccessStateSearch());
    }).catchError((error){
      emit(ErrorStateSearch(error.toString()));
    });
  }
}
