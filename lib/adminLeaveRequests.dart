import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leave_management_system/leaveDetails.dart';

class adminLeaveRequests extends StatefulWidget {
  late String type;
  adminLeaveRequests({
    required this.type,
  });
  @override
  _adminLeaveRequestsState createState() => _adminLeaveRequestsState();
}

class _adminLeaveRequestsState extends State<adminLeaveRequests> {
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
          child: StreamBuilder<QuerySnapshot>(
            stream:FirebaseFirestore.instance.collection(widget.type).snapshots(),
            builder: (context , snapshot){
              if(snapshot.hasData){
                final List<DocumentSnapshot> documents  = snapshot.data!.docs;
                return ListView(
                    children: documents
                        .map((doc) =>
                        InkWell(
                          onTap: (){
                            widget.type == 'HOD'? Navigator.push(context, MaterialPageRoute(builder: (context) => details(role: doc['userRole'], leaveType: doc['leaveType'], id: doc['userID'], date: doc['date'], leaveDays: doc['totalLeaves'], leaveDetails: doc['leaveDescription'],leaveID: doc.id.toString(),))): {};
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10 , right: 10 , bottom: 5, top: 10),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black87.withAlpha(180),
                                    ),
                                    height: 70,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                child: ClipOval(
                                                  child: new SizedBox(
                                                    height: 100,
                                                    width: 100,
                                                    child: Image.asset(
                                                      'images/logo.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 20,),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('UserID:  ' + doc['userID'], style: TextStyle(color: Colors.white , fontSize: 8),),
                                                  SizedBox(height: 5,),
                                                  Text(doc['leaveDescription'] , style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                                                  SizedBox(height: 5),
                                                  Text(doc['requestStatus'] , style: TextStyle(color: Colors.white),),

                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                ),
                              )
                          ),
                        )).toList()
                );
              }
              else
                return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
