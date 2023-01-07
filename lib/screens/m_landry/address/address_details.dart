//import 'dart:html';

import 'package:course_app/screens/landry_y_tasks/controllers/order_controller.dart';
import 'package:course_app/screens/landry_y_tasks/models/item_model.dart';
import 'package:course_app/screens/landry_y_tasks/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

  class AddressDetailsScreen extends StatelessWidget {

  String cat,price;
  List order;
  List pricing;
  String latLong;
  String placeMark;
  List<ItemModel>items;


  AddressDetailsScreen({
      required this.cat, required this.price, required this.order, required this.pricing,
  required this.latLong,required this.placeMark,required this.items
  }); //   cat: controller.cat,


  @override
  Widget build(BuildContext context) {

    final controller=Get.put(OrderController());
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 1,
          title: Text(
            "اضف عنوان",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child:
          GetBuilder(
            init:OrderController(),
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 7,
                        )
                      ]),
                  height: 1200,
                  width: double.infinity,
                  //   color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "اضف العنوان الخاص بك",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: TextFormField(
                             controller:controller.address,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            onSaved: (value) {},
                            validator: (value) {},
                            decoration: InputDecoration(
                                hintText: "عنوان الاستلام ",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1)),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: TextFormField(
                            controller:controller.address2,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            onSaved: (value) {},
                            validator: (value) {},
                            decoration: InputDecoration(
                                hintText: "عنوان التسليم ",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1)),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: TextFormField(
                            controller:controller.phone,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            onSaved: (value) {},
                            validator: (value) {},
                            decoration: InputDecoration(
                                hintText: "رقم الهاتف",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: TextFormField(
                             controller:controller.city ,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            onSaved: (value) {},
                            validator: (value) {},
                            decoration: InputDecoration(
                                hintText: "المدينـة",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: TextFormField(
                            controller:controller.time1,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            onSaved: (value) {},
                            validator: (value) {},
                            decoration: InputDecoration(
                                hintText: "وقت الاستلام ",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1)),
                          ),
                        ),
                      ),



                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: TextFormField(
                            controller:controller.time2,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            onSaved: (value) {},
                            validator: (value) {},
                            decoration: InputDecoration(
                                hintText: "وقت التسليم ",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1)),
                          ),
                        ),
                      ),



                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: TextFormField(
                            controller:controller.date1,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            onSaved: (value) {},
                            validator: (value) {},
                            decoration: InputDecoration(
                                hintText: " تاريخ الاستلام ",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1)),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: TextFormField(
                            controller:controller.date2,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            onSaved: (value) {},
                            validator: (value) {},
                            decoration: InputDecoration(
                                hintText: " تاريخ التسليم ",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1)),
                          ),
                        ),
                      ),


                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: TextFormField(
                            controller:controller.status ,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            onSaved: (value) {},
                            validator: (value) {},
                            decoration: InputDecoration(
                                hintText: "حــالة",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: TextFormField(
                            controller:controller.country,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            onSaved: (value) {},
                            validator: (value) {},
                            decoration: InputDecoration(
                                hintText: "دولة",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: TextFormField(
                            controller:controller.code,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            onSaved: (value) {},
                            validator: (value) {},
                            decoration: InputDecoration(
                                hintText: "الـرمز البـريدي",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(height: 1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 42,
                      ),
                      InkWell(
                        onTap: () {

                          final box=GetStorage();
                          box.write('address', controller.address.text,);
                          box.write('address2', controller.address.text,);
                          box.write('city', controller.city.text);
                          box.write('status', controller.status.text,);
                          box.write('country', controller.country.text,);
                          box.write('code', controller.code.text,);
                          box.write('latLong', latLong);
                          box.write('time1',controller.time1.text);
                          box.write('time2',controller.time2.text,);
                          box.write('phone',controller.phone.text,);
                          box.write('time2',controller.time2.text,);
                          box.write('date1',controller.date1.text,);
                          box.write('date2',controller.date2.text,);

                             Get.to( OrderScreen(
                               pricing:pricing ,
                               order: order,
                               price: price,
                               cat: cat,
                               address:controller.address.text,
                               address2: controller.address2.text,
                               city:controller.city.text,
                               status:controller.status.text,
                               country:controller.country.text,
                               code:controller.code.text,
                               latLong: latLong,
                               placeMark: placeMark,
                               time1:controller.time1.text,
                               time2:controller.time2.text,
                               phone:controller.phone.text,
                               date1: controller.date1.text,
                               date2: controller.date2.text,
                               items:items

                             ));



                        },
                        child: AnimatedContainer(
                          width: 330,
                          height: 48,
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue,
                                Color.fromARGB(255, 38, 83, 122)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "حفظ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          ),
        ));
  }
}


