import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sunmi_thermal_printer_example/orderDetails.dart';
import 'dart:convert';
import 'package:intl/intl.dart' as intl;
import 'package:sunmi_thermal_printer_example/reportsOrders.dart';
import 'main.dart';

class Reports extends StatefulWidget {
  final notf;

  const Reports({Key key, this.notf}) : super(key: key);
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  ScrollController scr = ScrollController();
  bool search = false;
  TextEditingController searchc = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getOrders(true);
//       scr.addListener((){
// if(scr.offset>= scr.position.maxScrollExtent)
// {print("object");
// print(orders.length);
//   if(!lastPage)
//   {
//     if(orders.length<1)
//     return;
//     print("new page");
//     page++;
//     getOrders(false);

//   }
// }
// });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: mc,
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Container(
              // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 66,
                  ),
//                      InkWell(
// onTap: (){
//   setState(() {
//     search=!search;
//     if(!search)
//     {
//        loading=true;
//  page=1;
//  maxCount=-1;
//  lastPage=false;
//  timeout=false;
//  getOrders(true);
//     }
//     print(search);

//   });
// },

//                                             child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Stack(
//                           children: [
//                             Image.asset(
//                               "assets/redgrad.png",

//                               height: 38,),
//                               Positioned(
// top: 0,
// right: 10,
//                                bottom: 0,
//                                // bottom: 0,
//                        child: Center(
//                            child: Icon(Icons.search,color: Colors.white,)
//                          ),
//                               )
//                           ],
//                         )),
//                      ),
                  Center(
                    child: Image.asset(
                      "assets/logo.png",
                      height: 63,
                    ),
                  ),
                  //  SizedBox(width: 66,),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Stack(
                      children: [
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(pi),
                          child: Image.asset(
                            "assets/redgrad.png",
                            height: 38,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 10,
                          bottom: 0,
                          // bottom: 0,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            height: 50,
            top: 120,
            left: 0,
            right: 0,
            child: 
            Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
Material(
  elevation: 4,
  color: sc,
  borderRadius: BorderRadius.circular(8),
  child:   InkWell(
  
    onTap: (){
  
      showDatePicker(context: context,
  
      firstDate: DateTime.parse("2021-01-01"),
  
        lastDate: DateTime.now(),
         initialDate: DateTime.now(),


       ).then((value) {
  if(value==null)
  return;
       print("value $value");
  String n="${value.year}-${value.month}-${value.day}"; 
   String formattedDate = 
   intl.DateFormat('dd/MM/yyyy').format(value);  
   print(formattedDate);
   from="$formattedDate";
   setState(() {
     
   });
  // return;
    // getOrders(true);

         showDatePicker(context: context,
  
      firstDate: DateTime.parse("2021-01-01"),
  
        lastDate: DateTime.now(),
         initialDate: DateTime.now(),
       ).then((value) {
  if(value==null)
  return;
       print("value $value");
  String n="${value.year}-${value.month}-${value.day}"; 
   String formattedDate = 
   intl.DateFormat('dd/MM/yyyy').format(value);  
   print(formattedDate);
   to="$formattedDate";
   setState(() {
     
   });
  // return;
    getOrders(true);


  
       });
  
  
       });
  
    },
  
    child:   
  
    
  
            Padding(
  
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 5
              ),
  
              child: Text(from==null?"من":"$from",
  
                style: TextStyle(
  color: Colors.white,
      fontSize: 19,
  
      fontWeight: FontWeight.bold,
  
      // color: mcolor
  
    ),),
  
            ),
  
    
  
           
  
    
  
    
  
  ),
) ,
 Text(" - ",
   style: TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
     color: Colors.white
  ),),

