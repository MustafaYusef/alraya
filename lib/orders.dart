import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sunmi_thermal_printer_example/orderDetails.dart';
import 'dart:convert';

import 'main.dart';
import 'nonet.dart';

class Orders extends StatefulWidget {
  final status;

  const Orders({Key key, this.status}) : super(key: key);
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  ScrollController scr=ScrollController();
bool search=false;
TextEditingController searchc=new TextEditingController();
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

  }
  var ind=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Container(color: sc,),
        ),
 
         

           Positioned(
            top: 50,
            left: 0,
           
            right: 0,
            child:  
            Container(
              // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                     InkWell(
onTap: (){
  setState(() {
    search=!search;
    if(!search)
    {
       loading=true;
 page=1;
 maxCount=-1;
 lastPage=false;
 timeout=false;
 getOrders(true);
    }
    print(search);

  });
},

                                            child: Align(
                        alignment: Alignment.centerLeft,
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/redgrad.png",
                              
                              height: 38,),
                              Positioned(
top: 0,
right: 10,
                               bottom: 0,
                               // bottom: 0,
                       child: Center(
                           child: Icon(Icons.search,color: Colors.white,)
                         ),
                              )
                          ],
                        )),
                     ),
                  Center(
                    child:  Text("سجل الطلبات",
            style: TextStyle(
              color: Colors.white
              ,fontWeight: FontWeight.bold,
              fontSize: 18
            ),),
                    // child:  Image.asset(
                    //         "assets/logo.png",
                    //         height: 63,
                            
                    //           ),
                              ),
                              //  SizedBox(width: 66,),
                            InkWell(
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
                     child: Icon(Icons.arrow_back_ios_rounded,
                                color: Colors.white,),
                              )
                                ],
                              ),
                            ),
                 
                  
                ],
              ),
            ),
          ),
           if(widget.status==null)   Positioned(
            top: 125,
            right: 10,
            left: 10,
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
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 130,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("قيد المعالجة",
            style: TextStyle(
              color:ind==0? Colors.white:Colors.grey
              ,fontWeight: FontWeight.bold,
              fontSize: 17
            ),),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(100),
                color: sc,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(" ${count[0]}",
                style: TextStyle(
                  color:ind==0? Colors.white:Colors.grey
                  ,fontWeight: FontWeight.bold,
                  fontSize: 12
                ),),
                            ),
              ),
            ),
                              ],
                            ),
                          ),
                        ),
                          VerticalDivider(
                    color: sc,
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
                    child:       Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("تم التوصيل",
            style: TextStyle(
              color:ind==1? Colors.white:Colors.grey
              ,fontWeight: FontWeight.bold,
              fontSize: 17
            ),),
                        ),
                        Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(100),
                color: sc,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(" ${count[1]}",
                style: TextStyle(
                  color:ind==0? Colors.white:Colors.grey
                  ,fontWeight: FontWeight.bold,
                  fontSize: 12
                ),),
                            ),
              ),
                      ],
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
                      color: sc,
                      thickness: 1.5,
                  ),
                          Expanded(
                                                      child: Center(
                                                        child: Row(
                                                          children: [
                                                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("راجع",
            style: TextStyle(
             color:ind==2? Colors.white:Colors.grey
              ,fontWeight: FontWeight.bold,
              fontSize: 17
            ),),
                            ),
                            Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(100),
                color: sc,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(" ${count[2]}",
                style: TextStyle(
                  color:ind==0? Colors.white:Colors.grey
                  ,fontWeight: FontWeight.bold,
                  fontSize: 12
                ),),
                            ),
              ),
                                                          ],
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
  color: mc
),
            )
     
          ),
          Positioned(
            top:widget.status!=null?
            130
            : 190,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView(
              controller: scr,
              padding: EdgeInsets.symmetric(
                vertical: 0
              ),
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
           if  ( orders.length>0  )...orders.map((e){
                 return orderModel(e);
               }).toList(),

                if  ( orders.length<=0 &&!loading )
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: Text("لا توجد بيانات",style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold
                    ,fontSize: 18
                    )),
                  ),
                ),
if(loading)
Padding(
  padding: const EdgeInsets.only(
    top: 25
  ),
  child:   Center(
  
    child:   CircularProgressIndicator(
  
    
  
      valueColor: AlwaysStoppedAnimation(Colors.white),
  
    
  
    ),
  
  ),
)
       ],),
          )
      ],),
    );
  }
  Widget orderModel(ord){
return Container(
  margin: const EdgeInsets.symmetric(
    horizontal: 15,
    vertical: 8
  ),
  padding: const EdgeInsets.symmetric(
    // horizontal: 15,
    vertical: 8
  ),

  // height: 224,
  decoration: BoxDecoration(
    color: mc,
    borderRadius: BorderRadius.circular(15)
  ),
  child:
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Padding(
    padding: const EdgeInsets.all(14.0),
    child: Text("رقم الطلب: ${ord['id']}",
    style: TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold),
    ),
  ),
  // Divider(color: Colors.white,),
  // Padding(
  //   padding: const EdgeInsets.all(14.0),
  //   child: Text("رقم الهاتف: ${ord['phone']}",
  //   style: TextStyle(color: Colors.white,
  //   fontWeight: FontWeight.bold),
  //   ),
  // ),
  Divider(color: Colors.white,),
    Padding(
    padding: const EdgeInsets.all(14.0),
    child: Text(" الحالة: ${statobj[ord['status']]}",
    style: TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold),
    ),
  ),
  if( ord['is_payed']==true) Divider(color: Colors.white,),
  if( "${ord['is_payed']}"=="true")   Padding(
    padding: const EdgeInsets.all(14.0),
    child: Row(
      children: [
        Text("  تم المحاسبة  ",
        style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold),
        ),    
            Icon(Icons.check, color: Colors.white,),

      ],
    ),
  ),
  // Divider(color: Colors.white,),
  //   Padding(
  //   padding: const EdgeInsets.all(14.0),
  //   child: Text("المدينة: ${ord['city']}",
  //   style: TextStyle(color: Colors.white,
  //   fontWeight: FontWeight.bold),
  //   ),
  // ),

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
                                color: sc,
  
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

   var orders=[];
bool loading=true;
int page=1;
var maxCount=-1;
bool lastPage=false;
var timeout=false;
var count=[0,0,0];
   void getOrders(bool first)async{
         String status;
  if(widget.status==null)   switch (ind) {
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
     else{
       status=widget.status;
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
      "$host/orders/client/orders/my?limit=11&page=$page&status=$status";
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
).timeout(Duration(seconds: 25), onTimeout: () {
      setState(() {
        loading = false;
        timeout = true;
      });
       Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
      NoNet(),);})).then((value) {
        getOrders(true);
         orders=[];
 loading=true;
 page=1;
 maxCount=-1;
 lastPage=false;
      });
      return;
    }).catchError((e){
      print(e);
      print('error');
      
      Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
      NoNet(),);})).then((value) {
               orders=[];
 loading=true;
 page=1;
 maxCount=-1;
 lastPage=false;
      
        getOrders(true);
      });
      timeout=true;
      return 1;
    });
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
    count[0]=pres["data"]['data']["wattingCount"];
        count[1]=pres["data"]['data']["deliveredCount"];
    count[2]=pres["data"]['data']["rejectedCount"];


    loading=false;
    });
print("clients: $orders") ;  
  }

}

