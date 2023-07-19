import 'package:firebase_auth/firebase_auth.dart';
import 'package:ridetogetheruser/models/direction_details_info.dart';
import 'package:ridetogetheruser/models/user_model.dart';




final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
UserModel? userModelCurrentInfo;
List dList = []; //online-active drivers Information List
DirectionDetailsInfo? tripDirectionDetailsInfo;
String? chosenDriverId="";
String cloudMessagingServerToken = "key=AAAAs6rlfD8:APA91bGR_7OwlSGPGRaAdWSZiSIrqzwd1Nmt_gpFLRMfOSSHoOjgrSYTNyuZnIKpPqhxmZrlBK0jtivlAFO2yHMueUMJqsFqAU5E5fJOTmzaMbcjTMtZeD7ufAqE5WTkkANcLX20Xi-M";
String userDropOffAddress = "";
String driverCarDetails="";
String driverName="";
String driverPhone="";
double countRatingStars=0.0;
String titleStarsRating="";
