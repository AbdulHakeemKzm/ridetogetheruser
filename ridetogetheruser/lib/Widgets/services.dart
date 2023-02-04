import 'package:flutter/material.dart';

import '../MainScreen/main_screen.dart';



class ServiceTab extends StatefulWidget {
  const ServiceTab({Key? key}) : super(key: key);

  @override
  State<ServiceTab> createState() => _ServiceTabState();
}

class _ServiceTabState extends State<ServiceTab> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Services"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 100,),
                Column(
                  children: [
                    Row(
                      children: [
                        ElevatedButton(

                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Share Ride'),
                              content: const Text('Description'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (c) => MainScreen()));
                                  },
                                  child: const Text('Go Next'),
                                ),
                              ],
                            ),
                          ),
                          child: Container(
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Icon(Icons.car_repair_outlined,
                                      size: 50,
                                  ),
                                  Text(
                                      "Share Ride",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  ),
                                ],
                              ),
                            ),
                            color: Colors.yellow,
                            height: 100,
                            width: 130,
                          ),
                        ),
                        const SizedBox(width: 24,),
                        ElevatedButton(
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Bike Taxi'),
                              content: const Text('Description'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (c) => MainScreen()));
                                  },
                                  child: const Text('Go Next'),
                                ),
                              ],
                            ),
                          ),
                          child: Container(
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Icon(Icons.motorcycle_sharp,
                                    size: 50,
                                  ),
                                  Text(
                                    "Bike Taxi",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            color: Colors.yellow,
                            height: 100,
                            width: 130,
                          ),
                        ),
                      ]
                    ),
                  ],
                ),


                /////////////////////////

                const SizedBox(height: 20,),
                Column(
                  children: [
                    Row(
                        children: [
                          ElevatedButton(
                            onPressed: (){

                            },
                            child: Container(
                              child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10,),
                                      Icon(Icons.car_rental_outlined,
                                        size: 50,
                                      ),
                                      Text(
                                        "Pre Booking",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              color: Colors.yellow,
                              height: 100,
                              width: 130,
                            ),
                          ),
                          const SizedBox(width: 24,),
                          ElevatedButton(
                            onPressed: (){

                            },
                            child: Container(
                              child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10,),
                                      Icon(Icons.electric_rickshaw_outlined,
                                        size: 50,
                                      ),
                                      Text(
                                        "Auto Taxi",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              color: Colors.yellow,
                              height: 100,
                              width: 130,
                            ),
                          ),
                        ]
                    ),
                  ],
                ),


//////////////////////////////////////

                const SizedBox(height: 20,),
                Column(
                  children: [
                    Row(
                        children: [
                          ElevatedButton(
                            onPressed: (){

                            },
                            child: Container(
                              child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10,),
                                      Icon(Icons.car_crash_outlined,
                                        size: 50,
                                      ),
                                      Text(
                                        "Rent Car",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              color: Colors.yellow,
                              height: 100,
                              width: 130,
                            ),
                          ),
                          const SizedBox(width: 24,),
                          ElevatedButton(
                            onPressed: (){

                            },
                            child: Container(
                              child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10,),
                                      Icon(Icons.local_taxi,
                                        size: 50,
                                      ),
                                      Text(
                                        "Car Taxi",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              color: Colors.yellow,
                              height: 100,
                              width: 130,
                            ),
                          ),
                        ]
                    ),
                  ],
                ),

/////////////////////////////////
                const SizedBox(height: 20,),
                Column(
                  children: [
                    Row(
                        children: [
                          ElevatedButton(
                            onPressed: (){

                            },
                            child: Container(
                              child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10,),
                                      Icon(Icons.electric_car_outlined,
                                        size: 50,
                                      ),
                                      Text(
                                        "Go Green",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              color: Colors.yellow,
                              height: 100,
                              width: 130,
                            ),
                          ),
                          const SizedBox(width: 24,),
                          ElevatedButton(
                            onPressed: (){

                            },
                            child: Container(
                              child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10,),
                                      Icon(Icons.directions_bike,
                                        size: 50,
                                      ),
                                      Text(
                                        "Test Ride",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              color: Colors.yellow,
                              height: 100,
                              width: 130,
                            ),
                          ),
                        ]
                    ),
                  ],
                ),
              ],

            ),
          ) ,
        ),
      ),

    );
  }
}
