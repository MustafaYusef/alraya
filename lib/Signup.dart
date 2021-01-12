import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunmi_thermal_printer_example/home.dart';
import 'package:sunmi_thermal_printer_example/maps.dart';
import 'package:http/http.dart' as http;
import 'package:sunmi_thermal_printer_example/signin.dart';
import 'package:sunmi_thermal_printer_example/state.dart';
import 'main.dart';
import 'package:flutter/material.dart';
//AIzaSyAbZOvdb_fUdBlC_ER2JpzhtQSwXN-NwGg
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
var city;

    TextEditingController name=new TextEditingController();
      TextEditingController shopname=new TextEditingController();
    TextEditingController phone=new TextEditingController();
    TextEditingController avrgorder=new TextEditingController();
    TextEditingController city2=new TextEditingController();
    TextEditingController pass =new TextEditingController();

   final formKey = GlobalKey<FormState>();
  FocusNode namef = FocusNode();
    FocusNode shopf = FocusNode();
  FocusNode phonef = FocusNode();
  FocusNode avrgf = FocusNode();
  FocusNode cityf = FocusNode();

  FocusNode passf = FocusNode();
 BuildContext b;

LatLng pos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Builder(
        builder: (context,) {
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
                        Center(child: Text("تسجيل حساب جديد",
                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    fontSize: 18
                                    ),)),
                        Align(
                            alignment: Alignment.centerLeft,
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
                           child: InkWell(child: Icon(Icons.arrow_back_ios_rounded,
                                    color: Colors.white,), onTap: (){
Navigator.pop(context);
                                    }),
                                  )
                              ],
                            )),
                        
                    ],
                  ),
                ),

                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                     child: Column(
                         children: [
                           SizedBox(height: 50,),
                             TextFormField(
                               style: TextStyle(color: Colors.white),
                                     focusNode: namef,
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
                                  hintText: "اسم المستخدم",
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
                                
                                    borderSide: BorderSide(
                                      color: Colors.white
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
                                
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                     vertical: 15
//                                   ),
//                                   child:  TextFormField(
//                                      focusNode: shopf,
//                                             validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'الرجاء قم بأدخال  اسم البيج';
//                                             }
//                                             return null;
//                                           },
                                    
//                                     controller: shopname,
//                                     style: TextStyle(color: Colors.white),
//                                   decoration: InputDecoration(
                                    
//                                     hintText: "اسم البيج",
//                               focusColor: Colors.white,
//                               hintStyle: TextStyle(
//                                   color: Colors.white
//                               ),
// errorStyle: TextStyle(
//                                   color: Colors.white
//                               ),
//                               focusedErrorBorder:  OutlineInputBorder(
                                
//                                     borderSide: BorderSide(
//                                    color: Colors.white
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
                                    ,top: 15
                                  ),
                                  child:  TextFormField(
                    style: TextStyle(color: Colors.white),

                                     focusNode: phonef,
                                            validator: (value) {
                                            if (value.isEmpty) {
                                              return 'الرجاء قم بأدخال رقم الهاتف';
                                            }
                                            return null;
                                          },
                                    keyboardType: TextInputType.phone,
                                    controller: phone,
                                    
                                  decoration: InputDecoration(
                                    helperText: "...9647712+",
                                    helperStyle: TextStyle(
                                  color: Colors.white
                              ) ,
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

                                     focusNode: avrgf,
                                            validator: (value) {
                                            if (value.isEmpty) {
                                              return 'الرجاء قم بأدخال عدد الطلبات';
                                            }
                                            return null;
                                          },
                                    
                                    controller: avrgorder,
                                  decoration: InputDecoration(
                                    
                                    hintText: "عدد الطلبات (تقريبي)",
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
                    
                    value: city,
                    icon: Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                    iconSize: 24,
                    elevation: 16,
                    hint: Text("المحافظة",
                      style: TextStyle(color: Colors.white),),
                    style: TextStyle(color: Colors.white),
                    underline: Container(height: 1, color: Colors.transparent),
                    onChanged: (String newValue) {

                      print(newValue=="بغداد");
                      city = newValue;
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
                                   Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15
                                  ),
                                  child:  TextFormField(
                    style: TextStyle(color: Colors.white),

                                     focusNode: cityf,
                                            validator: (value) {
                                            if (value.isEmpty) {
                                              return 'الرجاء قم بأدخال المدينة';
                                            }
                                            return null;
                                          },
                                    
                                    controller: city2,
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
                                ),    Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15
                                  ),
                                  child:  TextFormField(
                    style: TextStyle(color: Colors.white),

                                     focusNode: passf,
                                            validator: (value) {
                                            if (value.isEmpty) {
                                              return 'الرجاء قم بأدخال  كلمة المرور';
                                            }
                                            return null;
                                          },
                                    obscureText: true,
                                    controller: pass,
                                  decoration: InputDecoration(
                                    
                                    hintText: "كلمة المرور",
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
                    
                                     if (!formKey.currentState.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.

  
    return;
    }
   Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
       MapSample(),);}))
                                    .then((value) {
setState(() {
  pos=value;
});
signup();
                                    });
                                    
// signIn();
                                },child:loading?
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                    Colors.white
                                  ),
                                ):
                                 Text("التالي",
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

  signup() async {
    FocusScope.of(context).requestFocus(

    );
if(!phone.text.startsWith("00964"))
{
phone.text=phone.text.replaceFirst("00", "+");
}
print(phone.text);
    if(!phone.text.startsWith("+964"))
{
  print(true);
  if(phone.text.startsWith("0"))
  {
    phone.text=phone.text.replaceFirst("0", "");
  }
  phone.text="+964"+phone.text;
  print(phone.text);
    // Scaffold.of(b).showSnackBar(
    // SnackBar(content: Text("قم بتحديد موقعك على الخريطة رجاءا"),));
  // return;
}
if(phone.text.length!=14)
{
   Scaffold.of(b).showSnackBar(
    SnackBar(content: Text(" الرجاء قم بل تحقق من رقم الهاتف "),));
}

if(pos==null)
{
    Scaffold.of(b).showSnackBar(
    SnackBar(content: Text("قم بتحديد موقعك على الخريطة رجاءا"),));
  return;
}
    // if (!formKey.currentState.validate()) {
    //   // If the form is valid, display a snackbar. In the real world,
    //   // you'd often call a server or save the information in a database.

  
    // return;
    // }
    timeout = false;

   setState(() {
      loading = true;
    });

    var _bod={
         
           "name": "${name.text}",
          "phone": "${phone.text}",
          "password": pass.text,
          "player_id": "3113",
           "city":"${city2.text}",
 "government":"$city",
          "orders_average":"${avrgorder.text}",
          "role":"0",
// "longitude":"10.23",
// "latitude":"12.2323"
        };
        if(pos!=null){
      
         _bod["latitude"]="${pos.latitude}";
          _bod["longitude"]="${pos.longitude}";
        }

          var res = await http.post(
          //  "$host/users/auth/new"
            "https://alraai.altathamun.com/users/auth/new"
            ,
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
  //      token = pres["data"]["token"];
  //    role=pres["data"]["role"];
  //  await savepref();


   Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
       SignIn(),);}) , (route) => false);
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

  savepref() async{
 SharedPreferences prefs = await SharedPreferences.getInstance();
    //int counter = (prefs.getInt('counter') ?? 0) + 1;
    // print('Pressed $counter times.');
    await prefs.setString('token', token);
    await prefs.setInt('role', 0);
  }
}