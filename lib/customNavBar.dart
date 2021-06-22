import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:leave_management_system/home.dart';
import 'package:leave_management_system/profileBody.dart';

class CustomBottomNavBar extends StatelessWidget {
  late String role;
  CustomBottomNavBar({
   required this.role,
});
  @override
  Widget build(BuildContext context) {
    var inActiveIconColor = Colors.grey[400];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () async {
                  var doc =  await FirebaseFirestore.instance.collection('Users').doc('$role').collection('userDetails').doc(FirebaseAuth.instance.currentUser!.uid).get();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => home(role: role,allowedLeaves: doc['allowedLeaves'], paidLeaves: doc['paidLeaves'],)));
                }
              ),
              IconButton(
                icon: Icon(
                  Icons.details_rounded,
                  color: Colors.white,
                ),
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder:(context) => profileBody(role: role,))),
              ),

            ],
          )),
    );
  }
}