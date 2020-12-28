import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:sunmi_thermal_printer_example/addorder2.dart';
import 'package:sunmi_thermal_printer_example/succes.dart';

import 'main.dart';
import 'package:flutter/material.dart';
//AIzaSyAbZOvdb_fUdBlC_ER2JpzhtQSwXN-NwGg
class DriverReject extends StatefulWidget {
  final order;

  const DriverReject({Key key, this.order}) : super(key: key);
  @override
  _DriverRejectState createState() => _DriverRejectState();
}

class _DriverRejectState extends State<DriverReject> {

   
 BuildContext b;
bool other=false;
TextEditingController otherc=TextEditingController();
var or;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    or=widget.order;
  print(or );




  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Builder(
       
        builder: (context, ) {
          b=context;
          return Container(
            height: double.infinity,
            color:role==0?sc:mc,
            child: SingleChildScrollView(
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
                                    Transform(
     alignment: Alignment.center,
  transform: Matrix4.rotationY(pi),
                                                      child: Image.asset(
                                        "assets/redgrad.png",
                                        height: 38,),
                                    ),
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
                     child:
        AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                    height: other?325:275,
                       width: double.infinity,
child: Material(
  color: sc,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15)
  ),
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
 Container(
   margin: const EdgeInsets.symmetric(
     vertical: 5
   ),
   width: double.infinity,
   child: Material(
     color: mc,
     shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15)
    ),
     child: InkWell(
       onTap: (){
         Navigator.pop(context,"لا يرد");
       },
       child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(child: Text("لا يرد",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
      ),
     ),
   ),
 ),
 


 Container(
   margin: const EdgeInsets.symmetric(
     vertical: 5
   ),
   width: double.infinity,
   child: Material(
     color: mc,
     shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15)
    ),
     child: InkWell(
       onTap: (){
         Navigator.pop(context,"غير موجود");
       },
       child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(child: Text("غير موجود",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
      ),
     ),
   ),
 ),



 Container(
   margin: const EdgeInsets.symmetric(
     vertical: 5
   ),
   width: double.infinity,
   child: Material(
     
     color: mc,
     shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15)
    ),
     child: InkWell(
       onTap: (){
         Navigator.pop(context,"مرفوض");
       },
       child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(child: Text("مرفوض",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
      ),
     ),
   ),
 ),


 Container(
   margin: const EdgeInsets.symmetric(
     vertical: 5
   ),
   width: double.infinity,
   child: Material(
     color: sc,
     shape: RoundedRectangleBorder(
       side: BorderSide(
         color: mc,
         width: 3
       ),
      borderRadius: BorderRadius.circular(15)
    ),
     child: InkWell(
       onTap: (){
         setState(() {
           other=!other;
         });
        //  Navigator.pop(context,"لا يرد");
       },
       child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(child: Text("اخرى",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
      ),
     ),
   ),
 ),
 AnimatedOpacity(
                  duration: Duration(milliseconds: 170),
                  opacity:other?1:0,
                                  child: AnimatedContainer(
                    height: other?60:0,
                    duration: Duration(milliseconds: 200),
                    
                    child:
                  Row(
                    children: [
                      Theme(data: ThemeData(primaryColor: Colors.white,),
                      
                                        child: Expanded(
                                                                                  child: TextField(
                                            onEditingComplete: (){
//                                           orders=[];
//  loading=true;
//  page=1;
//  maxCount=-1;
//  lastPage=false;
//  timeout=false;
//  getOrders(true);
                                            },
                                            
                                            style: TextStyle(color: Colors.white),
                                            controller: otherc,
                        decoration: InputDecoration(
                          hintText: "سبب الرفض",
                          hintStyle: TextStyle(color: mc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                            color: Colors.white
                          )),
                          enabledBorder:  OutlineInputBorder(
borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                            color: mc,
                            
                          )
                          ),
                        
// prefixIcon: Icon(Icons.search,
// color: Colors.white,
// // color: Colors.white,
// )
// co
                        ),
                        ),
                                        ),
                      ),
                 FlatButton(
                   textColor: mc,
                   
                   onPressed:(){
Navigator.pop(context,"${otherc.text}");
                 } , child: Text("تم",
                 style: TextStyle(fontWeight: FontWeight.bold,
                 fontSize: 18),
                 ))
                    ],
                  ) ,),
                ),
      ],
    ),
  ),
),
                     )
                   ),
                           SizedBox(
  height: 30,
),    
                            
              ],),
            ),
          );
        }
      ),
    );
  }

   bool loading=false;
   bool loading2=false;
