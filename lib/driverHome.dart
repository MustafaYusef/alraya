import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunmi_thermal_printer_example/addOrder.dart';
import 'package:sunmi_thermal_printer_example/notfs.dart';
import 'package:sunmi_thermal_printer_example/orders.dart';
import 'package:sunmi_thermal_printer_example/signin.dart';
import 'dart:math';
import 'checkouts.dart';
import 'main.dart';
import 'orderDetails.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class DriverHome extends StatefulWidget {
  @override
  _DriverHomeState createState() => _DriverHomeState();
}

var prof;
class _DriverHomeState extends State<DriverHome> {

   ScrollController scr=ScrollController();
bool search=false;
TextEditingController searchc=new TextEditingController();

  bool menu=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      getOrders(true);
      scr.addListener((){
if(scr.offset>= scr.position.maxScrollExtent)
{print("object");
print(orders.length);
  if(!lastPage)
  {
    if(orders.length<1)
    return;
    print("new page");
    page++;
    getOrders(false);

  }
}
});
  getprof();  
  print("driver");
  }

  var ind=0;
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
      Positioned(
            top: 125,
            right: 20,
            left: 20,
            child: 
            Container(
              height: 60,
              // child: Text("s"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
setState(() {
  ind=0;
});
  loading=true;
 page=1;
 maxCount=-1;
 lastPage=false;
 timeout=false;
 getOrders(true);
                    },
                    child:       Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("قيد المعالجة",
            style: TextStyle(
              color:ind==0? Colors.white:Colors.grey
              ,fontWeight: FontWeight.bold,
              fontSize: 17
            ),),
                          ),
                        ),
                          VerticalDivider(
                    color: mc,
                    thickness: 1.5,
                  ),
                      ],
                    ) ,
                  ),
                
                     InkWell(
                    onTap: (){
setState(() {
  ind=1;
});
  loading=true;
 page=1;
 maxCount=-1;
 lastPage=false;
 timeout=false;
 getOrders(true);
                    },
                    child:       Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("تم التوصيل",
            style: TextStyle(
              color:ind==1? Colors.white:Colors.grey
              ,fontWeight: FontWeight.bold,
              fontSize: 17
            ),),
                    ) ,
                  ),
                
                      InkWell(
                    onTap: (){
setState(() {
  ind=2;
});
  loading=true;
 page=1;
 maxCount=-1;
 lastPage=false;
 timeout=false;
 getOrders(true);

                    },
                    child:       SizedBox(
                      width: 100,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.sp,
                        children: [
                            VerticalDivider(
                      color: mc,
                      thickness: 1.5,
                  ),
                          Expanded(
                                                      child: Center(
                                                        child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("راجع",
            style: TextStyle(
             color:ind==2? Colors.white:Colors.grey
              ,fontWeight: FontWeight.bold,
              fontSize: 17
            ),),
                            ),
                                                      ),
                          ),
                        ],
                      ),
                    ) ,
                  ),
                ],
              ),
              // width: double.infinity,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(100),
  color: sc
),
            )
     
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
            top: 190,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView(
              controller: scr,
              children: [
                AnimatedOpacity(
                  duration: Duration(milliseconds: 170),
                  opacity:search?1:0,
                                  child: AnimatedContainer(
                    height: search?60:0,
                    duration: Duration(milliseconds: 200),
                    
                    child:
                  Theme(data: ThemeData(primaryColor: Colors.white,),
                  
                                    child: TextField(
                                      onEditingComplete: (){
                                          orders=[];
 loading=true;
 page=1;
 maxCount=-1;
 lastPage=false;
 timeout=false;
 getOrders(true);
                                      },
                                      style: TextStyle(color: Colors.white),
                                      controller: searchc,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                        color: Colors.white
                      )),
                      enabledBorder:  OutlineInputBorder(
borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                        color: Colors.white,
                        
                      )),
                    
prefixIcon: Icon(Icons.search,
color: Colors.white,
// color: Colors.white,
)
// co
                    ),
                    ),
                  ) ,),
                ),
             ...orders.map((e){
               return orderModel(e);
             }).toList()

            ],),
          ),
       AnimatedPositioned(
         duration: Duration(milliseconds: 200),
         bottom: 0,
         left: 0,
         right: 0,
         height:menu? 
         290
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
                   Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
                   Checkouts(),);}));
                   
                 },
                 leading: Icon(Icons.list),
                 title: Text("الحسابات"),
               ),
               Divider(),
                  // Divider(),
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
                 title: Text("تسجيل الخروج"),
               ),
             ],
           ),),
          // color: Colors.white,
         ),
       )
        ],),)
    );
  }

   Widget orderModel(ord){
return Container(
  margin: const EdgeInsets.symmetric(
    horizontal: 15,
    vertical: 8
  ),

  height: 224,
  decoration: BoxDecoration(
    color: sc,
    borderRadius: BorderRadius.circular(15)
  ),
  child:
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Padding(
    padding: const EdgeInsets.all(14.0),
    child: Text("${ord['phone']}",
    style: TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold),
    ),
  ),
  Divider(color: Colors.white,),
    Padding(
    padding: const EdgeInsets.all(14.0),
    child: Text("${ord['status']}",
    style: TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold),
    ),
  ),
  Divider(color: Colors.white,),
    Padding(
    padding: const EdgeInsets.all(14.0),
    child: Text("${ord['city']}",
    style: TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold),
    ),
  ),

   Align(
     alignment: Alignment.center,
        child: Container(
  //width: 200,
  child:   MaterialButton(
  
      
  
                                //minWidth: double.infinity,
  
                                elevation: 0,
  
                                shape: RoundedRectangleBorder(
  
                                  borderRadius: BorderRadius.vertical(
  
                                    bottom: Radius.circular(30)
  
                                  )
  
                                ),
  
                                 height: 50,
  minWidth: 200,
                                color: mc,
  
                                onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
OrderDetails(order: ord,),);}));

  
  // signIn();

                              },child: Text("تفاصيل الطلب",
  
                               style: TextStyle(
  
                                  color: Colors.white,
  
                                  fontWeight: FontWeight.bold,
  
                                  fontSize: 14
  
                                ),
  
                              ),),
),
   ),
  // Divider(color: Colors.white,),
],
),);

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


     var orders=[];
