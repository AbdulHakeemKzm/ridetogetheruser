import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ridetogetheruser/Authentication/login.dart';
import '../Assistants/assistant_methods.dart';
import '../Global/global.dart';
import '../MainScreen/main_screen.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  startTimer()
  {
    fAuth.currentUser != null ? AssistantMethods.readCurrentOnlineUserInfo() : null;

    Timer(const Duration(seconds:3), () async{

      if(await fAuth.currentUser != null)
        {
          currentFirebaseUser = fAuth.currentUser;
          Navigator.push(context, MaterialPageRoute(builder: (c)=> MainScreen()));
        }
      else
        {
          Navigator.push(context, MaterialPageRoute(builder: (c)=> Login()));
        }

    });
  }
  @override
  void initState() {
    super.initState();

    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              //SizedBox(height: 200,),
              Icon(
                Icons.local_taxi_sharp,
                color: Colors.yellow,
                size: 80,
              ),

              Text(style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
                  'RideTogether'
              ),
              //SizedBox(height: 300,),

              // Text(style: TextStyle(
              //
              // ),
              //     ' '
              // ),

            ],
          ),
        ),
      ),
    );
  }
}
