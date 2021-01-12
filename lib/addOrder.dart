import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sunmi_thermal_printer_example/addorder2.dart';
import 'package:sunmi_thermal_printer_example/state.dart';
import 'package:sunmi_thermal_printer_example/succes.dart';

import 'main.dart';
import 'package:flutter/material.dart';
//AIzaSyAbZOvdb_fUdBlC_ER2JpzhtQSwXN-NwGg
class AddOrder extends StatefulWidget {
  @override
  _AddOrderState createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {

    TextEditingController name=new TextEditingController();
    TextEditingController phone =new TextEditingController();
    TextEditingController phone2 =new TextEditingController();
    TextEditingController state =new TextEditingController();
    TextEditingController city =new TextEditingController();
    TextEditingController address =new TextEditingController();
    TextEditingController price =new TextEditingController();
        TextEditingController shipprice =new TextEditingController();

    TextEditingController notes =new TextEditingController();

   final formKey = GlobalKey<FormState>();
  FocusNode namef = FocusNode();
    FocusNode phonef = FocusNode();
  FocusNode phone2f = FocusNode();
  FocusNode statf = FocusNode();
  FocusNode cityf = FocusNode();
  FocusNode addressf = FocusNode();
  FocusNode pricef = FocusNode();
  FocusNode notesf = FocusNode();

  FocusNode passf = FocusNode();
 BuildContext b;

   String cityv;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  getprof();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Builder(
       
        builder: (context, ) {
          b=context;
          return Container(
            height: double.infinity,
            color: mc,
            child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                                          child: Column(
                
                children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  //color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        SizedBox(width: 66,),
                 Center(child:  Image.asset(
                                  "assets/logo.png",
                                  height: 63,
                                  
                                    ),),
                        Align(
                            alignment: Alignment.centerLeft,
                            child:  InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                                                          child: Stack(
                                  children: [
                                    Image.asset(
                                      "assets/grad.png",
                                      height: 38,),
                                      Positioned(
top: 0,
left: 10,
                                       bottom: 0,
                                       // bottom: 0,
                           child:
                              Icon(Icons.arrow_back_ios_rounded,
                                        color: Colors.white,),
                                      )
                                  ],
                                ),
                            )),
                        
                    ],
                  ),
                ),

                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                     child: Column(
                         children: [
                           SizedBox(height: 10,),
                             TextFormField(
                               style: TextStyle(color: Colors.white),
                                     focusNode: namef,
                                     textInputAction: TextInputAction.next,
                                     onEditingComplete: (){
                                       FocusScope.of(context)
                                       .requestFocus(
                                         phonef
                                       );
                                     },
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'الرجاء قم بأدخال اسم المستخدم';
                                                  }
                                                  return null;
                                                },
                                                
                                  controller: name,
                                  
                                decoration: InputDecoration(
                                  
                                  errorStyle:TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                                  hintText: "اسم الزبون",
                              focusColor: Colors.white,
                              
                              hintStyle: TextStyle(
                                color: Colors.white
                              ),
                              focusedErrorBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30)
                                    )
                                  ),
                              errorBorder: OutlineInputBorder(
                                
                                    borderSide: BorderSide(color:Colors.white
                                    ,width: 4),
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30)
                                    )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30)
                                    )
                                  ),
                                  focusedBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30)
                                    )
                                  ),
                                ),  
                                ),
                                
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15
                                  ),
                                  child:  TextFormField(
                                    style: TextStyle(color: Colors.white),
                                          textInputAction: TextInputAction.next,
                                     onEditingComplete: (){
                                       FocusScope.of(context)
                                       .requestFocus(
                                         phone2f
                                       );
                                     },
                                     focusNode:phonef ,
                                            validator: (value) {
                                            if (value.isEmpty) {
                                              return 'الرجاء قم بأدخال رقم الهاتف';
                                            }
                                            return null;
                                          },
                                    keyboardType: TextInputType.phone,
                                    controller: phone,
                                  decoration: InputDecoration(
                                    hintText: "رقم الهاتف",
                                    
                              focusColor: Colors.white,
                              hintStyle: TextStyle(
                                  color: Colors.white
                              ),
errorStyle: TextStyle(
                                  color: Colors.white
                              ),
                              focusedErrorBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                              errorBorder: OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white
                                      ,width: 4),
                                      // borderRadius: BorderRadius.vertical(
                                      //   top: Radius.circular(30)
                                      // )
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white
                                      ,width: 4),
                                      // borderRadius: BorderRadius.vertical(
                                      //   top: Radius.circular(30)
                                      // )
                                    ),
                                  ),  
                                  ),
                                ),
                                    Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15
                                  ),
                                  child:  TextFormField(
                    style: TextStyle(color: Colors.white),

                                    // focusNode: passf,
                                          //   validator: (value) {
                                          //   if (value.isEmpty) {
                                          //     return 'الرجاء قم بأدخال  كلمة المرور';
                                          //   }
                                          //   return null;
                                          // },
                                       keyboardType: TextInputType.phone,
                                             textInputAction: TextInputAction.next,
                                     onEditingComplete: (){
                                       FocusScope.of(context)
                                       .requestFocus(
                                         statf
                                       );
                                     },
                                    controller: phone2,
                                    focusNode: phone2f,
                                  decoration: InputDecoration(
                                    
                                    hintText: "رقم الهاتف 2",
                              focusColor: Colors.white,
                              hintStyle: TextStyle(
                                  color: Colors.white
                              ),
errorStyle: TextStyle(
                                  color: Colors.white
                              ),
                              focusedErrorBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                              errorBorder: OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white
                                      ,width: 4),
                                      // borderRadius: BorderRadius.vertical(
                                      //   top: Radius.circular(30)
                                      // )
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white
                                      ,width: 4),
                                      // borderRadius: BorderRadius.vertical(
                                      //   top: Radius.circular(30)
                                      // )
                                    ),
                                  ),  
                                  ),
                                ),
                                 Container(
              margin:    
           const EdgeInsets.only(
                                    bottom: 15
                                  ),

              decoration: BoxDecoration(
                // color: Colors.grey[200]
                // ,
                borderRadius: BorderRadius.circular(4),
                border:Border.all(color: Colors.white,
                width: 4)
              ),
              child: Theme(
                data: ThemeData(
                  canvasColor: sc
                ),
                              child: Center(
                  child: DropdownButton<String>(
                    
                    value: cityv,
                    icon: Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                    iconSize: 24,
                    elevation: 16,
                    hint: Text("المحافظة",
                      style: TextStyle(color: Colors.white),),
                    style: TextStyle(color: Colors.white),
                    underline: Container(height: 1, color: Colors.transparent),
                    onChanged: (String newValue) {

                      print(newValue=="بغداد");
                      cityv = newValue;
                      // cities = States.js
                      //     .firstWhere((item) => item["name"] == newValue)['data'];
                      setState(() {});
  //                   if(shippingPrices.length>0)
  //                   {
  //  if(city=="بغداد")
  //    {
  //      shipPrice=shippingPrices[0]["value"];
  //    }
  //    else
  //    {
  //             shipPrice=shippingPrices[1]["value"];

  //    }
  //    if(price.text.length>0)
  //     setState(() {
  //                      shipingPrice.text=(int.tryParse(price.text)+shipPrice).toString();
  //                    });
  //                    else{
  //                      setState(() {
  //                         shipingPrice.text=shipPrice.toString();
  //                      });
  //                    }
  //                   }
                    
                    },
                    items: States.js
                        .map((f) {
                          return f["name"];
                        })
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                  width: MediaQuery.of(context).size.width - 140,
                                  child: Text(value)),
                            ),
                          );
                        })
                        .toList(),
                  ),
                ),
              ),
            ),
                         if(false)           Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15
                                  ),
                                  child:  TextFormField(
                    style: TextStyle(color: Colors.white),
          textInputAction: TextInputAction.next,
                                     onEditingComplete: (){
                                       FocusScope.of(context)
                                       .requestFocus(
                                         cityf
                                       );
                                     },
                                     focusNode: statf,
                                            validator: (value) {
                                            if (value.isEmpty) {
                                              return 'الرجاء قم بأدخال   المحافظة';
                                            }
                                            return null;
                                          },
                                    
                                    controller: state,
                                  decoration: InputDecoration(
                                    
                                    hintText: "المحافظة",
                              focusColor: Colors.white,
                              hintStyle: TextStyle(
                                  color: Colors.white
                              ),
errorStyle: TextStyle(
                                  color: Colors.white
                              ),
                              focusedErrorBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                              errorBorder: OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white
                                      ,width: 4),
                                      // borderRadius: BorderRadius.vertical(
                                      //   top: Radius.circular(30)
                                      // )
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white
                                      ,width: 4),
                                      // borderRadius: BorderRadius.vertical(
                                      //   top: Radius.circular(30)
                                      // )
                                    ),
                                  ),  
                                  ),
                                ),
                                
                                    Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15
                                  ),
                                  child:  TextFormField(
                    style: TextStyle(color: Colors.white),
          textInputAction: TextInputAction.next,
                                     onEditingComplete: (){
                                       FocusScope.of(context)
                                       .requestFocus(
                                         addressf
                                       );
                                     },
                                     focusNode: cityf,
                                            validator: (value) {
                                            if (value.isEmpty) {
                                              return 'الرجاء قم بأدخال المدينة';
                                            }
                                            return null;
                                          },
                                    
                                    controller: city,
                                  decoration: InputDecoration(
                                    
                                    hintText: "المدينة",
                              focusColor: Colors.white,
                              hintStyle: TextStyle(
                                  color: Colors.white
                              ),
errorStyle: TextStyle(
                                  color: Colors.white
                              ),
                              focusedErrorBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                              errorBorder: OutlineInputBorder(
                                
                                    borderSide: BorderSide(color:Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white
                                      ,width: 4),
                                      // borderRadius: BorderRadius.vertical(
                                      //   top: Radius.circular(30)
                                      // )
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white
                                      ,width: 4),
                                      // borderRadius: BorderRadius.vertical(
                                      //   top: Radius.circular(30)
                                      // )
                                    ),
                                  ),  
                                  ),
                                ),    Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15
                                  ),
                                  child:  TextFormField(
                    style: TextStyle(color: Colors.white),

                                     focusNode: addressf,
                                            validator: (value) {
                                            if (value.isEmpty) {
                                              return 'الرجاء قم بأدخال العنوان';
                                            }
                                            return null;
                                          },
                                     textInputAction: TextInputAction.next,
                                     onEditingComplete: (){
                                       FocusScope.of(context)
                                       .requestFocus(
                                        pricef
                                       );
                                     },     
                                    controller: address,
                                  decoration: InputDecoration(
                                    
                                    hintText: "العنوان",
                              focusColor: Colors.white,
                              hintStyle: TextStyle(
                                  color: Colors.white
                              ),
errorStyle: TextStyle(
                                  color: Colors.white
                              ),
                              focusedErrorBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color:Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                              errorBorder: OutlineInputBorder(
                                
                                    borderSide: BorderSide(color:Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white
                                      ,width: 4),
                                      // borderRadius: BorderRadius.vertical(
                                      //   top: Radius.circular(30)
                                      // )
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white
                                      ,width: 4),
                                      // borderRadius: BorderRadius.vertical(
                                      //   top: Radius.circular(30)
                                      // )
                                    ),
                                  ),  
                                  ),
                                ),

         Container(
              margin:    
           const EdgeInsets.only(
                                    bottom: 15
                                  ),

              decoration: BoxDecoration(
                // color: Colors.grey[200]
                // ,
                borderRadius: BorderRadius.circular(4),
                border:Border.all(color: Colors.white,
                width: 4)
              ),
              child:Theme(
                data: ThemeData(
                  canvasColor: sc
                ),
                              child: Center(
                  child: DropdownButton<String>(
                    
                    value: shiptype,
                    icon: Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                    iconSize: 24,
                    elevation: 16,
                    hint: Text("نوع النقل",
                      style: TextStyle(color: Colors.white),),
                    style: TextStyle(color: Colors.white),
                    underline: Container(height: 1, color: Colors.transparent),
                    onChanged: (String newValue) {

                      print(newValue=="بغداد");
                      shiptype = newValue;
                      var sshipprice=shipingprices.firstWhere((item)=>
                      item['name']==newValue)['amount'];
print(sshipprice);
setState(() {
  shipprice.text="$sshipprice";
});
                      // cities = States.js
                      //     .firstWhere((item) => item["name"] == newValue)['data'];
                      setState(() {});
  //                   if(shippingPrices.length>0)
  //                   {
  //  if(city=="بغداد")
  //    {
  //      shipPrice=shippingPrices[0]["value"];
  //    }
  //    else
  //    {
  //             shipPrice=shippingPrices[1]["value"];

  //    }
  //    if(price.text.length>0)
  //     setState(() {
  //                      shipingPrice.text=(int.tryParse(price.text)+shipPrice).toString();
  //                    });
  //                    else{
  //                      setState(() {
  //                         shipingPrice.text=shipPrice.toString();
  //                      });
  //                    }
  //                   }
                    
                    },
                    items: shipingprices
                        .map((f) {
                          return f["name"];
                        })
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                  width: MediaQuery.of(context).size.width - 140,
                                  child: Text(value)),
                            ),
                          );
                        })
                        .toList(),
                  ),
                ),
              ),
            ),
                                 Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15
                                  ),
                                  child:  TextFormField(
                    style: TextStyle(color: Colors.white),

                                     focusNode: pricef,
                                            validator: (value) {
                                            if (value.isEmpty) {
                                              return 'الرجاء قم بأدخال السعر';
                                            }
                                            return null;
                                          },
                                          textInputAction: TextInputAction.next,
                                     onEditingComplete: (){
                                       FocusScope.of(context)
                                       .requestFocus(
                                         notesf
                                       );
                                     },
                                    controller: price,

                                     keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    
                                    hintText: "سعر الطلب مع التوصيل  ",
                              focusColor: Colors.white,
                              hintStyle: TextStyle(
                                  color: Colors.white
                              ),
errorStyle: TextStyle(
                                  color: Colors.white
                              ),
                              focusedErrorBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color:Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                              errorBorder: OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white
                                      ,width: 4),
                                      // borderRadius: BorderRadius.vertical(
                                      //   top: Radius.circular(30)
                                      // )
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white
                                      ,width: 4),
                                      // borderRadius: BorderRadius.vertical(
                                      //   top: Radius.circular(30)
                                      // )
                                    ),
                                  ),  
                                  ),
                                ),

