

  
 import 'package:course_app/screens/landry_y_tasks/controllers/order_controller.dart';
import 'package:course_app/screens/landry_y_tasks/screens/details_screen.dart';
import 'package:course_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/item_model.dart';

class OrderScreen extends StatelessWidget {

    String cat,price,address,address2,city,country,status,code;
    List order;
    List pricing;
    String latLong;
    String placeMark;
    String time1;
    String time2;
    String phone;
     String date1;
     String date2;
   List <ItemModel>items;
    OrderScreen({required this.cat, required this.price, required this.order,required this.pricing,
    required this.country,required this.city,required this.address,required this.address2
      ,required this.code,required this.status,required this.latLong,required this.placeMark,
      required this.time1,required this.time2,required this.phone,required this.date1,required this.date2,
      required this.items
    });

  @override
    Widget build(BuildContext context) {
    final controller=Get.put(OrderController());
      return Scaffold(
        body:Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20,top:6),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  IconButton(onPressed: (){

                    Get.back();

                  }, icon: Icon(Icons.arrow_back_ios_sharp)),
                  SizedBox(width: 60,),
                  Custom_Text( text: "ملخص الطلب",
                    fontSize:18,
                    color:Colors.black,
                    alignment:Alignment.center,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // الاستلام
              Column(
                children: [
                  Custom_Text(text: "الاستلام",
                  fontSize:11,
                    color:Colors.grey,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  Custom_Text(text:date1,
                    fontSize:17,
                    color:Colors.black,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  Custom_Text(text:time1,
                    fontSize:14,
                    color:Colors.black54,
                    alignment:Alignment.topLeft,
                  ),

                ],
              ),
              Divider(
                color:Colors.black54,
              ),
             // التوصيل
              Column(
                children: [
                  Custom_Text(text: "توصيل",
                    fontSize:11,
                    color:Colors.grey,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  Custom_Text(text: date2,
                    fontSize:17,
                    color:Colors.black,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  Custom_Text(text: time2,
                    fontSize:14,
                    color:Colors.black54,
                    alignment:Alignment.topLeft,
                  ),

                ],
              ),
              Divider(
                color:Colors.black54,
              ),
              //العنوان
              Column(
                children: [
                  Custom_Text(text: " عنوان الاستلام ",
                    fontSize:11,
                    color:Colors.grey,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  Custom_Text(text: address,
                    fontSize:17,
                    color:Colors.black,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                ],
              ),
              Divider(
                color:Colors.black54,
              ),
              //العنوان
              Column(
                children: [
                  Custom_Text(text: " عنوان التسليم ",
                    fontSize:11,
                    color:Colors.grey,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  Custom_Text(text:address2,
                    fontSize:17,
                    color:Colors.black,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  Custom_Text(text: city ,
                    fontSize:14,
                    color:Colors.black54,
                    alignment:Alignment.topLeft,
                  ),

                ],
              ),
              Divider(
                color:Colors.black54,
              ),
              // طريقة الدفع
              Column(
                children: [
                  Custom_Text(text: " طريقة الدفع ",
                    fontSize:11,
                    color:Colors.grey,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  Custom_Text(text: "الدفع عند الاستلام ",
                    fontSize:17,
                    color:Colors.black,
                    alignment:Alignment.topLeft,
                  ),

                ],
              ),
              SizedBox(height: 10),
              // الطلب
              Column(
                children: [
                  Custom_Text(text: " الطلب ",
                    fontSize:11,
                    color:Colors.grey,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  for(int i=0;i<items.length;i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width:120,
                          child: Custom_Text(
                            text: items[i].name.toString()
                                .replaceAll('[', '').replaceAll(']',''),
                            fontSize:13,
                            color:Colors.black87,
                            alignment:Alignment.topLeft,
                          ),
                        ),
                        SizedBox(width: 30,),
                        Custom_Text(
                          text: "=",
                          fontSize:13,
                          color:Colors.black87,
                          alignment:Alignment.topLeft,
                        ),
                        SizedBox(width: 40,),
                        Custom_Text(
                          text: items[i].price.toString()
                              .replaceAll('[', '').replaceAll(']',''),
                          fontSize:13,
                          color:Colors.red,
                          alignment:Alignment.topLeft,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                  Divider(
                    color:Colors.black87,
                  ),
                  Row(
                    children: [
                      Custom_Text(text: "المجموع",
                      fontSize:17,
                        color:Colors.black,
                      ),
                      SizedBox(width: 100,),
                      Custom_Text(text: "$price",
                        fontSize:15,
                        color:Colors.red,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),

              // اكد الطلب

              GetBuilder(
                init: OrderController(),
                builder: (context) {
                  return RaisedButton(
                    color:Colors.blueAccent,
                      child:Custom_Text(
                        alignment:Alignment.center,
                        text: "اكد الطلب ",
                        fontSize:18,
                        color:Colors.white,
                      ),
                      onPressed:() {
                      List <ItemModel >data=[];
                      List names=[];


                        for(int i=0;i<items.length;i++){
                          ItemModel item=ItemModel( items[i].name.toString(),  items[i].price.toString());
                          data.add(item);
                          names.add(items[i].name);
                        }
                        print('data==='+data.toString());

                       controller.confirmOrder(
                           names, phone,'', '', address,
                           address2,
                           price.toString(),
                         city,status,country,code,
                         cat,
                         latLong,placeMark,time1,time2,
                         date1,date2
                       );
                  });
                }
              )

            ],
          ),
        ),
      );
    }
  }
  