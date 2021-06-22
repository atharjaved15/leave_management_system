import 'package:flutter/material.dart';
import 'package:leave_management_system/signIn.dart';

import 'home.dart';

class myAccount extends StatelessWidget {
  late String name, email, role;
  myAccount({
    required this.email,
    required this.name,
    required this.role,
});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('You are logged in as : $role'),
                        Text('Welcome : $name'),
                        Text('$email'),
                      ],
                    ),
                    //SizedBox(height: 348,),

                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
