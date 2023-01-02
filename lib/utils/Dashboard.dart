



import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/authentication_repository/authentication_repository.dart';

class Dash extends StatelessWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),

            ),
            Container(
              margin: EdgeInsets.all(25),
              child: ElevatedButton(
                child: Text('Logout', style: TextStyle(fontSize: 20.0),),

                onPressed: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  pref.remove("email");

                  AuthenticationRepository.instance.logout();
                },
              ),
            ),
          ]
          )),
    );
  }
}
