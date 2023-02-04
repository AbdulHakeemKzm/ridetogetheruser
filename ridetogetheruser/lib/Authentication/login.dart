import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Global/global.dart';
import '../MainScreen/main_screen.dart';
import '../SplashScreen/splash_screen.dart';
import '../Widgets/progress_dialog.dart';
import 'signup.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();


  validateForm()
  {

    if(!emailTextEditingController.text.contains("@"))
    {
      Fluttertoast.showToast(msg: "Enter valid Email address");
    }
    else if(passwordTextEditingController.text.isEmpty)
    {
      Fluttertoast.showToast(msg: "Enter Password");
    }
    else
    {
      loginUserInfoNow();
    }
  }

  loginUserInfoNow() async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
        {
          return ProgressDialog(message: "Processing please wait",);
        }
    );

    final User? firebaseUser = (
        await fAuth.signInWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim(),
        ).catchError((msg){
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "Error" + msg.toString());
        })
    ).user;

    if(firebaseUser != null)
    {
      DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users");
      usersRef.child(firebaseUser.uid).once().then((userKey){

        final snap = userKey.snapshot;
        if(snap.value != null)
        {
          currentFirebaseUser = firebaseUser;
          Fluttertoast.showToast(msg: "Login Successful.");
          Navigator.push(context, MaterialPageRoute(builder: (c)=> MainScreen()));
        }
        else
        {
          Fluttertoast.showToast(msg: "Not Exist this email");
          fAuth.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (c)=> Splash()));
        }

      });

    }
    else
    {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "error in login");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              const SizedBox(height:150,),
          const Icon(
            Icons.person_rounded,
            color: Colors.black,
            size: 100,
          ),
          const Text(
            "Login as User",
            style: TextStyle(
              fontSize: 25,
              color:Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30,),


              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    color: Colors.black
                ),
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: 'abcd@gmail.com',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),

              TextField(
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: const TextStyle(
                    color: Colors.black
                ),
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: 'password',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              ElevatedButton(
                onPressed: ()
                {
                  validateForm();
                  //Navigator.push(context, MaterialPageRoute(builder: (c)=> MainScreen()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent,
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),

              TextButton(
                child: const Text(
                  "Donot hava Account?  Create Account",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: ()
                {
                  Navigator.push(context,MaterialPageRoute(builder: (c) =>SignUp()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
