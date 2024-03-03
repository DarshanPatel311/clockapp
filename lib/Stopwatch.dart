import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homeScreen.dart';

class stopwatch extends StatefulWidget {
  const stopwatch({super.key});

  @override
  State<stopwatch> createState() => _stopwatchState();
}

class _stopwatchState extends State<stopwatch> {
  late Stopwatch stopwatch;
  late Timer t;

  void handleStartStop() {
    if(stopwatch.isRunning) {
      stopwatch.stop();
    }
    else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;

    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");

    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();

    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("StopWatch",style: TextStyle(
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
                      Text(returnFormattedText(),style: TextStyle(
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
              InkWell(
                onTap: (){
                  stopwatch.start();
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 40, 0, 0),
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
                   ),child: Center(child: Text("Start",style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                  ),)),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  stopwatch.stop();
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(100, 40, 0, 0),
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
                    child: Center(child: Text("Stop",style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: ( ) {
                  stopwatch.reset();
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(145, 20, 0, 0),
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
                    child: Center(child: Text("Restart",style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),)),
                  ),
                ),
              ),

            ],
          ),
          Column(

              children: [
                Container(
                  height: 50,
                ),
                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
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



                        }, child: Container(
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
                            Icon(Icons.timer,size: 40,color: Colors.white,),
                            Text('Stopwatch',style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),),
                          ],
                        ),

                      ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/Timer');
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
                              Icon(Icons.watch_later_outlined,size: 40,),
                              Text('Timer',style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
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
