import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homeScreen.dart';

class Timer extends StatefulWidget {
  Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
  DateTime Date = DateTime.now();

  static void periodic(Duration duration,  Function(dynamic timer) param1) {}
}

class _TimerState extends State<Timer> {

  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer ) {
      setState(() {
        Date = DateTime.now();
      });

    } );

    return Scaffold(
      appBar: AppBar(
        title: Text("Timer",style: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(55, 30, 0, 0),
                child: Container(
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 1,
                        blurRadius: 5,

                      ),
                    ],
                    shape: BoxShape.circle,

                  ),
                  child: Stack(
                    children: [
                      ...List.generate(60, (index) => Transform.rotate(
                        angle: (index*6*pi)/180,
                        child: Center(
                          child: Divider(
                            indent: (index%5==0)?290:290,
                            color: (index%5==0)?Colors.red:Colors.black,
                            thickness: (index%5==0)? 4 : 2 ,
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(85, 80, 0, 0),
                child: Container(
                  height: 300,
                  width: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    // color: Colors.black
                  ),child:  Center(
                  child: Stack(
                    children:[

                    ],
                  ),
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text('${Date.minute} : ',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),),

                    Text('${Date.second} :',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),),

                    Text('${Date.millisecond%100}',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),),
                  ],
                ),
              ),

            ],
          ),

          Row(
            children: [
              InkWell(onTap: (){

              },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 40, 0, 0),
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2,
                            spreadRadius: 0.5,
                          )
                        ]
                    ),child: Center(child: Text(" 5 minut",style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                  ),)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(80, 40, 0, 0),
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 2,
                          spreadRadius: 0.5,
                        )
                      ]
                  ),
                  child: Center(child: Text("15 minut",style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                  ),)),
                ),
              ),
            ],
          ),

          Column(

              children: [
                Container(
                  height: 113,
                ),
                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: Container(
                          height: 80,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    color: Colors.black
                                )
                              ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.watch_outlined,size: 40,color: Colors.black,),
                              Text('Clock',style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),),
                            ],
                          ),

                        ),
                      ),
                      Container(
                        height: 80,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  color: Colors.black
                              )
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.access_alarms,size: 40,),
                            Text('Alaram',style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),

                      ),
                      InkWell (
                        onTap:(){

                          Navigator.pushNamed(context, '/stopwatch');

                        }, child: Container(
                        height: 80,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  color: Colors.black
                              )
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timer,size: 40,),
                            Text('Stopwatch',style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),

                      ),
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Container(
                          height: 80,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    color: Colors.black
                                )
                              ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.watch_later_outlined,size: 40,color: Colors.white,),
                              Text('Timer',style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),),
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                )

              ]
          ),
        ],
      ),
    );
  }
}
