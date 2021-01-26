import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:sunmi_thermal_printer_example/addorder2.dart';
import 'package:sunmi_thermal_printer_example/clientLoc.dart';
import 'package:sunmi_thermal_printer_example/driverreject.dart';
import 'package:sunmi_thermal_printer_example/succes.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';
import 'package:flutter/material.dart';
//AIzaSyAbZOvdb_fUdBlC_ER2JpzhtQSwXN-NwGg
class OrderDetails extends StatefulWidget {
  final order;

  const OrderDetails({Key key, this.order}) : super(key: key);
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

    TextEditingController name=new TextEditingController();
        TextEditingController orderid=new TextEditingController();
    TextEditingController orderstate=new TextEditingController();

    TextEditingController phone =new TextEditingController();
    TextEditingController phone2 =new TextEditingController();

        TextEditingController clientname =new TextEditingController();
        TextEditingController clientphone =new TextEditingController();

    TextEditingController state =new TextEditingController();
    TextEditingController city =new TextEditingController();
    TextEditingController address =new TextEditingController();
    TextEditingController price =new TextEditingController();
        TextEditingController shipprice =new TextEditingController();
        TextEditingController rejectedmsg =new TextEditingController();

        TextEditingController mult =new TextEditingController();

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
bool editible;

_launchURL(url) async {
  // const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

var or;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    or=widget.order;
  print(or );
  print(or['status']);
  phone.text="${or['phone']}";
    phone2.text="${or['phone2']}";
      state.text="${or['government']}";
        city.text="${or['city']}";
  address.text="${or['address']}";
  price.text="${or['price']}";
   if(role==0) mult.text="${or['multiple']}";
   if(role==0) shipprice.text="${or['shipping_price']}";
   if(role==0&&or['reject_msg']!=null) rejectedmsg.text="${or['reject_msg']}";
   if(role==1) clientname.text="${or['client']['name']}";
   if(role==1) clientphone.text="${or['client']['phone']}";


  name.text="${or['name']}";

 notes.text="${or['notes']}";
  orderid.text="${or['id']}";
 orderstate.text="${statobj[or['status']]}";
editible=role==0;

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
                                      ),
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
                                  //   focusNode: namef,
                                     textInputAction: TextInputAction.next,
                                    //  onEditingComplete: (){
                                    //    FocusScope.of(context)
                                    //    .requestFocus(
                                    //      phonef
                                    //    );
                                    //  },
                                                // validator: (value) {
                                                //   if (value.isEmpty) {
                                                //     return 'الرجاء قم بأدخال اسم المستخدم';
                                                //   }
                                                //   return null;
                                                // },
                                                
