import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ridetogetheruser/Assistants/assistant_methods.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../Global/global.dart';

class SelectNearestActiveDriversScreen extends StatefulWidget {
  const SelectNearestActiveDriversScreen({Key? key}) : super(key: key);

  @override
  State<SelectNearestActiveDriversScreen> createState() => _SelectNearestActiveDriversScreenState();
}

class _SelectNearestActiveDriversScreenState extends State<SelectNearestActiveDriversScreen> {

  String fareAmount = "";

  getFareAmountAccordingToVehicleType(int index){

    if(tripDirectionDetailsInfo != null){
      if( dList[index]["car_details"]["type"].toString() == "bike"){
        fareAmount = (AssistantMethods.calculateFareAmountFromOriginToDestination(tripDirectionDetailsInfo!) / 4).toStringAsFixed(1);
      }
      if( dList[index]["car_details"]["type"].toString() == "car"){
        fareAmount = AssistantMethods.calculateFareAmountFromOriginToDestination(tripDirectionDetailsInfo!).toStringAsFixed(1);
      }
      if( dList[index]["car_details"]["type"].toString() == "auto"){
        fareAmount = (AssistantMethods.calculateFareAmountFromOriginToDestination(tripDirectionDetailsInfo!) / 2).toStringAsFixed(1);
      }
    }
    return fareAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          "Nearest Online Drivers",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
              Icons.close, color: Colors.white
          ),
          onPressed: ()
          {
            //delete/remove the ride request from database

            SystemNavigator.pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: dList.length,
        itemBuilder: (BuildContext context, int index)
        {
          return Card(
            color: Colors.lightGreen,
            elevation: 3,
            shadowColor: Colors.green,
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Image.asset(
                  "assets/icons/${dList[index]["car_details"]["type"]}.png",
                  width: 70,
                ),
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    dList[index]["name"],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    dList[index]["car_details"]["car_model"],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  SmoothStarRating(
                    rating: 3.5,
                    color: Colors.black,
                    borderColor: Colors.black,
                    allowHalfRating: true,
                    starCount: 5,
                    size: 15,
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                   // ignore: prefer_interpolation_to_compose_strings
                   '₹ '+ getFareAmountAccordingToVehicleType(index),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2,),
                  Text(
                    tripDirectionDetailsInfo != null ? tripDirectionDetailsInfo!.duration_text! : "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12
                    ),
                  ),
                  const SizedBox(height: 2,),
                  Text(
                    tripDirectionDetailsInfo != null ? tripDirectionDetailsInfo!.distance_text! : "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 12
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

  }
}
