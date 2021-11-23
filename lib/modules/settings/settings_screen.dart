import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/contants/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();

    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopLayoutUserDataSuccessState) {}
      },
      builder: (context, state) {
        var model = ShopCubit.get(context).userModel;
        nameController.text = model!.data!.name!;
        emailController.text = model.data!.email!;
        phoneController.text = model.data!.phone!;
        return ConditionalBuilder(
          condition: ShopCubit.get(context).userModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is ShopLayoutUpdateDataLoadingState)
                  LinearProgressIndicator(),
                SizedBox(height: 10.0,),
                defaultTextFiled(
                  controller: nameController,
                  type: TextInputType.name,
                  label: 'name',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'this filed is required';
                    }
                    return null;
                  },
                  prefix: Icons.person,
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultTextFiled(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  label: 'email address',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'this filed is required';
                    }
                    return null;
                  },
                  prefix: Icons.email,
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultTextFiled(
                  controller: phoneController,
                  type: TextInputType.phone,
                  label: 'phone number',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'this filed is required';
                    }
                    return null;
                  },
                  prefix: Icons.phone,
                ),
                SizedBox(
                  height: 80.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    defaultTextButton(
                      function: () {
                        ShopCubit.get(context).updateUserData(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                        );
                      },
                      text: 'UPDATE',
                      background: Colors.blue,
                    ),
                    SizedBox(
                      width: 80.0,
                    ),
                    defaultTextButton(
                      function: () {
                        signOut(context);
                      },
                      text: 'LOGOUT',
                      background: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