                                  controller: orderid,
                                  enabled: editible,
                                decoration: InputDecoration(
                                  
                                  errorStyle:TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                                  hintText: " رقم الطلب",
                                  labelText: "رقم الطلب",
                                  labelStyle: TextStyle(color: Colors.white),
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
                                        disabledBorder:  OutlineInputBorder(
                                
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
                                SizedBox(
                                  height: 15,
                                ),
                             TextFormField(
                                 enabled: editible,
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
                                     disabledBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                    labelText: "اسم الزبون",
                                  labelStyle: TextStyle(color: Colors.white),
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
                                      // top: Radius.circular(30),
                                      
                                    )
                                  ),
                              errorBorder: OutlineInputBorder(
                                
                                    borderSide: BorderSide(color:Colors.white
                                    ,width: 4),
                                    borderRadius: BorderRadius.vertical(
                                      // top: Radius.circular(30)
                                    )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    borderRadius: BorderRadius.vertical(
                                      // top: Radius.circular(30)
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
                                  child:  Stack(
                                    children: [
                                      TextFormField(
                                          
                                            enabled: editible,
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
                                        decoration: InputDecoration(   disabledBorder:  OutlineInputBorder(
                                
                                          borderSide: BorderSide(color: Colors.white
                                          ,width: 4),
                                          // borderRadius: BorderRadius.vertical(
                                          //   top: Radius.circular(30)
                                          // )
                                        ),
                                        // suffixIcon: IconButton(icon: Icon(Icons.call,
                                        // color: Colors.white,),
                                        // onPressed: (){
                                      
                                        // },),
                                          hintText: "رقم الهاتف",
                                            labelText: "رقم الهاتف",
                                        labelStyle: TextStyle(color: Colors.white),
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
                                      Positioned(
left: 0,
top: 0,
bottom: 0,
                                        child: IconButton(color: Colors.white,
                                        icon: Icon(Icons.message),
                                        onPressed: (){

                                          var xl;
                                        
                                             var pho=or['phone'];
if(!pho.startsWith("00964"))
{
pho=pho.replaceFirst("00", "+");
}
print(pho);
    if(!pho.startsWith("+964"))
{
  print(true);
  if(pho.startsWith("0"))
  {
    pho=pho.replaceFirst("0", "");
  }
  pho="+964"+pho;
  // print(phone.text);
    // Scaffold.of(b).showSnackBar(
    // SnackBar(content: Text("قم بتحديد موقعك على الخريطة رجاءا"),));
  // return;
}
   if (Platform.isAndroid) {
      // add the [https]
      xl= "https://wa.me/$pho/?text= "; // new line
    } else {
      // add the [https]
      xl= "https://api.whatsapp.com/send?phone=$pho&text= "; // new line
    }
    _launchURL(xl);
                                        },
                                        ),
                                      ),

                                        Positioned(
left: 40,
top: 0,
bottom: 0,
                                        child: IconButton(color: Colors.white,
                                        icon: Icon(Icons.call),
                                        onPressed: (){

 var pho=or['phone'];
if(!pho.startsWith("00964"))
{
pho=pho.replaceFirst("00", "+");
}
print(pho);
    if(!pho.startsWith("+964"))
{
  print(true);
  if(pho.startsWith("0"))
  {
    pho=pho.replaceFirst("0", "");
  }
  pho="+964"+pho;
}
                                        _launchURL("tel:$pho");
                                        },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                    Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15
                                  ),
                                  child:  Stack(
                                    children: [
                                      TextFormField(
                                          enabled: editible,
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
                                          labelText: "رقم الهاتف2",
                                      labelStyle: TextStyle(color: Colors.white),
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
                                        disabledBorder:  OutlineInputBorder(
                                
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
                                                     Positioned(
left: 0,
top: 0,
bottom: 0,
                                        child: IconButton(color: Colors.white,
                                        icon: Icon(Icons.message),
                                        onPressed: (){

                                          var xl;

                                                                   var pho=or['phone2'];
if(!pho.startsWith("00964"))
{
pho=pho.replaceFirst("00", "+");
}
print(pho);
    if(!pho.startsWith("+964"))
{
  print(true);
  if(pho.startsWith("0"))
  {
    pho=pho.replaceFirst("0", "");
  }
  pho="+964"+pho;
  // print(phone.text);
    // Scaffold.of(b).showSnackBar(
    // SnackBar(content: Text("قم بتحديد موقعك على الخريطة رجاءا"),));
  // return;
}

                                           if (Platform.isAndroid) {
  
      // add the [https]
      xl= "https://wa.me/$pho/?text= "; // new line
    } else {
      // add the [https]
      xl= "https://api.whatsapp.com/send?phone=$pho&text= "; // new line
    }
    _launchURL(xl);
                                        },
                                        ),
                                      ),

                                        Positioned(
left: 40,
top: 0,
bottom: 0,
                                        child: IconButton(color: Colors.white,
                                        icon: Icon(Icons.call),
                                        onPressed: (){
                         var pho=or['phone2'];
if(!pho.startsWith("00964"))
{
pho=pho.replaceFirst("00", "+");
}
print(pho);
    if(!pho.startsWith("+964"))
{
  print(true);
  if(pho.startsWith("0"))
  {
    pho=pho.replaceFirst("0", "");
  }
  pho="+964"+pho;
  // print(phone.text);
    // Scaffold.of(b).showSnackBar(
    // SnackBar(content: Text("قم بتحديد موقعك على الخريطة رجاءا"),));
  // return;
}
                                        _launchURL("tel:$pho");
                                        },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
   if(role!=0)    Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15
                                  ),
                                  child:  TextFormField(  enabled: editible,
                                    style: TextStyle(color: Colors.white),
                                          textInputAction: TextInputAction.next,
                                     onEditingComplete: (){
                                       FocusScope.of(context)
                                       .requestFocus(
                                         phone2f
                                       );
                                     },
                                    //  focusNode:phonef ,
                                            validator: (value) {
                                            if (value.isEmpty) {
                                              return 'الرجاء قم بأدخال رقم الهاتف';
                                            }
                                            return null;
                                          },
                                    keyboardType: TextInputType.phone,
                                    controller: clientname,
                                  decoration: InputDecoration(
                                       disabledBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                    // hintText: "رقم الهاتف",
                                      labelText: "اسم العميل",
                                  labelStyle: TextStyle(color: Colors.white),
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
                           if(role!=0)             Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15
                                  ),
                                  child:  Stack(
                                    children: [
                                      TextFormField(  enabled: editible,
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
                                        controller: clientphone,
                                      decoration: InputDecoration(   disabledBorder:  OutlineInputBorder(
                                
                                        borderSide: BorderSide(color: Colors.white
                                        ,width: 4),
                                        // borderRadius: BorderRadius.vertical(
                                        //   top: Radius.circular(30)
                                        // )
                                      ),
                                        // hintText: "رقم الهاتف",
                                          labelText: "رقم هاتف العميل",
                                      labelStyle: TextStyle(color: Colors.white),
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
                                                     Positioned(
left: 0,
top: 0,
bottom: 0,
                                        child: IconButton(color: Colors.white,
                                        icon: Icon(Icons.message),
                                        onPressed: (){

                                          var xl;

                                        var pho=or['client']['phone'];
if(!pho.startsWith("00964"))
{
pho=pho.replaceFirst("00", "+");
}
print(pho);
    if(!pho.startsWith("+964"))
{
  print(true);
  if(pho.startsWith("0"))
  {
    pho=pho.replaceFirst("0", "");
  }
  pho="+964"+pho;
  // print(phone.text);
    // Scaffold.of(b).showSnackBar(
    // SnackBar(content: Text("قم بتحديد موقعك على الخريطة رجاءا"),));
  // return;
}
                                           if (Platform.isAndroid) {
      // add the [https]
      xl= "https://wa.me/$pho/?text= "; // new line
    } else {
      // add the [https]
      xl= "https://api.whatsapp.com/send?phone=$pho&text= "; // new line
    }
    _launchURL(xl);
                                        },
                                        ),
                                      ),

                                        Positioned(
left: 40,
top: 0,
bottom: 0,
                                        child: IconButton(color: Colors.white,
                                        icon: Icon(Icons.call),
                                        onPressed: (){
                                   var pho=or['client']['phone'];
if(!pho.startsWith("00964"))
{
pho=pho.replaceFirst("00", "+");
}
print(pho);
    if(!pho.startsWith("+964"))
{
  print(true);
  if(pho.startsWith("0"))
  {
    pho=pho.replaceFirst("0", "");
  }
  pho="+964"+pho;
  // print(phone.text);
    // Scaffold.of(b).showSnackBar(
    // SnackBar(content: Text("قم بتحديد موقعك على الخريطة رجاءا"),));
  // return;
}
                                        _launchURL("tel:$pho");
                                        },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                    Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15
                                  ),
                                  child:  TextFormField(  enabled: editible,
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
                                  decoration: InputDecoration(   disabledBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                      labelText: "المحافظة",
                                  labelStyle: TextStyle(color: Colors.white),
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
                                  child:  TextFormField(  enabled: editible,
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
                                  decoration: InputDecoration(   disabledBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                      labelText: "المدينة",
                                  labelStyle: TextStyle(color: Colors.white),
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
                                      enabled: editible,
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
                                  decoration: InputDecoration(   disabledBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                      labelText: "العنوان",
                                  labelStyle: TextStyle(color: Colors.white),
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


                                 Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15
                                  ),
                                  child:  TextFormField(
                                      enabled: editible,
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
                                  decoration: InputDecoration(   disabledBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                      labelText: "السعر",
                                  labelStyle: TextStyle(color: Colors.white),
                                    hintText: "سعر البضاعة مع التوصيل",
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

 if(role==0)      Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15
                                  ),
                                  child:  TextFormField(
                                      enabled: editible,
                    style: TextStyle(color: Colors.white),

                                    //  focusNode: pricef,
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
                                    controller: shipprice,
                                  decoration: InputDecoration(   disabledBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                      labelText: "سعر التوصيل",
                                  labelStyle: TextStyle(color: Colors.white),
                                    hintText: "سعر البضاعة مع التوصيل",
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

      if(role==0)      Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15
                                  ),
                                  child:  TextFormField(
                                      enabled: editible,
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
                                    controller: mult,
                                  decoration: InputDecoration(   disabledBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                      labelText: "مضاعفة",
                                  labelStyle: TextStyle(color: Colors.white),
                                    hintText: "سعر البضاعة مع التوصيل",
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


                                 Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15
                                  ),
                                  child:  TextFormField(
                                      enabled: editible,
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
                                  decoration: InputDecoration(   disabledBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                      labelText: "ملاحظات",
                                  labelStyle: TextStyle(color: Colors.white),
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
                              if(role!=3&&role!=2)     Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15
                                  ),
                                  child:  TextFormField(
                                      enabled: editible,
                    style: TextStyle(color: Colors.white),

                                    //  focusNode: pricef,
                                          //   validator: (value) {
                                          //   if (value.isEmpty) {
                                          //     return 'الرجاء قم بأدخال السعر';
                                          //   }
                                          //   return null;
                                          // },
                                          textInputAction: TextInputAction.next,
                                    //  onEditingComplete: (){
                                    //    FocusScope.of(context)
                                    //    .requestFocus(
                                    //      notesf
                                    //    );
                                    //  },
                                    controller: orderstate,
                                  decoration: InputDecoration(   disabledBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                      labelText: "الحالة",
                                  labelStyle: TextStyle(color: Colors.white),
                                    // hintText: "سعر البضاعة مع التوصيل",
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
     if(role!=3&&role!=2 &&or['reject_msg']!=null&&or['reject_msg'].length>0)     Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15
                                  ),
                                  child:  TextFormField(
                                      enabled: editible,
                    style: TextStyle(color: Colors.white),

                                    //  focusNode: pricef,
                                          //   validator: (value) {
                                          //   if (value.isEmpty) {
                                          //     return 'الرجاء قم بأدخال السعر';
                                          //   }
                                          //   return null;
                                          // },
                                          textInputAction: TextInputAction.next,
                                    //  onEditingComplete: (){
                                    //    FocusScope.of(context)
                                    //    .requestFocus(
                                    //      notesf
                                    //    );
                                    //  },
                                    controller: rejectedmsg,
                                  decoration: InputDecoration(   disabledBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                                      labelText: "سبب الرفض",
                                  labelStyle: TextStyle(color: Colors.white),
                                    // hintText: "سعر البضاعة مع التوصيل",
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

 
                  if(role==0
                  &&(or['status']!='delivered'
                  &&or['status']!='rejected_client'
                  &&or['status']!='finished'
                  &&or['status']!='canceled')
                  )
                                MaterialButton(
                                  minWidth: double.infinity,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(30)
                                    )
                                  ),
                                  height: 60,
                                  color: mc,
                                  onPressed: (){
// signIn();
edit();
// Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
// AddOrder2(),);}));

                                },child:
                                loading?
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                    Colors.white
                                  ),
                                ):
                                 Text("تعديل",
                                 style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),),
SizedBox(
height: 10,
),
      if(role==0&&(or['status']!='delivered'
                  &&or['status']!='rejected_client'
                  &&or['status']!='finished'
                  &&or['status']!='watting'
                   &&or['status']!='canceled'))
                                MaterialButton(
                                  minWidth: double.infinity,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(100),
                                      top: Radius.circular(100)
                                    )
                                  ),
                                  height: 60,
                                  color: mc,
                                  onPressed: (){
// signIn();
// editprice();
editPricemodal(context);
// Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
// AddOrder2(),);}));

                                },child:
                                priceloading?
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                    Colors.white
                                  ),
                                ):
                                 Text("تعديل السعر",
                                 style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),),

                                 if(role==1&&(
                                   or['status']=='watting'||
                                   or['status']=='driver'||or['status']=='rejected'))  
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
submit();

                                },child:
                                loading?
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                    Colors.white
                                  ),
                                ):
                                 Text((or['status']=='rejected')?"اعادة تسليم"
                                 :"تسليم",
                                 style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),),
                                               
                                               
                    if(role==2||role==3
              //      &&or['status']=='watting'
                    )       
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
// submit();
// printb();
if(or['status']=='watting')
printb(null);
// showmodal(context);
else
{
  mprint(or);
}


                                },child:
                                loading?
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                    Colors.white
                                  ),
                                ):
                                 Text(or['status']=='watting'
                                 ?"طباعة"
                                 :"اعادة طباعة",
                                 style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),),
SizedBox(
  height: 20,
),
   if(role==2||role==3
                   &&(or['status']=='watting')
                    )                  MaterialButton(
                                  minWidth: double.infinity,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(100),
                                      top: Radius.circular(100)
                                    )
                                  ),
                                  height: 60,
                                  color: Colors.white,
                                  onPressed: (){
// signIn();
// collectorsubmitostore();// Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
// AddOrder2(),);}));
showmodal(context);

                                },child:
                                loading2?
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
sc                                  ),
                                ):
                                 Text("طباعة مع تعديل التوصيل",
                                 style: TextStyle(
                                    color: sc,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),
                                ),
                                
                                                   if(role==3&&or['status']=='collected')                  MaterialButton(
                                  minWidth: double.infinity,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(100),
                                      top: Radius.circular(100)
                                    )
                                  ),
                                  height: 60,
                                  color: Colors.white,
                                  onPressed: (){
// signIn();
collectorsubmitostore();// Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
// AddOrder2(),);}));

                                },child:
                                loading2?
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
sc                                  ),
                                ):
                                 Text("تأكيد الاستلام",
                                 style: TextStyle(
                                    color: sc,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),
                                ),
SizedBox(
  height: 30,
),

                     if(role==1&&(or['status']=='watting'||or['status']=='driver'))     
                                  MaterialButton(
                                  minWidth: double.infinity,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(100),
                                      top: Radius.circular(100)
                                    )
                                  ),
                                  height: 60,
                                  color: Colors.white,
                                  onPressed: (){
// signIn();
// cancelord();
// Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
// AddOrder2(),);}));
rejectord();

                                },child:
                                loading2?
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
sc                                  ),
                                ):
                                 Text("راجع",
                                 style: TextStyle(
                                    color: sc,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),),

                                  
                          
                                             if(role==3&&
                                     (or['status']=='rejected_store'
                                    ))                  MaterialButton(
                                  minWidth: double.infinity,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(100),
                                      top: Radius.circular(100)
                                    )
                                  ),
                                  height: 60,
                                  color: Colors.white,
                                  onPressed: (){
// signIn();
collectorreturntocostumer();// Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
// AddOrder2(),);}));

                                },child:
                                loading2?
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
sc                                  ),
                                ):
                                 Text("ارجاع للزبون",
                                 style: TextStyle(
                                    color: sc,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),),
                                     if(role==3&&
                                     (or['status']=='rejected'
                                     ||or['status']=='return_from_secend_store'))                  MaterialButton(
                                  minWidth: double.infinity,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(100),
                                      top: Radius.circular(100)
                                    )
                                  ),
                                  height: 60,
                                  color: Colors.white,
                                  onPressed: (){
// signIn();
collectorrejectedostore();// Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
// AddOrder2(),);}));

                                },child:
                                loading2?
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
sc                                  ),
                                ):
                                 Text("تأكيد راجع",
                                 style: TextStyle(
                                    color: sc,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),),


                                  if(role==0&&or['status']=='watting')                  MaterialButton(
                                  minWidth: double.infinity,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(100),
                                      top: Radius.circular(100)
                                    )
                                  ),
                                  height: 60,
                                  color: Colors.white,
                                  onPressed: (){
// signIn();
cancelord();
// Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
// AddOrder2(),);}));

                                },child:
                                loading2?
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
sc                                  ),
                                ):
                                 Text("الغاء الطلب",
                                 style: TextStyle(
                                    color: sc,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),),





                                   if((role==2||role==3)&&false)                  MaterialButton(
                                  minWidth: double.infinity,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(100),
                                      top: Radius.circular(100)
                                    )
                                  ),
                                  height: 60,
                                  color: Colors.white,
                                  onPressed: (){
// signIn();
// cancelord();
Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
ClientLoc(
  client: or,
),);}));

// Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
// AddOrder2(),);}));

                                },child:
                                loading2?
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
sc                                  ),
                                ):
                                 Text("خارطة",
                                 style: TextStyle(
                                    color: sc,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),),
                         ],
                     ),
                   ),
                           SizedBox(
  height: 30,
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
"name":"${name.text}",
"phone":"${phone.text}",
"phone2":"${phone2.text}",
"government":"${state.text}",
"city":"${city.text}",
"price":"${price.text}",
"address":"${address.text}",
"notes":"${notes.text}",

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


bool priceloading=false;
  editprice() async {
    if(loading||loading2||priceloading)
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

"price":"${editidprice.text}",

  };
  setState(() {
    priceloading=true;
  });
  print(_bod);
  var res = await http.post(
          //  "$host/users/auth/new"
            "$host/orders/order/price/edit/${or['id']}"
            ,
            headers: {
              "Authorization":token
            },
        body:_bod).timeout(Duration(seconds: 30), onTimeout: () {
      setState(() {
        priceloading = false;
        timeout = true;
      });
      return;
    });

     if (timeout) return;
    var pres = json.decode(res.body);
    print(pres);


   

    if (res.statusCode==201) {
  

     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres['data']["msg"]),));

    } else {
     
   //   EDailog.errorDialog(pres["message"], false, context);
     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres["message"]),));
    }
    setState(() {
      priceloading = false;
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


collectorsubmitostore() async {
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
            "$host/users/collector/orders/submit/${or['id']}"
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
Navigator.pop(context);
    } else {
     
   //   EDailog.errorDialog(pres["message"], false, context);
     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres["message"]),));
    }
    setState(() {
      loading2 = false;
    });

  }