// Padding(
//                                   padding: const EdgeInsets.only(
//                                     bottom: 15
//                                   ),
//                                   child:  TextFormField(
//                     style: TextStyle(color: Colors.white),

//                                     //  focusNode: pricef,
//                                             validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'الرجاء قم بأدخال السعر';
//                                             }
//                                             return null;
//                                           },
//                                           textInputAction: TextInputAction.next,
//                                      onEditingComplete: (){
//                                        FocusScope.of(context)
//                                        .requestFocus(
//                                          notesf
//                                        );
//                                      },
//                                     controller: shipprice,
//                                     keyboardType: TextInputType.number,
//                                   decoration: InputDecoration(
                                    
//                                     hintText: "سعر التوصيل",
//                               focusColor: Colors.white,
//                               hintStyle: TextStyle(
//                                   color: Colors.white
//                               ),
// errorStyle: TextStyle(
//                                   color: Colors.white
//                               ),
//                               focusedErrorBorder:  OutlineInputBorder(
                                
//                                     borderSide: BorderSide(color:Colors.white
//                                     ,width: 4),
//                                     // borderRadius: BorderRadius.vertical(
//                                     //   top: Radius.circular(30)
//                                     // )
//                                   ),
//                               errorBorder: OutlineInputBorder(
                                