// bool loading=true;
int page=1;
var maxCount=-1;
bool lastPage=false;
// var timeout=false;
   void getOrders(bool first)async{
     String status;
     switch (ind) {
       case 0:
         status="watting";
         break;
           case 1:
         status="delivered";
         
         break;
          case 2:
         status="rejected";
         
         break;
       default:
     }
     timeout=false;
   //  if(first)
//       Connectivity().checkConnectivity().then((c){
// if(c==ConnectivityResult.none)
// {
//   timeout=true; 
//   return;
// }
//     });

print("a");
print(orders.length);
print(maxCount);

        if(orders.length>0&& maxCount!=-1&&orders.length>=maxCount)
    {    print("get");

      lastPage=true;
return;
    }
    if(first)
orders=[];
    setState(() {
   loading=true;
    });
    
    String link=
      "$host/users/drivers/orders/my?limit=10&page=$page&status=$status";
if(search&&searchc.text.length>0)
{
  link+="&search=${searchc.text}";
}

// if(selectedSort!=-1)
// {
//   setState(() {
//     loading=true;
//   });
//   var _sort=sort2[selectedSort];
//   link+="&sort=$_sort";
// }
var res= 
await http.get(
  link,headers: {"Authorization":token}
).timeout(
Duration(seconds: 45,),onTimeout:(){
setState(() {
  timeout=true;
loading=false;
});
return ;
}
);
if(timeout)
return;
 if(first)
orders=[];
print(link);
var pres=json.decode(res.body);
print(pres);
//catgs=pres["data"]["categories"];

    setState(() {
      
       orders.addAll(pres["data"]["data"]['my_orders']);
      print(orders.length);
    maxCount=pres["data"]['data']["totalItems"];
    // print(orders[0]);
    // count=pres["data"]["totalItems"];
    loading=false;
    });
print("clients: $orders") ;  
  }
}