collectorrejectedostore() async {
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
 
  var res = await http.post(
          //  "$host/users/auth/new"
            "$host/users/collector/orders/return/rejected/${or['id']}"
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


   

    if (res.statusCode==201) {
  

     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres['data']["msg"]),));
Navigator.pop(context);
    } else {
     
   //   EDailog.errorDialog(pres["message"], false, context);
     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres["message"]),));
    }
    setState(() {
      loading2 = false;
    });

  }



collectorreturntocostumer() async {
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
 
  var res = await http.post(
          //  "$host/users/auth/new"
   "$host/users/collector/collector/orders/return/client/rejected/${or['id']}"
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


   

    if (res.statusCode==201) {
  

     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres['data']["msg"]),));
Navigator.pop(context);
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
Navigator.pop(context);
    } else {
     
   //   EDailog.errorDialog(pres["message"], false, context);
     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres["message"]),));
    }
    setState(() {
      loading = false;
    });

  }




 printb(mul) async {
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
 
  var res = await http.post(
          //  "$host/users/auth/new"
            "$host/users/collector/orders/pickup"
            ,
            body: {
              "order_id":"${or['id']}",
           if(mul!=null)   "multiple":"$mul"
            },
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


   
mprint(or);
    if (res.statusCode==201) {
    

// mprint(or);
     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres['data']["msg"]),));
