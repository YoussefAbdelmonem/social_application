import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/layout/cubit/controller.dart';
import 'package:social_app/layout/cubit/states.dart';
import 'package:social_app/shared/component/component.dart';

class EditProfileScreen extends StatelessWidget {
   EditProfileScreen({Key key}) : super(key: key);

  var nameController =TextEditingController();
  var bioController =TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialController,SocialStates>(
      listener: (context ,state)
      {

      },
      builder: (context ,state){
        var userModel =SocialController.get(context).userModel;
        var profileImage=SocialController.get(context).profileImage;
        var coverImage=SocialController.get(context).coverImage;

        nameController.text = userModel.name;
        bioController.text = userModel.bio;


        return Scaffold(
          appBar: AppBar(
            title: Text('Edit profile'),
            actions: [
              defaultTextButton(
                function: () {
                  SocialController
                      .get(context)
                      .updateUser(
                    name: nameController.text,
                      bio: bioController.text,);
                },
                text: 'UPDATE',
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          body: Padding(
            padding:  EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (state is SocialUpdateUserLoadingState)
                    const LinearProgressIndicator(),

                  Container(
                    height: 200,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 160,
                                decoration:  BoxDecoration(
                                  image: DecorationImage(
                                    image:coverImage ==null ? NetworkImage(
                                      'https://img.freepik.com/free-photo/moon-light-shine-through-window-into-islamic-mosque-interior_1217-2597.jpg?w=1060&t=st=1648391582~exp=1648392182~hmac=f69ecb28c7f1a108c291e4ffd91c796c420b2b7691d05fcc734abb7a1d9df29d',
                                    ):FileImage(coverImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              IconButton(onPressed: ()
                              {
                                SocialController.get(context).getCoverImage();
                              },
                                  icon: const CircleAvatar(
                                      radius: 20,
                                      child: Icon(Icons.camera_alt,size: 16,))),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                             CircleAvatar(
                              radius: 44,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: profileImage ==null? AssetImage('assets/images/youssef.jpg'):FileImage(profileImage),
                              ),
                            ),
                            IconButton(onPressed: (){
                              SocialController.get(context).getProfileImage();
                            },
                                icon: const CircleAvatar(
                                    radius: 12,
                                    child: Icon(Icons.camera_alt,size: 12,))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    validate: (String value){
                      if(value.isEmpty)
                      {
                        return 'name must not be empty';
                      }
                      else return null;
                    },
                    label: 'Name',
                    prefix: Icons.person,

                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultFormField(
                    controller: bioController,
                    type: TextInputType.text,
                    validate: (String value){
                      if(value.isEmpty)
                      {
                        return 'Bio must not be empty';
                      }
                      else return null;
                    },
                    label: 'Bio',
                    prefix: Icons.info_outlined,

                  ),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
