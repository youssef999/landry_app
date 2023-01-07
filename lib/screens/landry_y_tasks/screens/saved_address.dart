


 import 'package:course_app/screens/landry_y_tasks/models/item_model.dart';
import 'package:course_app/screens/landry_y_tasks/screens/order_screen.dart';
import 'package:course_app/screens/m_landry/maps/maps.dart';
import 'package:course_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SavedAddress extends StatelessWidget {
  List pricing;
  List order;
  String price;
  String cat;
  List <ItemModel>items;


  SavedAddress
      ({required this.pricing, required this.order, required this.price, required this.cat, required this.items});

  @override
   Widget build(BuildContext context) {

      final box=GetStorage();
      String address=box.read('address')??"";
      String address2=box.read('address2')??"";
      String city=box.read('city')??"";
      String status=box.read('status')??"";
      String country=box.read('country')??"";
      String code=box.read('code')??"";
      String latLong=box.read('latLong')??"";
      String time2=box.read('time2')??"";
      String time1=box.read('time1')??"";
      String phone=box.read('phone')??"";
      String date1=box.read('date1')??"";
      String date2=box.read('date2')??"";
     return Scaffold(
       appBar:AppBar(
         title:Custom_Text(
           text: "العنوان ",
           color:Colors.black,
           fontSize: 20,
           alignment: Alignment.center,
         ),
         backgroundColor:Colors.white,
       ),
       body:Column(
         children: [
           SizedBox(height: 20,),
           Card(
             child:Column(
               children: [
                 SizedBox(height: 10,),
                 Custom_Text(text: "عنوان الاستلام",fontSize: 11
                   ,color:Colors.grey,alignment:Alignment.center,),
                 Custom_Text(text: address,fontSize: 16,alignment:Alignment.center,),
                 SizedBox(height: 10,),
                 Custom_Text(text: "عنوان التسليم",fontSize: 11
                   ,color:Colors.grey,alignment:Alignment.center,),
                 Custom_Text(text: address2,fontSize: 16,alignment:Alignment.center,),
                 SizedBox(height: 10,),
                 Custom_Text(text: "المدينة ",fontSize: 11
                   ,color:Colors.grey,alignment:Alignment.center,),
                 Custom_Text(text: city,fontSize: 16,alignment:Alignment.center,),
                 SizedBox(height: 10,),
                 Custom_Text(text: "البلد ",fontSize: 11
                   ,color:Colors.grey,alignment:Alignment.center,),
                 Custom_Text(text: country,fontSize: 16,alignment:Alignment.center,),
                 SizedBox(height: 10,),
                 Custom_Text(text: "الرمز ",fontSize: 11
                   ,color:Colors.grey,alignment:Alignment.center,),
                 Custom_Text(text: code,fontSize: 16,alignment:Alignment.center,),
                 SizedBox(height: 10,),
                 Custom_Text(text: "ميعاد الاستلام ",fontSize: 11
                   ,color:Colors.grey,alignment:Alignment.center,),
                 Custom_Text(text: time1,fontSize: 16,alignment:Alignment.center,),
                 SizedBox(height: 10,),
                 Custom_Text(text: "ميعاد التسبيم ",fontSize: 11
                   ,color:Colors.grey,alignment:Alignment.center,),
                 Custom_Text(text: time2,fontSize: 16,alignment:Alignment.center,),
                 SizedBox(height: 10,),
                 Custom_Text(text: "رقم الهاتف",fontSize: 11
                   ,color:Colors.grey,alignment:Alignment.center,),
                 Custom_Text(text: phone,fontSize: 16,alignment:Alignment.center,),
                 SizedBox(height: 10,),
                 Custom_Text(text: "التاريخ ",fontSize: 11
                   ,color:Colors.grey,alignment:Alignment.center,),
                 SizedBox(height: 10,),
                 Custom_Text(text:"بتاريخ اليوم والتوصيل من يوم ل 3ايام",
                   fontSize: 13,alignment:Alignment.center,
                 color:Colors.black,
                 ),
                 SizedBox(height: 10,),
               ],
             ),
           ),
           SizedBox(height: 20,),
           Container(
             width: 140,
             child: RaisedButton(
               color:Colors.blueAccent,
                 child:Custom_Text(
                   text: "التالي ",
                   color:Colors.white,
                   alignment:Alignment.center,
                 ),
                 onPressed:(){

                   Get.to( OrderScreen(
                       pricing:pricing ,
                       order: order,
                       price: price,
                       cat: cat,
                       address:address,
                       address2: address2,
                       city:city,
                       status:status,
                       country:country,
                       code:code,
                       latLong: latLong,
                       placeMark: '',
                       time1:time1,
                       time2:time2,
                       phone:phone,
                       date1: date1,
                       date2: date2,
                       items:items

                   ));
             }),
           ),
           SizedBox(height: 20,),
           Container(
             width: 140,
             child: RaisedButton(
                 color:Colors.blueAccent,
                 child:Custom_Text(
                   text: " ادخل عنوان اخر ",
                   color:Colors.white,
                   alignment:Alignment.center,
                 ),
                 onPressed:(){

                   Get.to( MapsScreen(
                       cat:cat,
                       price: price,
                       order: order,
                       pricing: pricing,
                       items:items
                     // cat:widget.data
                   ));
                 }),
           ),
         ],
       ),
     );
   }
 }
