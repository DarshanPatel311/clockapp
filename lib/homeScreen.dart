import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}
DateTime Date=DateTime.now();


class _ClockState extends State<Clock> {
  @override

  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
 setState(() {
   Date = DateTime.now();
 });
    } );
        return Scaffold(
          backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text("Clock App",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),


          ],
        ),


      ),
          body: Column(
            children: [
             Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                   child: Container(
                       height: 50,
                       width: 40,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         color: Colors.white,
                       ),
                       child: Icon(Icons.add,color: Colors.black,size: 35)),
                 ),
                 Spacer(),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                   child: Container(
                       height: 50,
                       width: 40,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         color: Colors.white,
                       ),
                       child: Icon(Icons.edit,color: Colors.black,size: 25)),
                 ),
               ],
             ),
             Stack(
               children: [
                 Padding(
                   padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                   child: Container(
                     height: 400,
                     width: 300,
                     decoration: BoxDecoration(
                       color: Color(0xff424242),
                       boxShadow: [
                         BoxShadow(
                          color: Colors.white,
                           spreadRadius: 1,
                           blurRadius: 5,

                         ),
                       ],
                       shape: BoxShape.circle,

                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(45, 80, 0, 0),
                   child: Container(
                     height: 300,
                     width: 250,
                     decoration: BoxDecoration(
                       boxShadow: [
                         BoxShadow(
                           color: Colors.white,

                           blurRadius: 5,

                         ),
                       ],
                       shape: BoxShape.circle,
                       color: Colors.black,
                       // color: Colors.black
                     ),child:  Center(
                       child: Stack(
                         children:[

                           Transform.rotate(angle: Date.second * 6 * pi/180,
                         child: VerticalDivider(
                           color: Colors.red ,
                           thickness: 3,
                           indent: 30,
                           endIndent: 110,
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
                           Transform.rotate(angle: Date.hour * 30 * pi/180+((6*pi/180)*(Date.minute/12)),
                             child: VerticalDivider(
                               color: Colors.white ,
                               thickness: 7,
                               indent: 60,
                               endIndent: 130,
                             ),
                           ),
                           ],
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(145, 220, 0, 0),
                   child: Container(
                     height: 20,
                     width: 50,
                     decoration: BoxDecoration(

                       shape: BoxShape.circle,
                       color: Colors.white,
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
                  color: Colors.white,

                  fontSize: 25,
                ),),

              ],

            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${ Date.hour %12}:${ Date.minute }:${ Date.second }',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40,
                  ),),
                ],
              )
            ],
          ),
    );
  }
}
