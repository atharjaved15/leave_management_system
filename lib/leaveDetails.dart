import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class details extends StatefulWidget {
  late String role,leaveDetails,date,leaveType,leaveDays,id,leaveID;
  details({
    required this.role,
    required this.leaveType,
    required this.id,
    required this.date,
    required this.leaveDays,
    required this.leaveDetails,
    required this.leaveID,
  });
  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {

  approveLeave()async{
    await FirebaseFirestore.instance.collection(widget.role).doc(widget.leaveID).update(
        {
          'requestStatus' : 'approved',
        });
    var doc = await FirebaseFirestore.instance.collection('Users').doc(widget.role).collection('userDetails').doc(widget.id).get();
    widget.leaveType == 'Allowed' ?  await FirebaseFirestore.instance.collection('Users').doc(widget.role).collection('userDetails').doc(widget.id).update({
      'allowedLeaves' : (int.parse(doc['allowedLeaves']) - int.parse(widget.leaveDays)).toString(),
    }).whenComplete(() => {
      Fluttertoast.showToast(msg: 'Successfully Approved !!'),
    }): await FirebaseFirestore.instance.collection('Users').doc(widget.role).collection('userDetails').doc(widget.id).update({
      'paidLeaves' : (int.parse(doc['paidLeaves']) - int.parse(widget.leaveDays)).toString(),
    }).whenComplete(() => {
      Fluttertoast.showToast(msg: 'Successfully Approved !!'),
    });
  }
  @override
  Widget build(BuildContext context) {

    FirebaseFirestore _firebase = FirebaseFirestore.instance;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Image(image: AssetImage('images/logo.png'),),
          ),
          backgroundColor: Colors.purple[800],
          title: Text('Leave Requests'  , style: TextStyle(color: Colors.white),),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.purple[800],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(widget.leaveDetails, style: TextStyle(fontSize: 20, color: Colors.white),),
                        Text('Dated : ' + widget.date, style: TextStyle(color: Colors.greenAccent , fontWeight: FontWeight.bold),),
                        Text('Number of Leaves : ' + widget.leaveDays , style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  MaterialButton(
                    onPressed: () async{
                      await approveLeave();
                      Navigator.pop(context);
                    },
                    height: MediaQuery.of(context).size.height * 0.04,
                    minWidth: MediaQuery.of(context).size.width *0.9,
                    color: Colors.green,
                    child: Center(
                      child: Text('Approve Leave', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () async{
                      await FirebaseFirestore.instance.collection('Faculty').doc(widget.leaveID).update(
                          {
                            'requestStatus' : 'declined',
                          }).whenComplete(() => {
                      Fluttertoast.showToast(msg: 'Request Declined!'),
                        Navigator.pop(context),
                      });
                    },
                    height: MediaQuery.of(context).size.height * 0.04,
                    minWidth: MediaQuery.of(context).size.width *0.9,
                    color: Colors.redAccent,
                    child: Center(
                      child: Text('Decline', style: TextStyle(color: Colors.white),),
                    ),
                  ),

                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