 Material(
  elevation: 4,
  color: sc,
  borderRadius: BorderRadius.circular(8),
    child: InkWell(
    onTap: (){
         showDatePicker(context: context,
  
      firstDate: DateTime.parse("2021-01-01"),
  
        lastDate: DateTime.now(),
         initialDate: DateTime.now(),
       ).then((value) {
  if(value==null)
  return;
       print("value $value");
  String n="${value.year}-${value.month}-${value.day}"; 
   String formattedDate = 
   intl.DateFormat('dd/MM/yyyy').format(value);  
   print(formattedDate);
   to="$formattedDate";
   setState(() {
     
   });
  // return;
  getOrders(true);

  
       });
    },
    child:   
    
            Padding(
               padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 5
              ),
              child: Text(to==null?"ألى":"$to",
                style: TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.bold,
      color: Colors.white
    ),
              ),
            ),
    
           
    
    
),
 ) ,
    ],),
          ),
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            bottom: 0,
            child:loading? 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      Colors.white
                    ),
                  ),
                ),
              ],
            ):
            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //  crossAxisSpacing: 10,
                  crossAxisCount: 2),

              //   controller: scr,
              children: [
//                 AnimatedOpacity(
//                   duration: Duration(milliseconds: 170),
//                   opacity:search?1:0,
//                                   child: AnimatedContainer(
//                     height: search?60:0,
//                     duration: Duration(milliseconds: 200),

//                     child:
//                   Theme(data: ThemeData(primaryColor: Colors.white,),

//                                     child: TextField(
//                                       onEditingComplete: (){
//                                           orders=[];
//  loading=true;
//  page=1;
//  maxCount=-1;
//  lastPage=false;
//  timeout=false;
//  getOrders(true);
//                                       },
//                                       style: TextStyle(color: Colors.white),
//                                       controller: searchc,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(50),
//                         borderSide: BorderSide(
//                         color: Colors.white
//                       )),
//                       enabledBorder:  OutlineInputBorder(
// borderRadius: BorderRadius.circular(50),
//                         borderSide: BorderSide(
//                         color: Colors.white,

//                       )),

// prefixIcon: Icon(Icons.search,
// color: Colors.white,
// // color: Colors.white,
// )
// // co
//                     ),
//                     ),
//                   ) ,),
//                 ),

//                 GridTile(
//                                   child: Material(
// color: sc,
// borderRadius: BorderRadius.circular(8),
// elevation: 5,

//                   ),
//                 ),
                orderModel('عدد الطلبات الداخلة الى الشركة',orders['order_count'],"order_count"),

              orderModel('مبالغ الطلبات تم استلامها من الشركة'
              ,orders['clinet_order_payed'],'clinet_order_payed'),

        //  orderModel('مبالغ الطلبات المتبقية',
        //  orders['clinet_order_Unpayed']),

        //  orderModel('مجوع سعر التصويل',orders['shipping_price']),

         orderModel('عدد الطلبات التي تم استلام مبالغها',
         orders['payed_orders_counts'],'payed_orders_counts'),

         orderModel('عدد الطلبات التي لم يتم استلام مبالغها',orders['unpayed_orders_counts'],'unpayed_orders_counts'),
         orderModel('عدد الطبات  الراجع',orders['rejected_orders_counts'],'rejected_orders_counts'),
        //  orderModel('  مبالغ الطلبات الراجع',orders['rejected_orders_amount']),
        //  orderModel('مبالغ الطلبات الراجع التي تم تسلمها اليك',
        //  orders['rejected_client_orders_amount']),
                orderModel('عدد الطلبات الراجع التي تم تسلمها اليك',
                orders['rejected_client_orders_count'],'rejected_client_orders_count'),

                //  ...widget.notf.map((e){
                //    print(e);
                //    return orderModel(e);
                //  }).toList()
              ],
            ),
          )
        ],
      ),
    );
  }
