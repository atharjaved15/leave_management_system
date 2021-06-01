import 'package:flutter/material.dart';
import 'package:leave_management_system/signIn.dart';

import 'home.dart';

class getStarted extends StatelessWidget {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Center(
                          child:  Image.asset('images/logo.png', fit: BoxFit.cover, height: 100,),
                        ),
                        SizedBox(height: 50,),
                        Center(
                          child:Text('COMSATS UNIVERSITY ISLAMABAD' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold , color: Colors.purple[800]), ),
                        ),
                        Center(
                          child:Text('Leave Management System' , style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic , color: Colors.black), ),
                        ),
                      ],
                    ),
                    //SizedBox(height: 348,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100.0),
                      child: MaterialButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => signIn()));
                      },
                        child: Container(
                          height: 30,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.blue[400],
                          ),
                          child: Center(child: Text('Get Started' , style: TextStyle(color: Colors.white),)),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
