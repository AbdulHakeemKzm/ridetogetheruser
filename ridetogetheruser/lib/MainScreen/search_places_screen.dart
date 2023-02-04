import 'package:flutter/material.dart';
import 'package:ridetogetheruser/Models/predicted_places.dart';
import 'package:ridetogetheruser/Widgets/place_prediction_tile.dart';

import '../Assistants/request_assistant.dart';
import '../Global/map_key.dart';

class SearchPlaceScreen extends StatefulWidget {
  const SearchPlaceScreen({Key? key}) : super(key: key);

  @override
  State<SearchPlaceScreen> createState() => _SearchPlaceScreenState();
}

class _SearchPlaceScreenState extends State<SearchPlaceScreen> {

  List<PredictedPlaces> placePredictedList = [];

  void findPlaceAutoCompleteSearch(String inputText) async
  {
    if(inputText.length >1 )
      {
        String urlAutoCompleteSearch = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$inputText&key=$mapKey&components=country:IN";

        var responseAutoCompleteSearch = await RequestAssistant.receiveRequest(urlAutoCompleteSearch);

        if(responseAutoCompleteSearch == "Error Occurred Failed .No Response.")
          {
           return;
          }

        //print("this is response/result");
        //print(responseAutoCompleteSearch);

        if(responseAutoCompleteSearch["status"] == "OK")
          {
            var placePredictions = responseAutoCompleteSearch["predictions"];

            var placePredictionsList = (placePredictions as List).map((jsonData) => PredictedPlaces.fromJson(jsonData)).toList();

            setState((){
              placePredictedList = placePredictionsList;
            });

          }
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //search place UI
          SizedBox(height: 0,),
          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: Colors.yellow,
              boxShadow: [
                BoxShadow(
                  color: Colors.yellowAccent,
                  blurRadius: 8,
                  spreadRadius:0.5,
                  offset: Offset(
                    0.7,
                    0.7
                  ),
                )
              ]
            ),

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [

                  const SizedBox(height: 40,),

                  Stack(
                    children: [
                      GestureDetector(

                        onTap:()
                        {

                        },
                        child: const Icon(Icons.arrow_back,
                        color: Colors.black,
                        ),
                      ),

                    const Center(
                      child: Text(
                        "Search & Set DropOff Location",
                        style:TextStyle(
                          fontSize: 18.0,
                          color:Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ],
                  ),

                  const SizedBox(height: 1,),

                  Row(
                    children: [
                      const Icon(Icons.location_searching_rounded,
                      color:Colors.black,
                      size: 25,
                      ),
                      const SizedBox(height: 10,),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (valueTyped)
                            {
                              findPlaceAutoCompleteSearch(valueTyped);
                            },
                            decoration: const InputDecoration(
                              hintText: "search here..",
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                left: 11,top: 8,bottom: 8,
                              ),

                            ),
                          ),
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),

          //display place predictions list
          (placePredictedList.length > 0)
            ? Expanded(
              child: ListView.separated(
                itemCount:placePredictedList.length ,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index)
                {
                  return PlacePredictionTileDesign(
                    predictedPlaces: placePredictedList[index],
                  );

                },
                separatorBuilder: (BuildContext context, int index)
                {
                  return const Divider(
                    height: 1,
                    color: Colors.grey,
                    thickness: 1,
                  );
                },
              ),
            )
            : Container(),
        ],
      )
    );
  }
}
