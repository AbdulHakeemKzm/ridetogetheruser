import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text(
            'About us'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Ride Together is a decentralized platform for sharing taxi services. '
                    'It is built using blockchain technology to ensure transparency, security and reliability in all transactions. '
                    'With Share taxi Blockchain, users can easily book taxi services, track their rides, and make secure payments using cryptocurrency. '
                    'No more need to worry about overcharging, security, or lack of transparency. '
                    'The blockchain technology ensures that all transactions are secure, tamper-proof, and easily accessible to users. '
                    'Join the revolution of sharing taxi services with Share taxi Blockchain!',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


