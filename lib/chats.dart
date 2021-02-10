import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:sunmi_thermal_printer_example/conv.dart';
import 'package:sunmi_thermal_printer_example/orderDetails.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:convert';

import 'main.dart';
import 'nonet.dart';

var addmsg;

class Chats extends StatefulWidget {
  final status;

  const Chats({Key key, this.status}) : super(key: key);
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {

  ScrollController scr=ScrollController();
bool search=false;
TextEditingController searchc=new TextEditingController();

IO.Socket socket;
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

// IO.Socket socket = IO.io('http://localhost:3000');
// socket.on('connect', (_) {
//   print('connect');
//   socket.emit('msg', 'test');
// });
// socket.on('event', (data) => print(data));
// socket.on('disconnect', (_) => print('disconnect'));
// socket.on('fromServer', (_) => print(_));

 socket = IO.io('$host',
  OptionBuilder()
      .setTransports(['websocket']) // for Flutter or Dart VM
      // .setExtraHeaders({'foo': 'bar'}) // optional
      .build());

 print("conected: ${socket.connected}");
 socket.connect();
 socket.onError((data) {
print(data);
print('error');
 });
 socket.onConnectTimeout((data) {
   if(!mounted||!ModalRoute.of(context).isCurrent)
return;
print(data);
print("time outtt");

Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
NoNet(),);})
).then((value) {
   orders=[];
 loading=true;
 page=1;
 maxCount=-1;
 lastPage=false;
      
        getOrders(true);
  socket.connect();
});

print('timeout');
 });
 
  socket.onConnectError((data) {
print(data);
print('cr');
 });
  socket.onConnecting((data) {
print(data);
print('conecting');
 });
    socket.onConnect((_) {
      print('connect'); 
    //  socket.emit('msg', 'test');
    });
    socket.on('chat_msg', (data) {
      print(data);
      print(data['msg']);
      if(addmsg!=null)
      {
        print('adding');
        addmsg(data);
      }
setState(() {
  var conv=
  orders.firstWhere((element) 

   {
    print(element);
        print(element['from']);

     return element['id']==data['conversation_id'];
     },orElse: (){
       
     }
     )
     ;
   print(conv);

   if(conv!=null)
   {
     setState(() {
       print("update");
            conv['chat']['msg']=data["msg"];

     });
   }
});
    });
    socket.onDisconnect((_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
socket.dispose();  }
  var ind=0;
  @override
  Widget build(BuildContext context) {
    // print(ModalRoute.of(context).);
 
    // print("s${socket.disconnected}"); 
    // if(socket.disconnected)
    // {
    //   socket.connect();
    // }
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
                    child:  Text("سجل المحادثات",
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
//            if(widget.status==null)   Positioned(
//             top: 125,
//             right: 20,
//             left: 20,
//             child: 
//             Container(
//               height: 60,
//               // child: Text("s"),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   InkWell(
//                     onTap: (){
// setState(() {
//   ind=0;
// });
//   loading=true;
//  page=1;
//  maxCount=-1;
//  lastPage=false;
//  timeout=false;
//  getOrders(true);
//                     },
//                     child:       Row(
//                       children: [
//                         SizedBox(
//                           width: 100,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text("قيد المعالجة",
//             style: TextStyle(
//               color:ind==0? Colors.white:Colors.grey
//               ,fontWeight: FontWeight.bold,
//               fontSize: 17
//             ),),
//                           ),
//                         ),
//                           VerticalDivider(
//                     color: sc,
//                     thickness: 1.5,
//                   ),
//                       ],
//                     ) ,
//                   ),
                
//                      InkWell(
//                     onTap: (){
// setState(() {
//   ind=1;
// });
//   loading=true;
//  page=1;
//  maxCount=-1;
//  lastPage=false;
//  timeout=false;
//  getOrders(true);
//                     },
//                     child:       Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text("تم التوصيل",
//             style: TextStyle(
//               color:ind==1? Colors.white:Colors.grey
//               ,fontWeight: FontWeight.bold,
//               fontSize: 17
//             ),),
//                     ) ,
//                   ),
                
//                       InkWell(
//                     onTap: (){
// setState(() {
//   ind=2;
// });
//   loading=true;
//  page=1;
//  maxCount=-1;
//  lastPage=false;
//  timeout=false;
//  getOrders(true);

//                     },
//                     child:       SizedBox(
//                       width: 100,
//                       child: Row(
//                         // mainAxisAlignment: MainAxisAlignment.sp,
//                         children: [
//                             VerticalDivider(
//                       color: sc,
//                       thickness: 1.5,
//                   ),
//                           Expanded(
//                                                       child: Center(
//                                                         child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text("راجع",
//             style: TextStyle(
//              color:ind==2? Colors.white:Colors.grey
//               ,fontWeight: FontWeight.bold,
//               fontSize: 17
//             ),),
//                             ),
//                                                       ),
//                           ),
//                         ],
//                       ),
//                     ) ,
//                   ),
//                 ],
//               ),
//               // width: double.infinity,
// decoration: BoxDecoration(
//   borderRadius: BorderRadius.circular(100),
//   color: mc
// ),
//             )
     
//           ),
          Positioned(
            top:130,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView(
              controller: scr,
              padding: EdgeInsets.symmetric(
                vertical: 0
              ),
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

    return ListTile(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
        Chat(id: ord['id'],ord: ord,),);})).then((value) {
          addmsg=null;
        });
        
      },
      leading: Image.asset("assets/man.png"),
      title: Text("${ord['from']['name']}",
      style: TextStyle(color: Colors.white),
      
      ),
      subtitle: Text("${ord['chat']['msg']}",
      style: TextStyle(color: Colors.white),
      
      ), 
    );
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
  Divider(color: Colors.white,),
  Padding(
    padding: const EdgeInsets.all(14.0),
    child: Text("رقم الهاتف: ${ord['phone']}",
    style: TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold),
    ),
  ),
  Divider(color: Colors.white,),
    Padding(
    padding: const EdgeInsets.all(14.0),
    child: Text(" الحالة: ${statobj[ord['status']]}",
    style: TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold),
    ),
  ),
  Divider(color: Colors.white,),
    Padding(
    padding: const EdgeInsets.all(14.0),
    child: Text("المدينة: ${ord['city']}",
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
      "$host/users/conversation/my";
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
      if(!mounted||!ModalRoute.of(context).isCurrent)
return;
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
      if(!mounted||!ModalRoute.of(context).isCurrent)
return 1;
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
      
       orders.addAll(pres["data"]['my_conversation']);
      print(orders.length);
    // maxCount=pres["data"]['data']["totalItems"];
    // print(orders[0]);
    // count=pres["data"]["totalItems"];
    loading=false;
    });
print("clients: $orders") ;  
  }

}