var from;
var to;
  Widget orderModel(txt,val,String stat) {
    return InkWell(
      onTap: (){

        
DateTime now=DateTime.now();
       String ffrom = 
   intl.DateFormat('dd/MM/yyyy').format(now.subtract(
     Duration(
       days: 30
     )
   ));  
   String fto = 
   intl.DateFormat('dd/MM/yyyy').format(now);  
if(from!=null&&to!=null)
{
fto=to;
ffrom=from;
}

        Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
        ReportOrders(
from: ffrom,to: fto,
status: stat,
        ),);}));
        
      },
      child: GridTile(
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: sc,
            borderRadius: BorderRadius.circular(8),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                 Row(
                   children: [
                     Expanded(
                                          child: Text("$txt",
                       style:
                            TextStyle(color:
                             Colors.white,
                             fontSize: 17
                              // fontWeight: FontWeight.bold
                              ),
                ),
                     ),
                   ],
                 ),
                 
                Expanded(
                                child: Center(
                                  child: 
                                  Text("$val",
                   style:
                        TextStyle(color: Colors.white, 
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                                ),
                )
              ],),
            ),
          ),
        ),
      ),
    );
   
  }

  var selectednotf = -1;

  var orders;
  bool loading = true;
  int page = 1;
  var maxCount = -1;
  bool lastPage = false;
  var timeout = false;
  void getOrders(bool first) async {
    timeout = false;
DateTime now=DateTime.now();
       String ffrom = 
   intl.DateFormat('dd/MM/yyyy').format(now.subtract(
     Duration(
       days: 30
     )
   ));  
   String fto = 
   intl.DateFormat('dd/MM/yyyy').format(now);  
if(from!=null&&to!=null)
{
fto=to;
ffrom=from;
}

    //  if(first)
//       Connectivity().checkConnectivity().then((c){
// if(c==ConnectivityResult.none)
// {
//   timeout=true;
//   return;
// }
//     });

    // if (orders.length > 0 && maxCount != -1 && orders.length >= maxCount) {
    //   print("get");

    //   lastPage = true;
    //   return;
    // }
    // if (first) orders = [];
    // setState(() {
    //   loading = true;
    // });

    String link =
        "$host/orders/client/reports/my?from=$ffrom&to=$fto";
    if (search && searchc.text.length > 0) {
      link += "&search=${searchc.text}";
    }

// if(selectedSort!=-1)
// {
//   setState(() {
//     loading=true;
//   });
//   var _sort=sort2[selectedSort];
//   link+="&sort=$_sort";
// }
    var res = await http.get(link, headers: {"Authorization": token}).timeout(
        Duration(
          seconds: 45,
        ), onTimeout: () {
      setState(() {
        timeout = true;
        loading = false;
      });
      return;
    });
    if (timeout) return;
    if (first) orders = [];
    print(link);
    var pres = json.decode(res.body);
    print(pres);
//catgs=pres["data"]["categories"];

    setState(() {
      orders = pres['data'];
      //    orders.addAll(pres["data"]["data"]['my_orders']);
      //   print(orders.length);
      // maxCount=pres["data"]['data']["totalItems"];
      // // print(orders[0]);
      // // count=pres["data"]["totalItems"];
      loading = false;
    });
    print("clients: $orders");
  }

  deletnot(or) async {
    if (loading) return;

    FocusScope.of(context).requestFocus(new FocusNode());

    // if (!formKey.currentState.validate()) {
    //   // If the form is valid, display a snackbar. In the real world,
    //   // you'd often call a server or save the information in a database.

    // return;
    // }

    setState(() {
      loading = true;
      selectednotf = or;
    });

    var res = await http.delete(
      //  "$host/users/auth/new"
      "$host/users/notification/$or",
      headers: {"Authorization": token},
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

    List x;

    if (res.statusCode == 200) {
      //  Scaffold.of(b).showSnackBar(
      // SnackBar(content: Text(pres['data']["msg"]),));

    } else {
      //   EDailog.errorDialog(pres["message"], false, context);
      //  Scaffold.of(b).showSnackBar(
      // SnackBar(content: Text(pres["message"]),));
    }
    setState(() {
      loading = false;
      selectednotf = -1;

      widget.notf.removeWhere((element) => element['id'] == or);
    });
  }
}
