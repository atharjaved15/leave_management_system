import 'package:flutter/material.dart';
import 'package:leave_management_system/home.dart';
import 'package:leave_management_system/profileBody.dart';

class CustomBottomNavBar extends StatelessWidget {

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
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder:(context) => home())),
              ),
              IconButton(
                icon: Icon(
                  Icons.details_rounded,
                  color: Colors.white,
                ),
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder:(context) => profileBody())),
              ),

            ],
          )),
    );
  }
}