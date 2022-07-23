import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/view.dart';
import 'package:social_app/screens/sing_up_screen/singup_view.dart';
import 'package:social_app/shared/component/colors.dart';
import 'package:social_app/shared/component/component.dart';
import 'package:social_app/shared/network/cache_helper.dart';


import 'cubit/controller.dart';
import 'cubit/states.dart';

class SingInLayout extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginScreenStates>(
        listener: (context,state)
        {
          if(state is LoginSuccessState)
            {
              CacheHelper.saveData(
                key: 'uID',
                value: state.uID




              ).then((value)
              {
                navigateAndFinish(
                  context,
                  const SocialLayout(),
                );
              });
            }
        },
        builder: (context,state){
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formKey,
                  child: Column(

                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        const Text(
                          'Sing In Now',
                          style: TextStyle(
                            color: ColorManager.blueFont,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'email must not be empty';
                              }
                              return null;
                            },
                            label: 'email',
                            prefix: Icons.email_outlined),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'Password must not be empty';
                              }
                              return null;
                            },
                            label: 'Password',
                            prefix: Icons.lock,
                          suffix: LoginCubit.get(context).suffix,

                          onSubmit: (value) {
                              if (formKey.currentState.validate()) {
                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            isPassword: LoginCubit.get(context).isPassword,
                            suffixPressed: () {
                              LoginCubit.get(context)
                                  .changePasswordVisibility();
                            },)

                        // here is a row where it suppose to be a checkboxListTile but whenever i try to make it

                        //the whole design collapse
                        ,const SizedBox(
                          height: 40,
                        ),

                        ConditionalBuilder(
                          builder: (context)=> defaultButton1(
                            function: () {
                              if (formKey.currentState.validate()) {
                                LoginCubit.get(context).userLogin(email: emailController.text, password: passwordController.text);

                              }
                            },
                            text: 'SING IN',
                          ),
                          condition: state is ! LoginLoadingState,
                          fallback:(context)=> const Center(child:  CircularProgressIndicator()),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: ColorManager.greyFont,
                                fontSize: 14,
                              ),
                            ),
                            defaultTextButton(
                              function: () {
                                navigateAndFinish(context, const SingUpParentLayout());
                              },
                              text:
                              'Create Account',
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
