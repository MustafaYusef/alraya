import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunmi_thermal_printer_example/addOrder.dart';
import 'package:sunmi_thermal_printer_example/notfs.dart';
import 'package:sunmi_thermal_printer_example/orders.dart';
import 'package:sunmi_thermal_printer_example/signin.dart';
import 'dart:math';
import 'main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

var prof;
class _HomeState extends State<Home> {
  bool menu=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  getprof();  
  }
  @override
  Widget build(BuildContext context) {
    print(is_Active);
    return Scaffold(

      body: Container(
        height: double.infinity,
        color: mc,
        child: Stack(children: [
          Positioned(
            top: 50,left: 0,
            right: 0,
            child: 
            Container(
              //color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                     Align(
                      alignment: Alignment.centerLeft,
                      child: Stack(
                        children: [
                          Transform(
                             alignment: Alignment.center,
  transform: Matrix4.rotationY(pi),
                            child: Image.asset(
                              "assets/grad.png",
                              
                              height: 38,),
                          ),
                            Positioned(
top: 0,
right: 10,
                             bottom: 0,
                             // bottom: 0,
                     child: InkWell(
                                   onTap: (){
                                     setState(() {
                                       menu=!menu;
                                     });
                                   },
                                            child: Center(
                         child: Image.asset(
                                     "assets/menu.png",
                                     height: 28,
                                       ),
                       ),
                     ),
                            )
                        ],
                      )),
                  Center(child:  Image.asset(
                            "assets/logo.png",
                            height: 63,
                            
                              ),),
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
                           child: InkWell(child: Stack(
                             children: [
                               Center(
                                                                child: Icon(Icons.notifications,
                                          color: Colors.white,),
                               ),
                               Positioned(
                                 right: 0,
                                 top: 3,
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  child: Center(
                                    child: Text("1",
                                    style: TextStyle(color: Colors.white,
                                    fontSize: 10),
                                    
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(100)
                                  ),
                                ), 
                               )
                             ],
                           ), onTap: (){
// Navigator.pop(context);
Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
Notfs(),);}));


                                    }),
                                  )
                              ],
                            )),
                              //  SizedBox(width: 66,),
              
                  
                ],
              ),
            ),
          ),
      if(prof!=null&&!is_Active)    Positioned(
            top: 125,
            right: 20,
            child: Text("الحساب غير مفعل",
            style: TextStyle(
              color: Colors.white
              ,fontWeight: FontWeight.bold,
              fontSize: 22
            ),),
          ),
     if(prof!=null&&!is_Active)        Positioned(
            top: 164,
            right: 20,
            child: Text("يرجى مراسلة الشركة لتفعيل الحساب",
            style: TextStyle(
              color: Colors.white
              ,fontWeight: FontWeight.w500,
              fontSize: 18
            ),),
          ),
//               Positioned(
//            top: 130,
//         left: 20,
//           right: 20,
          
//           child:      MaterialButton(
//                         minWidth: double.infinity,
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.vertical(
//                             bottom: Radius.circular(0)
//                           )
//                         ),
//                         height: 60,
//                         color: sc,
//                         onPressed: (){
                     
//                       pr();    
// // signIn();
//                       },child:
//                       // Icon(Icons.add_circle_outline,
//                       // color: Colors.white,
//                       // size: 36,)
//                        Text("طباعة",
//                        style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18
//                         ),
//                       ),
//                       ),
//           // child: Text("asdad"),
//           ),
               Positioned(
           top: 205,
        left: 20,
          right: 20,
          
          child:      MaterialButton(
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
                          // Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
                          // Home(),);}));
                       Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
                       AddOrder(),);}));
                          
// signIn();
                      },child:
                      Icon(Icons.add_circle_outline,
                      color: Colors.white,
                      size: 36,)
                      //  Text("تسجيل الدخول",
                      //  style: TextStyle(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 18
                      //   ),
                      // ),
                      ),
          // child: Text("asdad"),
          ),
          Positioned(
            height: 408,
        left: 0,
          bottom: 0,
          
           child: Image.asset('assets/dc.png'),
          ),
       AnimatedPositioned(
         duration: Duration(milliseconds: 200),
         bottom: 0,
         left: 0,
         right: 0,
         height:menu? 
         215
         :0,
         child: Container(
           child:Material(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.vertical(
                top: Radius.circular(25)
               )
             ),
             elevation: 4,
             color: Colors.white,
             child: 
           Column(
             children: [
               SizedBox(height: 15,),
               ListTile(
                 onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
                   Orders(),);}));
                   
                 },
                 leading: Icon(Icons.history),
                 title: Text("سجل الطلبات"),
               ),
               Divider(),
                 ListTile(
                 leading: Icon(Icons.chat_outlined),
                 title: Text("سجل المحادثات"),
               ),
                  Divider(),
                 ListTile(
                   onTap: (){
                     setState(() {
                       token=null;
                       role=null;
                     });
                     SharedPreferences.getInstance().then((s) {
     s.setString('token', null);
     s.setInt('role', null);
     Navigator.pushAndRemoveUntil(context, 
     MaterialPageRoute(builder: (c){
return SignIn();
     }), (route) => false);
                     });
                   },
                 leading: Icon(Icons.account_circle),
                 title: Text("الملف الشخصي"),
               ),
             ],
           ),),
          // color: Colors.white,
         ),
       )
        ],),)
    );
  }

     bool loading=false;

bool timeout=false;

  getprof() async {
  


  setState(() {
    loading=true;
  });
  var res = await http.get(
          //  "$host/users/auth/new"
            "$host/users/auth/profile"
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
  prof=pres['data']['profile'];
  print(prof['is_Active']);
  is_Active=prof['is_Active'];
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