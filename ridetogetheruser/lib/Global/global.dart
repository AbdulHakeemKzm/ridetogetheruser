import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ridetogetheruser/Models/user_model.dart';

import '../Models/direction_details_info.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;

UserModel? userModelCurrentInfo;

List dList = []; //online/active driver list contain driversKeys list

DirectionDetailsInfo? tripDirectionDetailsInfo;