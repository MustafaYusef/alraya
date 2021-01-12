import 'package:flutter/material.dart';
import 'package:sunmi_thermal_printer_example/addOrder.dart';
import 'dart:math';
import 'home.dart';
import 'main.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        color: mc,
        child: Stack(children: [
         
               Positioned(
           top: 363,
        left: 0,
          right: 0,
           child: Center(
             child: Text("تم ارسال طلبك",
             style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.bold,
               fontSize: 25
             ),),
           ),
          ),


            
          Positioned(
            // top: 0,
            top:416 ,
            height: 60,
            // width: 200,
            left: 98,
            right: 98,
child:     Container(
  //width: 200,
  child:   MaterialButton(
  
    
  
                              //minWidth: double.infinity,
  
                              elevation: 0,
  
                              shape: RoundedRectangleBorder(
  
                                borderRadius: BorderRadius.vertical(
  
                                  bottom: Radius.circular(30)
  
                                )
  
                              ),
  
                              height: 60,
  
                              color: sc,
  
                              onPressed: (){
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
  Home()
  ,);}),(r)=>false);
  
  // signIn();
  
                            },child: Text("الرجوع الى القائمة الرئيسية",
  
                             style: TextStyle(
  
                                color: Colors.white,
  
                                fontWeight: FontWeight.bold,
  
                                fontSize: 14
  
                              ),
  
                            ),),
),
          ),
            Positioned(
              
          //  height: 408,
          height: 205,
       left: 0,
        right: 0,
          top: 140,
           child: Image.asset('assets/don.png'),
          ),
          Positioned(
          //  height: 408,
        left: 0,
        right: 0,
          bottom: 0,
           child: Image.asset('assets/Done.png'),
          ),
          Container(
            child: DraggableScrollableSheet(
              
         initialChildSize: 0.05,
  minChildSize: 0.05,
  maxChildSize: 0.25,
  builder: (BuildContext context, myscrollController) {
    return Container(
     // color: Colors.red,
      child: ListView(
      //  physics: NeverScrollableScrollPhysics(),
        controller: myscrollController,
        children: [
SizedBox(
  height: 20,
),
            Container(
              color:Colors.white,
              height: 400,
              child: Text("test")), Text("test")
        ],
      ),
     // height: 600,
   );}
      ),
          ),
           Positioned(
            // top: 0,
            bottom:25 ,
            height: 60,
            // width: 200,
            left: 98,
            right: 98,
child:     Container(
  //width: 200,
  child:   MaterialButton(
  
    
  
                              //minWidth: double.infinity,
  
                              elevation: 0,
  
                              shape: RoundedRectangleBorder(
  
                                borderRadius: BorderRadius.vertical(
  
                                  bottom: Radius.circular(100),
  top: Radius.circular(100),
                                )
  
                              ),
  
                              height: 60,
  
                              color: Colors.white,
  
                              onPressed: (){
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (c){return
     Directionality(textDirection: TextDirection.rtl,child: 
  AddOrder()
  ,);}));
  
  // signIn();
  
                            },child: Text("اضافة طلب جديد",
  
                             style: TextStyle(
  
                                color: mc,
  
                                fontWeight: FontWeight.bold,
  
                                fontSize: 14
  
                              ),
  
                            ),),
),
          ),
        ],),)
    );
  }
}