import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/model/categoriesmodel/categories_model.dart';
import 'package:shop_app/shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
       listener: (context , state ) {},
       builder: (context , state ) {
         return ListView.separated(
           itemBuilder: (context , index) => buildCategoriesItem(ShopCubit.get(context).categoriesModel!.data.data![index]),
           separatorBuilder: (context , index) => myDivider(),
           itemCount: ShopCubit.get(context).categoriesModel!.data.data!.length,
         );
       },
    );
  }

  Widget buildCategoriesItem(DataCategories model) => Row(
        children: [
          Image(
            image: NetworkImage('${model.image}'),
            width: 100.0,
            height: 100.0,
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(
            '${model.name}',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      );
}
