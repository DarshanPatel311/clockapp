import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}
DateTime Date = DateTime.now();


class _ClockState extends State<Clock> {
  @override

  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
 setState(() {
   Date = DateTime.now();
 });
    } );
        return Scaffold(
          backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text("Clock App",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
          ],
        ),
        automaticallyImplyLeading: false,

      ),
          body: Column(
            children: [
             
             Stack(
               children: [
                 Padding(
                   padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
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
                               indent: (index%5==0)?240:290,
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
                   padding: const EdgeInsets.fromLTRB(35, 80, 0, 0),
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

                           Transform.rotate(angle: Date.second * 6 * pi/180,
                         child: VerticalDivider(
                           color: Colors.red ,
                           thickness: 2,
                           indent: 30,
                           endIndent: 110,
                         ),
                           ),
                           Transform.rotate(angle: Date.hour * 30 * pi/180+((6*pi/180)*(Date.minute/12)),
                             child: VerticalDivider(
                               color: Colors.black ,
                               thickness: 6,
                               indent: 60,
                               endIndent: 130,

                             ),
                           ),
                           Transform.rotate(angle: Date.minute * 6 * pi/180,
                             child: VerticalDivider(
                               color: Colors.grey ,
                               thickness: 4,
                               indent: 50,
                               endIndent: 130,
                             ),
                           ),

                           ],
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(135, 220, 0, 0),
                   child: Container(
                     height: 20,
                     width: 50,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.black,
                       // color: Colors.black
                     ),
                   ),
                 ),
               ],
             ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Surat",style: TextStyle(
                  color: Colors.black,

                  fontSize: 25,
                ),),

              ],

            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${ Date.hour %12}:${ Date.minute.toString().padLeft(2,'0') }:${ Date.second .toString().padLeft(2,'0')}',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 40,
                  ),),
                  Text((Date.day>= 12)?' AM':' PM',style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,

                  ),),
                ],
              ),

              Column(

                children: [
                  Container(
                  height: 100,
                  ),
                    Container(

                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Container(
                           height: 80,
                           width: 70,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 1,
                                color: Colors.white
                              )
                            ]
                          ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Icon(Icons.watch_outlined,size: 40,color: Colors.white,),
                               Text('Clock',style: TextStyle(
                                 fontSize: 11,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.white
                               ),),
                             ],
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
              )


    );
  }
}