//                                     borderSide: BorderSide(color: Colors.white
//                                     ,width: 4),
//                                     // borderRadius: BorderRadius.vertical(
//                                     //   top: Radius.circular(30)
//                                     // )
//                                   ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Colors.white
//                                       ,width: 4),
//                                       // borderRadius: BorderRadius.vertical(
//                                       //   top: Radius.circular(30)
//                                       // )
//                                     ),
//                                     focusedBorder:  OutlineInputBorder(
//                                       borderSide: BorderSide(color: Colors.white
//                                       ,width: 4),
//                                       // borderRadius: BorderRadius.vertical(
//                                       //   top: Radius.circular(30)
//                                       // )
//                                     ),
//                                   ),  
//                                   ),
//                                 ),
                                 Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15
                                  ),
                                  child:  TextFormField(
                    style: TextStyle(color: Colors.white),

                                     focusNode: notesf,
                                          //   validator: (value) {
                                          //   if (value.isEmpty) {
                                          //     return 'الرجاء قم بأدخال  كلمة المرور';
                                          //   }
                                          //   return null;
                                          // },
                                    minLines: 2,
                                    maxLines: 3,
                                    controller: notes,
                                          textInputAction: TextInputAction.done,
                                     onEditingComplete: (){
                                       FocusScope.of(context)
                                       .requestFocus(
                                         FocusNode()
                                       );
                                     },
                                  decoration: InputDecoration(
                                    
                                    hintText: "ملاحظات",
                              focusColor: Colors.white,
                              hintStyle: TextStyle(
                                  color: Colors.white
                              ),
errorStyle: TextStyle(
                                  color: Colors.white
                              ),
                              focusedErrorBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                              errorBorder: OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white
                                      ,width: 4),
                                      // borderRadius: BorderRadius.vertical(
                                      //   top: Radius.circular(30)
                                      // )
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white
                                      ,width: 4),
                                      // borderRadius: BorderRadius.vertical(
                                      //   top: Radius.circular(30)
                                      // )
                                    ),
                                  ),  
                                  ),
                                ),
                                MaterialButton(
                                  minWidth: double.infinity,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(30)
                                    )
                                  ),
                                  height: 60,
                                  color: sc,
                                  onPressed: (){
// signIn();
next();
// Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
// AddOrder2(),);}));

                                },child: Text("التالي",
                                 style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),),
                         ],
                     ),
                   ),
                               
                            
              ],),
                      ),
            ),
          );
        }
      ),
    );
  }

   bool loading=false;

