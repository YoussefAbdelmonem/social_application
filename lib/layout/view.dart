import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/cubit/controller.dart';
import 'package:social_app/layout/cubit/states.dart';
import 'package:social_app/screens/new_post_screen/new_post_view.dart';
import 'package:social_app/shared/component/component.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialController,SocialStates>(
      listener: (context,state){
        if (state is SocialNewPostState)
          {
            navigateTo(context, NewPostScreen());

          }

      },

      builder: (context,state){
        var controller =SocialController.get(context);
        return  Scaffold(
          appBar: AppBar(
            title:Text(
                controller.title[controller.currentIndex],
            ),
            actions: [
              IconButton(onPressed: (){},
                  icon: const Icon(Icons.notifications),
              ),
              IconButton(onPressed: (){},
                  icon: const Icon(Icons.search),
              ),
            ],

          ),
          body: controller.screens[controller.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'chat'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.post_add),
                label: 'add post'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'users'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'settings'
              ),
            ],
            onTap: (index)
            {
              controller.changeBottomNav(index);
            },
            currentIndex: controller.currentIndex,
          ),


        );
      },

    );
  }
}
