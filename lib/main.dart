import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/cubit/controller.dart';
import 'package:social_app/layout/cubit/states.dart';
import 'package:social_app/screens/login_in_screen/login_screen.dart';
import 'package:social_app/shared/constrains.dart';
import 'package:social_app/shared/network/bloc_observer.dart';
import 'package:social_app/shared/network/cache_helper.dart';

import 'layout/view.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

   uId = CacheHelper.getData(key: 'uID');
  Widget widget;

  if(uId != null)
  {
    widget = const SocialLayout();
  } else
  {
    widget = SingInLayout();
  }



  runApp(  MyApp
    (
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {


  final Widget startWidget;

  MyApp({

    this.startWidget,
  });



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => SocialController()..getUserData(),
        ),
      ],
        child:BlocConsumer<SocialController,SocialStates>(
          listener: (context,state){},
          builder: (context,state){
            return  MaterialApp(
                title: 'Social Application',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(

                  appBarTheme: const AppBarTheme(
                    color: Colors.white,
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarBrightness: Brightness.dark,
                      statusBarColor: Colors.white,


                    ),
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,

                    ),
                    iconTheme: IconThemeData(
                      color: Colors.black,
                      size: 16,

                    ),

                  ),
                  scaffoldBackgroundColor: Colors.white,
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.shifting,
                    selectedItemColor: Colors.deepOrangeAccent,
                    unselectedItemColor: Colors.black12,
                    elevation: 10,

                  )
                ),
                home: startWidget
            );
          },
        )
    );
  }
}


