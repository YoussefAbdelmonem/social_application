import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/cubit/controller.dart';
import 'package:social_app/layout/cubit/states.dart';
import 'package:social_app/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:social_app/shared/component/component.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialController,SocialStates>(
     listener: (context ,state){},
     builder: (context ,state){
       var userModel =SocialController.get(context).userModel;
       return Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 height: 200,
                 child: Stack(
                   alignment: Alignment.bottomCenter,
                   children: [
                     Align(
                       alignment: Alignment.topCenter,
                       child: Container(
                         height: 160,
                         decoration: const BoxDecoration(
                           image: DecorationImage(
                             image: NetworkImage(
                               'https://img.freepik.com/free-photo/moon-light-shine-through-window-into-islamic-mosque-interior_1217-2597.jpg?w=1060&t=st=1648391582~exp=1648392182~hmac=f69ecb28c7f1a108c291e4ffd91c796c420b2b7691d05fcc734abb7a1d9df29d',
                             ),
                             fit: BoxFit.cover,
                           ),
                         ),
                       ),
                     ),
                     const CircleAvatar(
                       radius: 44,
                       backgroundColor: Colors.white,
                       child: CircleAvatar(
                           radius: 40,
                           backgroundImage: AssetImage('assets/images/youssef.jpg')),
                     ),
                   ],
                 ),
               ),
             ),
             const SizedBox(
               height: 10,
             ),
              Text(
               userModel.name,
               style: TextStyle(
                 fontSize: 10,
               ),
             ),
             const SizedBox(
               height: 5,
             ),
             const Text(
               'Why so serious ?',
               style: TextStyle(fontSize: 10, color: Colors.grey),
             ),
             const SizedBox(
               height: 10,
             ),
             Row(
               children: [
                 Expanded(
                   child: InkWell(
                     child: Column(
                       children: const [
                         Text(
                           '100',
                           style: TextStyle(
                             fontSize: 12,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         Text(
                           'posts',
                           style: TextStyle(
                               fontSize: 10,
                               fontWeight: FontWeight.w500,
                               color: Colors.grey),
                         ),
                       ],
                     ),
                     onTap: () {},
                   ),
                 ),
                 Expanded(
                   child: InkWell(
                     child: Column(
                       children: const [
                         Text(
                           '372',
                           style: TextStyle(
                             fontSize: 12,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         Text(
                           'photos',
                           style: TextStyle(
                               fontSize: 10,
                               fontWeight: FontWeight.w500,
                               color: Colors.grey),
                         ),
                       ],
                     ),
                     onTap: () {},
                   ),
                 ),
                 Expanded(
                   child: InkWell(
                     child: Column(
                       children: const [
                         Text(
                           '20k',
                           style: TextStyle(
                             fontSize: 12,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         Text(
                           'followers',
                           style: TextStyle(
                               fontSize: 10,
                               fontWeight: FontWeight.w500,
                               color: Colors.grey),
                         ),
                       ],
                     ),
                     onTap: () {},
                   ),
                 ),
                 Expanded(
                   child: InkWell(
                     child: Column(
                       children: const [
                         Text(
                           '1024',
                           style: TextStyle(
                             fontSize: 12,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         Text(
                           'following',
                           style: TextStyle(
                               fontSize: 10,
                               fontWeight: FontWeight.w500,
                               color: Colors.grey),
                         ),
                       ],
                     ),
                     onTap: () {},
                   ),
                 ),
               ],
             ),
             SizedBox(
               height: 10,
             ),
             Row(
               children: [
                 Expanded(
                   child: OutlinedButton(
                     onPressed: () {},
                     child: Text('Edit Your profile'),
                   ),
                 ),
                 OutlinedButton(onPressed: ()
                 {
                   navigateTo(context, EditProfileScreen());
                 },
                     child: Icon(Icons.edit)
                 ),
               ],
             )
           ],
         ),
       );
     },
    );
  }
}
