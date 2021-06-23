import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leave_management_system/home.dart';
import 'package:leave_management_system/signUp.dart';

class sendLeaveRequest extends StatefulWidget {
  late String role;
  sendLeaveRequest({
   required this.role,
});
  @override
  _sendLeaveRequestState createState() => _sendLeaveRequestState();
}

class _sendLeaveRequestState extends State<sendLeaveRequest> {
  late String totalLeaves,leaveDescription;

  TextEditingController leaveDescritpionController= new TextEditingController();
  TextEditingController totalLeavesController = new TextEditingController();

  late String leaveType = 'Allowed';

  List listItems = ['Allowed', 'Paid'];

  getValues(){
    leaveDescription = leaveDescritpionController.text.toString();
    totalLeaves = totalLeavesController.text.toString();
  }
  sendLeaveRequest() async {
   if(leaveDescription.isNotEmpty && totalLeaves.isNotEmpty){
     await FirebaseFirestore.instance.collection(widget.role).doc().set({
       'leaveType': leaveType,
       'leaveDescription' : leaveDescription,
       'totalLeaves' : totalLeaves,
       'date' : DateTime.now().toString(),
       'requestStatus' : 'sent',
       'userRole' : widget.role,
       'userID': FirebaseAuth.instance.currentUser!.uid.toString(),
     }).whenComplete(() => {
       Fluttertoast.showToast(msg: 'Leave Request sent to Higher Authorities!!'),
     });
   }
   else{
     Fluttertoast.showToast(msg: 'Kindly Input all the details!!');
   }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Image(image: AssetImage('images/logo.png') ),
          ),
          backgroundColor: Colors.purple[800],
          title: Text('Send Leave Request'  , style: TextStyle(color: Colors.white),),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top:20, left: 10,right: 10,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                    Text('Send Leave Request' , style: TextStyle(fontSize: 22, fontWeight:FontWeight.bold),),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                    TextField(
                      controller: leaveDescritpionController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        hintText: 'Leave Description',
                        hoverColor: Colors.purple[800],
                        prefixIcon: Icon(Icons.admin_panel_settings_outlined),

                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                    TextField(
                controller: totalLeavesController,
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  hintText: 'Total Leaves',
                  hoverColor: Colors.purple[800],
                  prefixIcon: Icon(Icons.admin_panel_settings_outlined),

                ),
              ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.2,),
                      child: DropdownButton(
                        hint: Text('leaveType'),
                        dropdownColor: Colors.white,
                        icon: Icon(
                          Icons.arrow_drop_down,
                        ),
                        isExpanded: true,
                        value: leaveType,
                        onChanged: (newValue) {
                          setState(() {
                            leaveType = newValue.toString();
                          });
                        },
                        items: listItems.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                    MaterialButton(
                      onPressed: () async{
                        getValues();
                        await sendLeaveRequest();
                      },
                      height: MediaQuery.of(context).size.height * 0.04,
                      minWidth: MediaQuery.of(context).size.width *0.9,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text('Send Leave Request', style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ),
      ),
    );
  }
}