bool timeout=false;

  next() async {
    FocusScope.of(context).requestFocus(
new FocusNode()
    );

    if (!formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

  
    return;
    }
  var _bod={
"name":"${name.text}",
"phone":"${phone.text}",
"phone2":"${phone2.text}",
"government":"$city",
"city":"${cityv}",
"price":"${price.text}",
"address":"${address.text}",
"notes":"${notes.text}",
"shinnig_price":"${shipprice.text}",



  };
  setState(() {
    loading=true;
  });
  print(_bod);
  var res = await http.post(
          //  "$host/users/auth/new"
            "$host/orders/client/orders/new"
            ,
            headers: {
              "Authorization":token
            },
        body:_bod).timeout(Duration(seconds: 30), onTimeout: () {
      setState(() {
        loading = false;
        timeout = true;
      });
      return;
    });

     if (timeout) return;
    var pres = json.decode(res.body);
    print(pres);


   

    if (res.statusCode==201) {
  
Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
Success(),);}));


  //  Navigator.of(context).pushAndRemoveUntil(
  //   MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
  //      Home(),);}) , (route) => false);
    //  Navigator.of(context).pop();
    } else {
     
   //   EDailog.errorDialog(pres["message"], false, context);
     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres["message"]),));
    }
    setState(() {
      loading = false;
    });

  }

var shipingprices=[];
var shiptype;
   getprof() async {
  


  setState(() {
    loading=true;
  });
  var res = await http.get(
          //  "$host/users/auth/new"
            "$host/users/shippingPrice"
            ,
            headers: {
              "Authorization":token
            },
       ).timeout(Duration(seconds: 30), onTimeout: () {
      setState(() {
        loading = false;
        timeout = true;
      });
      return;
    });

     if (timeout) return;
    var pres = json.decode(res.body);
    print(pres);


   

    if (res.statusCode==200) {
  shipingprices=pres['data']['get_shippingPrice'];

 print(shipingprices);
// Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
// Success(),);}));


  //  Navigator.of(context).pushAndRemoveUntil(
  //   MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
  //      Home(),);}) , (route) => false);
    //  Navigator.of(context).pop();
    } else {
     
   //   EDailog.errorDialog(pres["message"], false, context);
    //  Scaffold.of(b).showSnackBar(
    // SnackBar(content: Text(pres["message"]),));
    }
    setState(() {
      loading = false;
    });

  }
}