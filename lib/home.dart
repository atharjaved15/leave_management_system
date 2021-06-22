import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:leave_management_system/adminLeaveRequests.dart';
import 'package:leave_management_system/customNavBar.dart';
import 'package:leave_management_system/insideHome.dart';

class home extends StatelessWidget {
  late String role,allowedLeaves,paidLeaves;
  home({
    required this.role,
    required this.allowedLeaves,
    required this.paidLeaves,
});
  @override
  Widget build(BuildContext context) {
    return role=='Director'? Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Home Screen'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            Center(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => adminLeaveRequests(type: 'HOD')));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha(200),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:20.0, top: 20, bottom: 5),
                                        child: Text('See HODs ' , style: TextStyle(color: Colors.white , fontSize: 12  , fontWeight: FontWeight.bold),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0),
                                        child: Text('Leave Requests' , style: TextStyle(color: Colors.red , fontSize: 25  , fontWeight: FontWeight.bold),),
                                      ),

                                    ],
                                  ),
                                  SizedBox(width: 50),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.remove_from_queue , color: Colors.yellow, size: 60,),
                                      ),
                                    ],
                                  ),
                                ],

                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('You can see leave Requests by the HODs members' , style: TextStyle(color: Colors.white , fontSize: 10  ,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => adminLeaveRequests(type: 'Faculty')));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha(200),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:20.0, top: 20, bottom: 5),
                                        child: Text('See Faculty ' , style: TextStyle(color: Colors.white , fontSize: 12  , fontWeight: FontWeight.bold),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0),
                                        child: Text('Leave Requests' , style: TextStyle(color: Colors.red , fontSize: 25  , fontWeight: FontWeight.bold),),
                                      ),

                                    ],
                                  ),
                                  SizedBox(width: 50),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.remove_from_queue , color: Colors.yellow, size: 60,),
                                      ),
                                    ],
                                  ),
                                ],

                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('You can see leave Requests by the Faculty members' , style: TextStyle(color: Colors.white , fontSize: 10  ,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
      bottomNavigationBar: CustomBottomNavBar(role: role,),
    ):  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Home Screen'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Allowed Leaves' , style: TextStyle(color: Colors.white , fontSize: 14),),
                            Text( allowedLeaves , style: TextStyle(color: Colors.white , fontSize: 40 , fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Paid Leaves' , style: TextStyle(color: Colors.white , fontSize: 14),),
                            Text(paidLeaves , style: TextStyle(color: Colors.white , fontSize: 40 , fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 30,),
            Text('... Leaves History ...  '  ,style: TextStyle(color: Colors.grey),),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('leaveRequests').doc('requests').collection(FirebaseAuth.instance.currentUser!.uid).snapshots(),
                builder: (context , snapshot){
                  if(snapshot.hasData){
                    final List<DocumentSnapshot> documents  = snapshot.data!.docs;
                    return ListView(
                        children: documents
                            .map((doc) =>
                            InkWell(
                              onTap: (){
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => details(role: doc['userRole'], leaveType: doc['leaveType'], id: doc['userID'], date: doc['date'], leaveDays: doc['totalLeaves'], leaveDetails: doc['leaveDescription'],leaveID: doc.id.toString(),)));

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
                                                      Text('Date:  ' + doc['date'], style: TextStyle(color: Colors.white , fontSize: 8),),
                                                      SizedBox(height: 5,),
                                                      Text(doc['leaveDescription'] , style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),

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

          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(role: role,),
    );
  }
}
