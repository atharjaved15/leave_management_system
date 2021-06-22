import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leave_management_system/home.dart';
import 'package:leave_management_system/leaveRequests.dart';
import 'package:leave_management_system/myAccount.dart';
import 'package:leave_management_system/sendLeaveRequest.dart';
import 'package:leave_management_system/signIn.dart';

class profileBody extends StatelessWidget {
  late String role;
  profileBody({
    required this.role,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              profileMenu(
                "My Account",
                Icons.account_circle,
                  () async {
                  var doc =  await FirebaseFirestore.instance.collection('Users').doc('$role').collection('userDetails').doc(FirebaseAuth.instance.currentUser!.uid).get();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => myAccount(email: doc['userEmail'], name: doc['userName'], role: role)));
                  }
              ),
              SizedBox(height: 20),
              profileMenu(
                "Leave Requests",
                Icons.notifications,
                      () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => leaveRequests(role: role)));
                  }
              ),
              SizedBox(height: 20),
              profileMenu(
                "Send Leave Request",
                Icons.comment,
                      () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => sendLeaveRequest(role: role,)));
                  }
              ),
              SizedBox(height: 20),
              profileMenu(
                "Logout",
                Icons.power_settings_new,
                      () async{
                    await FirebaseAuth.instance.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => signIn()));
                    Fluttertoast.showToast(msg: 'You have been successfully logged out');
                  }
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
  Widget profileMenu(String text , IconData icon, onPress){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: onPress,
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
