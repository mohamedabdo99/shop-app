import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data/local/cache_helper.dart';
import 'package:shop_app/layout/shop_layout.dart';
import 'package:shop_app/modules/login/cubit/states_cubit.dart';
import 'package:shop_app/modules/register/cubit/register_cubit.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/contants/constants.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (BuildContext context, state) {
          if (state is RegisterAccessState)
          {
            if (state.userModel.status == true)
            {
              CacheHelper.saveData(
                  key: "token", value: state.userModel.data!.token)
                  .then((value) {
                token = state.userModel.data!.token;
                navigateToAndFinish(
                  context,
                  ShopLayout(),
                );
              });
              buildShowToast(
                text: '${state.userModel.message}',
                state: ToastState.SUCCESS,
              );
            }
            else {
              buildShowToast(
                text: '${state.userModel.message}',
                state: ToastState.ERROR,
              );
            }
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Register',
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: defaultTextFiled(
                          controller: nameController,
                          type: TextInputType.name,
                          label: 'name',
                          validate: (value) {
                            if (value == null) {
                              return 'this filed required';
                            }
                          },
                          prefix: Icons.person,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: defaultTextFiled(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'Email Address',
                          validate: (value) {
                            if (value == null) {
                              return 'this filed required';
                            }
                          },
                          prefix: Icons.email,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: defaultTextFiled(
                          controller: phoneController,
                          type: TextInputType.phone,
                          label: 'phone',
                          validate: (value) {
                            if (value == null) {
                              return 'this filed required';
                            }
                          },
                          prefix: Icons.phone,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: defaultTextFiled(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'Password',
                          suffixPressed: () {
                            // LoginCubit.get(context).changeIconSuffix();
                          },
                          // isPassword: LoginCubit.get(context).isPassword,
                          validate: (value) {
                            if (value == null) {
                              return 'this filed required';
                            } else {
                              return null;
                            }
                          },
                          // suffix: LoginCubit.get(context).suffix,
                          prefix: Icons.lock_outline_rounded,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! RegisterLoadingState,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: defaultButton(
                            height: 40.0,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: "SignUP",
                            textColor: Colors.white,
                          ),
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