bool timeout=false;

  edit() async {
    if(loading||loading2)
     return;
    FocusScope.of(context).requestFocus(
new FocusNode()
    );

    // if (!formKey.currentState.validate()) {
    //   // If the form is valid, display a snackbar. In the real world,
    //   // you'd often call a server or save the information in a database.

  
    // return;
    // }
  var _bod={


  };
  setState(() {
    loading=true;
  });
  print(_bod);
  var res = await http.put(
          //  "$host/users/auth/new"
            "$host/orders/client/orders/edit/${or['id']}"
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


   

    if (res.statusCode==200) {
  

     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres['data']["msg"]),));

    } else {
     
   //   EDailog.errorDialog(pres["message"], false, context);
     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres["message"]),));
    }
    setState(() {
      loading = false;
    });

  }


   cancelord() async {
     if(loading||loading2)
     return;
    FocusScope.of(context).requestFocus(
new FocusNode()
    );

    // if (!formKey.currentState.validate()) {
    //   // If the form is valid, display a snackbar. In the real world,
    //   // you'd often call a server or save the information in a database.

  
    // return;
    // }

  setState(() {
    loading2=true;
  });
 
  var res = await http.delete(
          //  "$host/users/auth/new"
            "$host/orders/client/orders/cancel/${or['id']}"
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
  

     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres['data']["msg"]),));

    } else {
     
   //   EDailog.errorDialog(pres["message"], false, context);
     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres["message"]),));
    }
    setState(() {
      loading2 = false;
    });

  }




///driver submit tasleem
  submit() async {
     if(loading||loading2)
     return;
    FocusScope.of(context).requestFocus(
new FocusNode()
    );

    // if (!formKey.currentState.validate()) {
    //   // If the form is valid, display a snackbar. In the real world,
    //   // you'd often call a server or save the information in a database.

  
    // return;
    // }

  setState(() {
    loading=true;
  });
 
  var res = await http.put(
          //  "$host/users/auth/new"
            "$host/users/drivers/orders/submit/${or['id']}"
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
  

     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres['data']["msg"]),));

    } else {
     
   //   EDailog.errorDialog(pres["message"], false, context);
     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres["message"]),));
    }
    setState(() {
      loading = false;
    });

  }

  
///driver reject rajee
  rejectord() async {
     if(loading||loading2)
     return;
    FocusScope.of(context).requestFocus(
new FocusNode()
    );

    // if (!formKey.currentState.validate()) {
    //   // If the form is valid, display a snackbar. In the real world,
    //   // you'd often call a server or save the information in a database.

  
    // return;
    // }

  setState(() {
    loading2=true;
  });
 
  var res = await http.put(
          //  "$host/users/auth/new"
            "$host/users/drivers/orders/rejected/${or['id']}"
            ,
            headers: {
              "Authorization":token
            },
      ).timeout(Duration(seconds: 30), onTimeout: () {
      setState(() {
        loading2 = false;
        timeout = true;
      });
      return;
    });

     if (timeout) return;
    var pres = json.decode(res.body);
    print(pres);


   

    if (res.statusCode==200) {
  

     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres['data']["msg"]),));

    } else {
     
   //   EDailog.errorDialog(pres["message"], false, context);
     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres["message"]),));
    }
    setState(() {
      loading2 = false;
    });

  }


  
}