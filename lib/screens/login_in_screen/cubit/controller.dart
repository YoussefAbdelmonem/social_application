import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/screens/login_in_screen/cubit/states.dart';
class LoginCubit extends Cubit<LoginScreenStates>
{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context)=> BlocProvider.of(context);

  void userLogin({
    @required String email,
    @required String password,
  }) {
    emit(LoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user.email);
      print(value.user.uid);
      emit(LoginSuccessState(value.user.uid));
    })
        .catchError((error)
    {
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(ShopChangePasswordVisibilityState());
  }



}
var emailController=TextEditingController();

var passwordController=TextEditingController();
bool checkbox=false;
var formKey =GlobalKey<FormState>();
bool isPassword=true;
