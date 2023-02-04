import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: Colors.yellow,
        title: Text(
          "History",
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
      ),

      body: ListView.separated(
        itemBuilder: (context, position) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    'Ride $position',
                  ),
                  SizedBox(width: 200,),
                  Icon(Icons.lock_clock),

                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, position) {
          return Card(
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              // child: Text(
              //   'Separator $position',
              //   style: TextStyle(color: Colors.white),
              // ),
            ),
          );
        },
        itemCount: 30,
      ),


    );
  }
}
