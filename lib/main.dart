import 'package:flutter/material.dart';
import 'package:test_speed_check/models/user.dart';
import 'package:test_speed_check/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:test_speed_check/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocal?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}