Navigator.pop(context);
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
 var msg=await Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
 DriverReject(),);}));

 if(msg==null)
 {
   setState(() {
     loading2=false;
   });
   return;}
 
  var res = await http.post(
          //  "$host/users/auth/new"
            "$host/users/drivers/orders/rejected/${or['id']}"
            ,
            body: {
              "msg":"$msg"
            },
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


   

    if (res.statusCode==201) {
  

     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres['data']["msg"]),));
Navigator.pop(context);
    } else {
     
   //   EDailog.errorDialog(pres["message"], false, context);
     Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(pres["message"]),));
    }
    setState(() {
      loading2 = false;
    });

  }



// TextEditingController drphone=TextEditingController();
TextEditingController drname=TextEditingController();

  showmodal(c,){
             showDialog(context: c,
                builder: (context) {
   // String contentText = "Content of Dialog";
    return StatefulBuilder(
      builder: (context, st) {
        return SizedBox(
          height: 200,
          child: AlertDialog(
            
            title: Text("تعديل السعر"),
            content:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
            
                Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10),
                    child: TextField(
                     // maxLines: 6,
                      //minLines: 2,
                    
                      controller: drname,
                   
                    keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                           disabledBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                        border: OutlineInputBorder(
 borderRadius: BorderRadius.circular(10)

                        ),
                        labelText: "السعر",
                      ),
                    ),
                  ),

            
              ],
            ), 
            actions: <Widget>[
              FlatButton(
                textColor: mc,
                onPressed: () => Navigator.pop(context),
                child: Text("الغاء"),
              ),
              FlatButton(
                
                onPressed: () {
                  // if(loading2)
                  // return;

             
                  st(() {
                    // loading2=true;
                  });
              // transfare(drname.text, drphone.text, gov);

printb(drname.text);
Navigator.of(context).pop();
           
                  setState(() {
                    
                  });
                },
                textColor: sc,
                child: Text(
                  // loading2?"Updating...":
                  "طباعة"),
              ),
            ],
          ),
        );
      },
                                 );
                 
               });
  }

  





  TextEditingController editidprice=TextEditingController();

  editPricemodal(c,){
             showDialog(context: c,
                builder: (context) {
   // String contentText = "Content of Dialog";
    return StatefulBuilder(
      builder: (context, st) {
        return SizedBox(
          height: 200,
          child: AlertDialog(
            
            title: Text("تعديل السعر"),
            content:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
            
                Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10),
                    child: TextField(
                     // maxLines: 6,
                      //minLines: 2,
                    
                      controller: editidprice,
                   
                    keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                           disabledBorder:  OutlineInputBorder(
                                
                                    borderSide: BorderSide(color: Colors.white
                                    ,width: 4),
                                    // borderRadius: BorderRadius.vertical(
                                    //   top: Radius.circular(30)
                                    // )
                                  ),
                        border: OutlineInputBorder(
 borderRadius: BorderRadius.circular(10)

                        ),
                        labelText: "السعر الجديد",
                      ),
                    ),
                  ),

            
              ],
            ), 
            actions: <Widget>[
              FlatButton(
                textColor: mc,
                onPressed: () => Navigator.pop(context),
                child: Text("الغاء"),
              ),
              FlatButton(
                
                onPressed: () {
                  // if(loading2)
                  // return;

             
                  st(() {
                    // loading2=true;
                  });
              // transfare(drname.text, drphone.text, gov);

// printb(drname.text);
editprice();
Navigator.of(context).pop();
           
                  setState(() {
                    
                  });
                },
                textColor: sc,
                child: Text(
                  // loading2?"Updating...":
                  "تعديل"),
              ),
            ],
          ),
        );
      },
                                 );
                 
               });
  }

  
}