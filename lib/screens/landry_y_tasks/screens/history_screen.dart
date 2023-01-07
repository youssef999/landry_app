


 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/resources/color_manager.dart';
import 'package:course_app/screens/landry_y_tasks/controllers/order_controller.dart';
import 'package:course_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HistoryScreen extends StatelessWidget {
   const HistoryScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

     final box=GetStorage();
     String e=box.read('email')??"";

     return Scaffold(
       appBar:AppBar(
         title:Custom_Text(
           text: "الطلب",
           color:Colors.black,
           fontSize: 20,
           alignment: Alignment.center,
         ),
         backgroundColor:Colors.white,
       ),
       backgroundColor:Colors.grey[200],
       body: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child:Column(
             children: [
               SizedBox(height: 10,),
               Padding(
                   padding: const EdgeInsets.only(left:30.0,right: 30.0),
                   child: StreamBuilder(
                       stream: FirebaseFirestore.instance
                           .collection('orders').where('email',isEqualTo: e)
                           .snapshots(),
                       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                         if (!snapshot.hasData)   return Center(
                             child: CircularProgressIndicator()
                         );
                         switch (snapshot.connectionState) {
                           case ConnectionState.waiting:
                             return Center(
                                 child: CircularProgressIndicator()
                             );
                           default:

                             if(snapshot.data!.docs.length>0){
                               return GetBuilder(
                                   init:OrderController(),
                                   builder: (context) {
                                     return Container(
                                       height: 3000,
                                       child:
                                       ListView.builder(
                                           //scrollDirection: Axis.vertical,
                                           itemCount: snapshot.data!.docs.length,
                                           itemBuilder: (BuildContext context, int index) {
                                             DocumentSnapshot posts = snapshot.data!.docs[index];

                                           return Container(
                                             height: 130,
                                             child: Card(
                                               child: Column(
                                                 children: [
                                                   SizedBox(height: 10,),
                                                  Directionality(
                                                    textDirection: TextDirection.rtl,
                                                     child: Row(
                                                       children: [

                                                         SizedBox(width: 10,),
                                                         Column(
                                                           children: [
                                                             Container(
                                                               width:70,
                                                               height:35,
                                                               decoration:BoxDecoration(
                                                                 borderRadius:BorderRadius.circular(20),
                                                                 color:Colors.blueAccent
                                                               ),
                                                               child: Custom_Text(text: "" + posts['status'],
                                                                 fontSize:15,
                                                                 color:Colors.white,
                                                                 alignment:Alignment.center,
                                                               ),
                                                             ),

                                                           ],
                                                         ),
                                                         SizedBox(width:60,),
                                                         Custom_Text(text: "رقم الطلب " + " :  "+ posts['code_num'],
                                                         fontSize:12,
                                                            color:ColorManager.black,
                                                           alignment:Alignment.center,
                                                         ),
                                                       ],
                                                     ),
                                                   ),
                                                   SizedBox(height:5,),
                                                  Directionality(
                                                     textDirection: TextDirection.rtl,
                                                     child: Row(
                                                       mainAxisAlignment:MainAxisAlignment.center,
                                                       children: [
                                                         SizedBox(width:10,),
                                                         Custom_Text(text: "" + posts['total'],
                                                           fontSize:17,
                                                           color:Colors.black,
                                                           alignment:Alignment.center,
                                                         ),
                                                         SizedBox(width:100,),
                                                         Column(
                                                           children: [
                                                             Custom_Text(
                                                               text: " استلام : "+ posts['time1'],
                                                               fontSize:15,
                                                               color:ColorManager.black,
                                                               alignment:Alignment.center,
                                                             ),
                                                             SizedBox(height:5,),
                                                             Custom_Text(text: "توصيل : " + posts['time2'],
                                                               fontSize:15,
                                                               color:ColorManager.black,
                                                               alignment:Alignment.center,
                                                             ),
                                                             SizedBox(height:5,),
                                                           ],
                                                         ),

                                                       ],
                                                     ),
                                                   ),




                                                 ],
                                               ),
                                             ),
                                           );
                                           }),
                                     );
                                   }
                               );
                             }else{
                               return Center(
                                 child:Custom_Text(
                                   text: "",
                                   alignment:Alignment.center,
                                   fontSize: 22,
                                 ),
                               );
                             }



                         }})
               ),
             ],
           ),
         ),
       ),
     );
   }
 }
