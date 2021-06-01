import 'package:flutter/material.dart';

class profileBody extends StatelessWidget {
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
              ),
              SizedBox(height: 20),
              profileMenu(
                "Notifications",
                Icons.notifications,
              ),
              SizedBox(height: 20),
              profileMenu(
                "Feedback",
                Icons.comment,
              ),
              SizedBox(height: 20),
              profileMenu(
                "Logout",
                Icons.power_settings_new,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
  Widget profileMenu(String text , IconData icon){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: (){},
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
