import 'package:flutter/material.dart';
import 'package:social_app/shared/component/component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),

      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
                    Image.network('https://img.freepik.com/free-photo/moon-light-shine-through-window-into-islamic-mosque-interior_1217-2597.jpg?w=1060&t=st=1648391582~exp=1648392182~hmac=f69ecb28c7f1a108c291e4ffd91c796c420b2b7691d05fcc734abb7a1d9df29d'),
              const Text('Meditations',style: TextStyle(
                color: Colors.blueGrey
              ),),


            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => buildPostItem(context),
            separatorBuilder: (context, index) => SizedBox(
              height: 8.0,
            ),
            itemCount: 10,
          ),




        ],
      ),
    );
  }
}
Widget buildPostItem(context) =>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        children:  [
          const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                  'assets/images/youssef.jpg'
              )



          ),
          const SizedBox(width: 10,),
          Column(
            children:  [
              const Text('Youssef Abdelmonem',style: TextStyle(
                fontSize: 10,

              ),),
              const  SizedBox(height: 5,),
              const  Text('5:00 pm at 3/27/2022',style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey

              ),),



            ],
          ),
          const  Spacer(),
          IconButton(onPressed: (){}, icon:const Icon(Icons.more_horiz_outlined)),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          color: Colors.grey[300],
          height: 1,
        ),
      ),
      const Text('Everybody knows that the dice are loaded Everybody rolls with their fingers crossed Everybody knows the war is over Everybody knows the good guys lost Everybody knows the fight was fixed The poor stay poor, the rich get rich That is how it goes Everybody knows',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,

        ),
      ),
      Container(
        width: double.infinity,

        child: Wrap(

          children: [
            defaultTextButton(function: (){},
                text: '#EveryBody_Knows'),
            defaultTextButton(function: (){},
                text: '#Justice_league'),
          ],
        ),
      ),
      Container(
        height: 150.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            4.0,
          ),
          image: const DecorationImage(
            image: NetworkImage(
              'https://img.freepik.com/free-photo/moon-light-shine-through-window-into-islamic-mosque-interior_1217-2597.jpg?w=1060&t=st=1648391582~exp=1648392182~hmac=f69ecb28c7f1a108c291e4ffd91c796c420b2b7691d05fcc734abb7a1d9df29d',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            InkWell(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 5
                ),
                child: Row(
                  children:const [
                    Icon(Icons.favorite_border,color: Colors.red,),
                    Text('124',style: TextStyle(
                      color: Colors.grey,
                    ),),
                  ],
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 5
                ),
                child: Row(
                  children:const [
                    Icon(Icons.comment,color: Colors.grey,),
                    Text('74 comment',style: TextStyle(
                      color: Colors.grey,
                    ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
        ),
        child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[300],
        ),
      ),
      Row(
        children: [
          Expanded(
            child: InkWell(
              child: Row(
                children: const [
                  CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                          'assets/images/youssef.jpg'
                      )



                  ),
                  SizedBox(width: 10,),
                  Text(
                      'write a comment ...',
                      style:TextStyle(
                        color: Colors.grey,
                        fontSize: 10,

                      )
                  ),




                ],
              ),
              onTap: (){},

            ),
          ),
          InkWell(
            child: Row(
              children: const [
                Icon(Icons.favorite_border),

                SizedBox(width: 10,),
                Text(
                    'Like',
                    style:TextStyle(
                      color: Colors.grey,
                      fontSize: 10,

                    )
                ),




              ],
            ),
            onTap: (){},

          ),
        ],
      ),




    ],
  ),
);
