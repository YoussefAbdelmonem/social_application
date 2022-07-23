import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/layout/cubit/states.dart';
import 'package:social_app/module/social_module.dart';
import 'package:social_app/screens/chat_screen/chat_screen.dart';
import 'package:social_app/screens/home_screen/home_screen.dart';
import 'package:social_app/screens/new_post_screen/new_post_view.dart';
import 'package:social_app/screens/settings_screen/settings_screen.dart';
import 'package:social_app/screens/users_screen/users_screen.dart';
import 'package:social_app/shared/constrains.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class SocialController extends Cubit<SocialStates> {
  SocialController() : super(SocialInitialState());

  static SocialController get(context) => BlocProvider.of(context);

  SocialUserModel userModel;

  void getUserData() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uId)
        .get()
        .then((value) {
          print(value.data());
          userModel = SocialUserModel.fromJson(value.data());

          emit(SocialGetUserSuccessState());
    })
        .catchError((error)
    {
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
    });
  }

  int currentIndex =0;
  List<Widget> screens =
  [
    const HomeScreen(),
    const ChatScreen(),
     NewPostScreen(),
    const UsersScreen(),
    const SettingsScreen(),
  ];
  int titleIndex=0;
  List<String> title =
  [
    'Home',
    'Chat',
    'new post ',
    'Users',
    'Settings',
  ];


void changeBottomNav(int index){
  if (index==2)
    emit(SocialNewPostState());
  else
    {
      currentIndex=index;
      emit(SocialChangeBottomNavigationState());

    }



}

  File profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(SocialAddProfileImageSuccessState());
    } else {
      print('No image selected.');
      emit(SocialAddProfileImageErrorState());
    }
  }

  // image_picker7901250412914563370.jpg
  //

  File coverImage;

  Future<void> getCoverImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialAddCoverImageSuccessState());
    } else {
      print('No image selected.');
      emit(SocialAddCoverImageSuccessState());
    }
  }


  void uploadProfileImage({
    @required String name,
     String phone,
    @required String bio,
  })
  {
    emit(SocialUpdateUserLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value)
      {
        print(value);
        updateUser(
          name:name,
          phone:phone,
          bio:bio,
          image:value,
        );
      }).catchError((error) {
        emit(SocialUpdateProfileImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUpdateProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    @required String name,
     String phone,
    @required String bio,
  })
  {
    emit(SocialUpdateUserLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage.path).pathSegments.last}')
        .putFile(coverImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        updateUser(
          name:name,
          phone:phone,
          bio:bio,
          cover:value,
        );
      }).catchError((error)
      {
        emit(SocialUpdateCoverImageErrorState());
      });
    }).catchError((error)
    {
      emit(SocialUpdateCoverImageErrorState());
    });
  }


  void updateUser({
    @required String name,
     String phone,
    @required String bio,
    String cover,
    String image,
  })
  {
    SocialUserModel model = SocialUserModel(
      name: name,
      phone: phone,
      bio: bio,
      email: userModel.email,
      cover: cover??userModel.cover,
      image: image??userModel.image,
      uId: userModel.uId,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value)
    {
      getUserData();
    })
        .catchError((error)
    {
      emit(SocialUpdateUserErrorState());
    });
  }


/*
   String profileURL='';

  void uploadProfileImage()
  {
    emit(SocialUpdateProfileImageSuccessState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value)
      {
        profileURL=value;
        print(value);

      }).catchError((error) {
        emit(SocialUpdateProfileImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUpdateProfileImageErrorState());
    });
  }

  String coverURL='';

  void uploadCoverImage()
  {
    emit(SocialUpdateCoverImageSuccessState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Users/${Uri.file(coverImage.path).pathSegments.last}')
        .putFile(coverImage)
        .then((value) {
      value.ref.getDownloadURL().then((value)
      {
        coverURL=value;
        print(value);

      }).catchError((error) {
        emit(SocialUpdateCoverImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUpdateCoverImageErrorState());
    });
  }

  void updateUserDate({
  @required String name,
  @required String bio,

})

  {
    emit(SocialUpdateUserLoadingState());
    if (coverImage !=null)
      {
        uploadCoverImage();
      }
    else if(profileImage !=null)
      {
        uploadProfileImage();
      }
    else
      {
        SocialUserModel model =SocialUserModel(
          name: name,

          bio: bio,);

        FirebaseFirestore
            .instance
            .collection('Users')
            .doc(model.uId)
            .update(model.toMap())
            .then((value) {

          getUserData();
        }).catchError((error){
          print(error.toString());
          emit(SocialUpdateUserErrorState());
        });
      }


  }
   */


}
