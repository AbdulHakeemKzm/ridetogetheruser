import 'package:flutter/material.dart';
import 'package:ridetogetheruser/Global/global.dart';
import 'package:ridetogetheruser/SplashScreen/splash_screen.dart';
import 'package:ridetogetheruser/Widgets/about.dart';
import 'package:ridetogetheruser/Widgets/history.dart';
import 'package:ridetogetheruser/Widgets/services.dart';


class MyDrawer extends StatefulWidget {

  String? name;
  String? email;

  MyDrawer({this.name,this.email});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          //drawer header
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: 170,
                  color: Colors.black,
                  child: DrawerHeader(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.person_outlined,
                          size: 100,
                          color: Colors.black,
                        ),
                        const SizedBox( width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                widget.name.toString(),
                                 style:const TextStyle(
                                   fontSize: 16,
                                   color:Colors.black,
                                   fontWeight: FontWeight.bold,
                                 ),
                            ),

                            const SizedBox( width: 10),
                            Text(
                              widget.email.toString(),
                              style:const TextStyle(
                                fontSize: 14,
                                color:Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // const Divider(
          //   height: 20,
          //   color: Colors.black,
          //),
          const SizedBox(
            height: 10,
          ),
          //body
          GestureDetector(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder:(c)=>History()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.black,),
                title: Text(
                  "History",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),

          GestureDetector(
            onTap: ()
            {

            },
            child: const ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,),
              title: Text(
                "Profile",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder:(c)=>AboutPage()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.black,),
              title: Text(
                "About",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder:(c)=>const ServiceTab()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.car_rental_sharp,
                color: Colors.black,),
              title: Text(
                "Services",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: ()
            {

            },
            child: const ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,),
              title: Text(
                "Settings",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),



          GestureDetector(
            onTap: ()
            {
              fAuth.signOut();
              Navigator.push(context, MaterialPageRoute(builder:(c)=>const Splash()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,),
              title: Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
