import 'package:flutter/material.dart';
import 'package:leave_management_system/customNavBar.dart';
import 'package:leave_management_system/insideHome.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            Text('2' , style: TextStyle(color: Colors.white , fontSize: 40 , fontWeight: FontWeight.bold),)
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
                            Text('4' , style: TextStyle(color: Colors.white , fontSize: 40 , fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 30,),
            Text('... Leaves History ...  '  ,style: TextStyle(color: Colors.grey),),
            InkWell(
              onTap: (){
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
                                      Text('Date and Time', style: TextStyle(color: Colors.white , fontSize: 8),),
                                      SizedBox(height: 5,),
                                      Text('Leave Type', style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),

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
            ),
            SizedBox(height: 4,),
            InkWell(
              onTap: (){
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
                                      Text('Date and Time', style: TextStyle(color: Colors.white , fontSize: 8),),
                                      SizedBox(height: 5,),
                                      Text('Leave Type', style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),

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
            ),
            SizedBox(height: 4,),
            InkWell(
              onTap: (){
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
                                      Text('Date and Time', style: TextStyle(color: Colors.white , fontSize: 8),),
                                      SizedBox(height: 5,),
                                      Text('Leave Type', style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),

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
            ),
            SizedBox(height: 4,),

          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
