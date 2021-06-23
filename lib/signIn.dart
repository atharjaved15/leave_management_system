import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leave_management_system/home.dart';
import 'package:leave_management_system/signUp.dart';

class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  late String name,email,pass;

  TextEditingController nameController= new TextEditingController();

  TextEditingController emailController = new TextEditingController();

  TextEditingController passController = new TextEditingController();

  late String valueChoose = 'Faculty';
  int check =0;

  List listItems = ['Director', 'HOD', 'Faculty'];

  getValues(){
    name = nameController.text.toString();
    email = emailController.text.toString();
    pass = passController.text.toString();
  }
  Future<void> logIn(context) async {
    getValues();
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    try{
      UserCredential user = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      String Uid;
      Uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot doc = await firebaseFirestore
          .collection('Users')
          .doc('$valueChoose')
          .collection('userDetails')
          .doc('$Uid')
          .get();
      if (user != null && doc.exists && doc['userRole'] == valueChoose) {
        Fluttertoast.showToast(msg: "Logged In Successfully");


        var doc =  await FirebaseFirestore.instance.collection('Users').doc('$valueChoose').collection('userDetails').doc(FirebaseAuth.instance.currentUser!.uid).get();
        Navigator.push(context, MaterialPageRoute(builder: (context) => home(role: valueChoose, allowedLeaves: doc['allowedLeaves'], paidLeaves: doc['paidLeaves'],)));
      } else {
        Fluttertoast.showToast(msg: 'You are not registered as $valueChoose');
      }
    }
    catch(e){
      Fluttertoast.showToast(msg: e.toString());
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
          title: Text('Login'  , style: TextStyle(color: Colors.white),),
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
                    Image.asset('images/employee.png', height: MediaQuery.of(context).size.height * 0.15,),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                    Text('Login' , style: TextStyle(fontSize: 22, fontWeight:FontWeight.bold),),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        hintText: 'Email',
                        hoverColor: Colors.purple[800],
                        prefixIcon: Icon(Icons.admin_panel_settings_outlined),

                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    TextField(
                      controller: passController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        hintText: 'Password',
                        hoverColor: Colors.purple[800],
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: (){
                            setState(() {
                              if(check==0){check=1;}
                              else
                                check=0;
                            });
                          },
                          child: Icon(Icons.remove_red_eye ),
                        ),
                      ),
                      obscureText: check==0?true:false,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.2,),
                      child: DropdownButton(
                        hint: Text('Sign Up As'),
                        dropdownColor: Colors.white,
                        icon: Icon(
                          Icons.arrow_drop_down,
                        ),
                        isExpanded: true,
                        value: valueChoose,
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose = newValue.toString();
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
                       await logIn(context);
                      },
                      height: MediaQuery.of(context).size.height * 0.04,
                      minWidth: MediaQuery.of(context).size.width *0.9,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text('Log In', style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    SizedBox(height: 100,),
                    Text('Dont have an account?? '),
                    SizedBox(height: 10,),
                    MaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => signUp()));
                      },
                      height: MediaQuery.of(context).size.height * 0.04,
                      minWidth: MediaQuery.of(context).size.width *0.9,
                      color: Colors.red,
                      child: Center(
                        child: Text('Sign Up', style: TextStyle(color: Colors.white),),
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
