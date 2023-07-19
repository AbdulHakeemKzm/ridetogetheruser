import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AboutScreen extends StatefulWidget
{
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}



class _AboutScreenState extends State<AboutScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(

        children: [

          //image
           Container(
            height: 230,
            child: Center(
              child: Image.asset(
                "images/car_logo.png",
                width: 260,
              ),
            ),
          ),

          Column(
            children: [

              //company name
              const Text(
                "Ride Together",
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //about you & your company - write some info
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Welcome to Ride Together, the ultimate ride-sharing application designed to bring users and drivers together on a seamless journey of convenience and affordability. Our app offers a user-friendly interface, making it effortless for passengers to book a ride with just a few taps, while our dedicated drivers are readily available to provide safe and reliable transportation. Whether you're commuting to work, heading to an event, or simply exploring the city, Ride Together ensures a stress-free travel experience for everyone. With real-time tracking, secure payment options, and a commitment to reducing our carbon footprint, Ride Together is not just a ride-sharing app but a sustainable solution for a connected community. Join us in shaping the future of transportation, one shared ride at a time.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                  ),
                ),
              ),


              const SizedBox(
                height: 30,
              ),

              //close
              ElevatedButton(
                onPressed: ()
                {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: const Text(
                  "Close",
                  style: TextStyle(color: Colors.black),
                ),
              ),

            ],
          ),

        ],

      ),
    );
  }
}
