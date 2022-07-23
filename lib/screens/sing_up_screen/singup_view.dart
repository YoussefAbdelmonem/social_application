import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/view.dart';
import 'package:social_app/screens/login_in_screen/login_screen.dart';
import 'package:social_app/shared/component/colors.dart';
import 'package:social_app/shared/component/component.dart';
import 'cubit/signup_controller.dart';
import 'cubit/singup_states.dart';

class SingUpParentLayout extends StatelessWidget {
  const SingUpParentLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterScreenStates>(
        listener: (context,state)
        {
          if(state is CreateUserSuccessState)
            {
              navigateAndFinish(context, const SocialLayout());
            }

        },
        builder: (context,state){
          return Scaffold (
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key:formKey ,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Center(
                      child: Column(
                        children: [

                          defaultFormField(
                            controller: firstNameController,
                            type: TextInputType.name,
                            validate: (String value)
                            {
                              if(value.isEmpty)
                              {
                                return 'You must complete this field';
                              }
                              return null;
                            },
                            label: 'First Name',
                            prefix: Icons.person,
                          ),const SizedBox(height: 20,),
                          defaultFormField(
                            controller: phoneController,
                            type: TextInputType.phone,
                            validate: (String value)
                            {
                              if(value.isEmpty)
                              {
                                return 'You must complete this field';
                              }
                              return null;
                            },
                            label: 'Phone',
                            prefix: Icons.phone,
                          ),const SizedBox(height: 20,),
                          defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String value)
                            {
                              if(value.isEmpty)
                              {
                                return 'You must complete this field';
                              }
                              return null;
                            },
                            label: 'Email',
                            prefix: Icons.email,
                          ),
                          const SizedBox(height: 20,),
                          defaultFormField(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              validate: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return 'You must complete this field';
                                }
                                return null;
                              },
                              label: 'Password',
                              prefix: Icons.lock,
                              suffix: RegisterCubit.get(context).suffix,

                      onSubmit: (value) {
                        if (formKey.currentState.validate()) {
                          RegisterCubit.get(context).userRegister(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      isPassword: RegisterCubit.get(context).isPassword,
                      suffixPressed: () {
                        RegisterCubit.get(context)
                            .changePasswordVisibility();
                      },
                          )

                         ,const SizedBox(height: 20,),



                          ConditionalBuilder(
                            builder: (context)=> defaultButton1(
                              function: () {
                                if (formKey.currentState.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      firstName: firstNameController.text,
                                      phone: phoneController.text,

                                  );

                                }
                              },
                              text: 'SING IN',
                            ),
                            condition: state is ! RegisterLoadingState,
                            fallback:(context)=> const Center(child:  CircularProgressIndicator()),
                          ),

                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account',style: TextStyle(
                                  color: ColorManager.greyFont,
                                  fontSize: 12
                              ),),
                              const SizedBox(height: 10,),
                              defaultTextButton(function: ()
                              {
                                navigateAndFinish(context, SingInLayout());
                              },
                                text:'Sing In',
                              )
                            ],
                          )



                        ],
                      ),
                    ),
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


