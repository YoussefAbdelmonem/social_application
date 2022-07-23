
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/module/social_module.dart';
import 'package:social_app/screens/sing_up_screen/cubit/singup_states.dart';

class RegisterCubit extends Cubit<RegisterScreenStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    @required String firstName,
    @required String phone,
    @required String email,
    @required String password,
  }) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      print(value.user.email);
      print(value.user.uid);
      emit(RegisterSuccessState());
      userCreate(
        uID:value.user.uid,
        email: email,
        name: firstName,
        phone: phone
      );
    }).catchError((error)
    {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    @required String name,
    @required String phone,
    @required String email,
    @required String uID,
})
  {
    SocialUserModel model =SocialUserModel(
      phone: phone,
      name: name,
      email: email,
      uId: uID,
      image: 'https://www.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_10421502.htm#query=people&position=6&from_view=search',
      bio: "my bio",
      cover: "https://www.freepik.com/free-photo/female-tourists-spread-their-arms-held-their-wings_3954310.htm#query=happy%20people&position=27&from_view=keyword"
    );
    FirebaseFirestore.instance.collection('Users').doc(uID).set(
      model.toMap()
    ).then((value)
    {
      emit(CreateUserSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(CreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShopChangePasswordVisibilityStateRegister());
  }
}

var firstNameController = TextEditingController();
var phoneController = TextEditingController();

var emailController = TextEditingController();

var passwordController = TextEditingController();

var formKey = GlobalKey<FormState>();
bool isPassword = true;
bool checkbox = false;
