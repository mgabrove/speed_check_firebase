import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_speed_check/models/user.dart';

import 'package:test_speed_check/screens/home/home.dart';
import 'package:test_speed_check/services/auth.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();

    () async {
      dynamic result = await _auth.signInAnon();
      if(result == null) {
        print("error signing in");
      } else {
        print("signed in");
        print(result.uid);
      }
    }();

    final user = Provider.of<UserLocal?>(context);
    print(user);

    return Home();
  }
}
