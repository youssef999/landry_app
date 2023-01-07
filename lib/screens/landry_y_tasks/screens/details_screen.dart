


 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/resources/color_manager.dart';
import 'package:course_app/screens/landry_y_tasks/controllers/landrt_controller.dart';
import 'package:course_app/screens/landry_y_tasks/models/item_model.dart';
import 'package:course_app/screens/landry_y_tasks/screens/saved_address.dart';
import 'package:course_app/screens/m_landry/maps/maps.dart';
import 'package:course_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../home/widget/Bottom_bar.dart';

class DetailsScreen extends StatefulWidget {
   String data;
   DetailsScreen({required this.data});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
   final controller=Get.put(LandryController());
  double price=0;
  List<ItemModel> itemData=[];

  @override
   Widget build(BuildContext context) {


     if(widget.data!=null){
       controller.price=0;
     }
     return Scaffold(
       body: Padding(
         padding: const EdgeInsets.only(left:13.0),
         child: ListView(
           children: [
             SizedBox(height: 20,),
             Row(
               children: [
                 IconButton(onPressed: (){

                    Get.offAll(BottomBar());

                 }, icon: Icon(Icons.arrow_back_ios_sharp)),
                 SizedBox(width: 20,),
                 Custom_Text(text: "${widget.data}",
                 fontSize:18,
                   color:Colors.black,
                   alignment:Alignment.center,
                 ),
               ],
             ),

             SizedBox(height: 20,),

             Padding(
                 padding: const EdgeInsets.only(left:18.0,right: 18.0),
                 child: StreamBuilder(
                     stream: FirebaseFirestore.instance
                         .collection('cat')
                     //.where('cat',isEqualTo:controller.cat)
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
                                 init: LandryController(),
                                 builder: (context) {
                                   return Container(
                                     height: 60,
                                     child:
                                     ListView.builder(
                                         scrollDirection: Axis.horizontal,
                                         itemCount: snapshot.data!.docs.length,
                                         itemBuilder: (BuildContext context, int index) {
                                           DocumentSnapshot posts = snapshot.data!.docs[index];

                                           if(posts['name']==controller.cat)
                                             return
                                               InkWell(
                                                 child: Container(
                                                   child: Card(
                                                     color:Colors.blue,
                                                     child: Container(
                                                       decoration: BoxDecoration(
                                                           borderRadius:BorderRadius.circular(17)
                                                       ),
                                                       padding:EdgeInsets.only(left: 16,right: 16,top:3,bottom: 3),
                                                       child: Custom_Text(
                                                         text:  posts['name'],
                                                         color:ColorManager.white,
                                                         fontSize: 13,
                                                         alignment:Alignment.center,
                                                       ),
                                                     ),
                                                   ),
                                                 ),
                                                 onTap:() {
                                                   controller.changeCat(posts['name']);
                                                 },
                                               );

                                           else
                                             return
                                               InkWell(
                                                   child: Container(
                                                     child: Card(
                                                       color:Colors.grey,
                                                       child: Container(
                                                         decoration: BoxDecoration(
                                                             borderRadius:BorderRadius.circular(17)
                                                         ),
                                                         padding:EdgeInsets.only(left: 16,right: 16,top:3,bottom: 3),
                                                         child: Custom_Text(
                                                           text:  posts['name'],
                                                           color:ColorManager.black,
                                                           fontSize: 13,
                                                           alignment:Alignment.center,
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                   onTap:(){

                                                     controller.changeCat( posts['name']);

                                                   }

                                               );
                                         }),
                                   );
                                 }
                             );
                           }else{
                            return Center(
                               child:Custom_Text(
                                 text: "لا يوجد بيانات",
                               ),
                             );
                           }



                       }})
             ),
             SizedBox(height: 20,),
             Padding(
                 padding: const EdgeInsets.only(left:18.0,right: 18.0),
                 child: GetBuilder(
                   init: LandryController(),
                   builder: (context) {
                     return StreamBuilder(
                         stream: FirebaseFirestore.instance
                             .collection('${widget.data}')
                             .where('cat',isEqualTo:controller.cat)
                         .snapshots(),
                         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                           if (!snapshot.hasData) return Center(child: Text('Loading'));
                           switch (snapshot.connectionState) {
                             case ConnectionState.waiting:
                               return new Text('Loading...');
                             default:
                               return Container(
                                 height: 900,
                                 child:

                                 ListView.builder(
                                     scrollDirection: Axis.vertical,
                                     itemCount: snapshot.data!.docs.length,
                                     itemBuilder: (BuildContext context, int index) {
                                       DocumentSnapshot posts = snapshot.data!.docs[index];
                                      // int quant=posts['quant'];
                                       return Column(
                                         children: [
                                           SizedBox(height: 20,),

                                           Container(
                                              height: 50,
                                             child: Row(
                                               children: [
                                                 SizedBox(width: 1,),
                                                 Container(
                                                   child: Custom_Text(
                                                     text:  posts['name'],
                                                     color:ColorManager.black,
                                                     fontSize: 13,
                                                     alignment:Alignment.center,
                                                   ),
                                                 ),
                                                 SizedBox(width: 20,),
                                                 Container(
                                                   child: Custom_Text(
                                                     text: "سعر الوحدة "+"\$"+ posts['price'].toString(),
                                                     color:Colors.black54,
                                                     fontSize: 10,
                                                     alignment:Alignment.center,
                                                   ),
                                                 ),
                                                 SizedBox(width: 40,),
                                                 GetBuilder(
                                                   init: LandryController(),
                                                   builder: (context) {


                                                     return Row(
                                                       children: [
                                                         IconButton(onPressed:() async{

                                                           ItemModel item=ItemModel(posts['name'], posts['price'].toString());

                                                           controller.removeItem(item);


                                                         }, icon: Icon(Icons.remove_circle_outline)),
                                                         SizedBox(width: 3,),

                                                         Custom_Text(text: '1'.toString(),
                                                         fontSize:15,
                                                           alignment:Alignment.center,
                                                         ),

                                                         SizedBox(width: 3,),
                                                         IconButton(onPressed:()
                                                         async

                                                         {
                                            ItemModel item =
                                            ItemModel(posts['name'], posts['price'].toString());
                                                           controller.addPrice(double.parse(posts['price'].toString()));
                                                           controller.addItems(item);
                                                         //   controller.addPricing(posts['price'].toString());

                                                         }, icon: Icon(Icons.add_circle_outline,
                                                         color:Colors.blue,
                                                         ))
                                                       ],
                                                     );
                                                   }
                                                 )
                                               ],
                                             ),
                                           ),
                                           Divider()
                                         ],
                                       );
                                     }),
                               );
                           }});
                   }
                 )
             ),

         Center(child: CircularProgressIndicator())
           ],
         ),
       ) ,
       bottomNavigationBar:Container(
         child: InkWell(
           child: Padding(
             padding: const EdgeInsets.only(left:11.0,right: 11,bottom:20),
             child: Container(
               height: 40,
               color:Colors.blue,
               child: GetBuilder(
                 init: LandryController(),
                 builder: (context) {
                   return Center(
                     child: Text("الاجمالي   "+" "+controller.price.toString(),
                      style:TextStyle(
                        color:Colors.white,
                        fontSize: 17
                      ),
                     ),
                   );
                 }
               ),
             ),
           ),
           onTap:(){
             final box=GetStorage();
             String address=box.read('address')??"x";


             if(controller.price>0 && address=='x'){

               Get.to( MapsScreen(
                   cat: controller.cat,
                   price: controller.price.toString(),
                   order: controller.nameList,
                   pricing: controller.pricingList,
                   items:controller.orderItems
                 // cat:widget.data
               ));
             }

             else if(address!='x'){
              Get.to( SavedAddress(
                cat:controller.cat.toString(),
                price:controller.price.toString() ,
                  order: controller.nameList,
                  pricing: controller.pricingList,
                  items:controller.orderItems
              ));
             }
             else{

               Get.snackbar ("!!!", "يجب ان يتعدي الاجمالي 0 ",
               backgroundColor: Colors.black,
                 colorText:Colors.white,
                 snackPosition:SnackPosition.BOTTOM
               );

             }
            // itemData.add(controller.orderItems)

             // Get.to(OrderScreen(
             //   cat: controller.cat,
             //   price: controller.price.toString(),
             //   order: controller.orderItems,
             //   pricing: controller.pricingList
             //
             // ));
           },
         ),
       ),

     );
   }
}
