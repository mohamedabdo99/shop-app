import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/search/cubit/cubit.dart';
import 'package:shop_app/modules/search/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Search"),
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultTextFiled(
                        controller: searchController,
                        type: TextInputType.text,
                        label: 'search',
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'this is required';
                          }
                          return null;
                        },
                        onSubmitted: (String value) {
                          if (formKey.currentState!.validate()) {
                            SearchCubit.get(context).searchProducts(
                              text: searchController.text,
                            );
                          }
                        }),
                    SizedBox(
                      height: 15.0,
                    ),
                    if (state is LoadingStateSearch) LinearProgressIndicator(),
                    SizedBox(
                      height: 20.0,
                    ),
                    if(state is SuccessStateSearch)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => favoriteItem(
                            SearchCubit.get(context).model!.data!.data![index],
                            context),
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount:
                        SearchCubit.get(context).model!.data!.data!.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
