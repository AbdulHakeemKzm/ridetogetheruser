import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ridetogetheruser/assistants/assistant_methods.dart';
import 'package:ridetogetheruser/authentication/login_screen.dart';
import 'package:ridetogetheruser/global/global.dart';
import 'package:ridetogetheruser/mainScreens/main_screen.dart';



class MySplashScreen extends StatefulWidget
{
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}



class _MySplashScreenState extends State<MySplashScreen>
{

  startTimer()
  {
    fAuth.currentUser != null ? AssistantMethods.readCurrentOnlineUserInfo() : null;

    Timer(const Duration(seconds: 3), () async
    {
      if(await fAuth.currentUser != null)
      {
        currentFirebaseUser = fAuth.currentUser;
        Navigator.push(context, MaterialPageRoute(builder: (c)=> MainScreen()));
      }
      else
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    
    startTimer();
  }
  
  @override
  Widget build(BuildContext context)
  {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const[
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

            ],
          ),
        ),
      ),
    );
  }
}
