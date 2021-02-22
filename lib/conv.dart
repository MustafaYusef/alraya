import 'dart:math';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sunmi_thermal_printer_example/chats.dart';
import 'package:sunmi_thermal_printer_example/orderDetails.dart';
import 'dart:convert';

import 'main.dart';
import 'nonet.dart';

class Chat extends StatefulWidget {
  final status;
final id;
final ord;

  const Chat({Key key, this.status, this.id, this.ord}) : super(key: key);
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

TextEditingController msgc=TextEditingController();
  ScrollController scr=ScrollController();
bool search=false;
TextEditingController searchc=new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
addmsg=(msg){
  print("cid ------ ${msg['conversation_id']}");
    print("cid ---- ${widget.id}");
    print('from user id ${msg['from_user_id']}');
    print("from user id ${widget.ord['from']['id']}"
);

  if(msg['conversation_id']==widget.id&&msg['from_user_id']!=id)
  {
setState(() {
   orders.insert(0,
            {"id": 76, "msg": "${msg['msg']}",
             "you":msg['from_user_id']==id}
            );
          msgc.text="";
});
  }

};
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
                    child:  Text("${widget.ord['from']['name']}",
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
            child: Column(
              children: [
                Expanded(
                                  child: ListView(
                    reverse: true,
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
                ),
          Container(
            color: Color(0xffF3F4F8),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30
            ),
            child: Material(
              // color: Colors.red,
              elevation: 5,
              borderRadius: BorderRadius.circular(50),
child: Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 20
  ),
  child:   Row(
    children: [
     
      Expanded(
              child: TextField(
                controller: msgc,
         textInputAction: TextInputAction.send,
        onSubmitted: (s){
       if(msgc.text.length<=0)
        return;
        sendmsg("${msgc.text}");
        setState(() {
          orders.insert(0,
            {"id": 76, "msg": "${msgc.text}", "you": true}
            );
          msgc.text="";

        });
        },
          decoration: InputDecoration(
        hintText: "ألرسالة",
            border: InputBorder.none,
        
            // fillColor: Colors.white,
        
            
        
            // filled: true,
        
          ),
        
        ),
        
      ),
       IconButton(icon: Icon(Icons.add_rounded,color: mc,size: 30,),
      onPressed: (){
        if(msgc.text.length<=0)
        return;
        sendmsg("${msgc.text}");
        setState(() {
          orders.insert(0,
            {"id": 76, "msg": "${msgc.text}", "you": true}
            );
          msgc.text="";

        });
      },
      ),
    ],
  ),
),
            ),
          )
              ],
            ),
          )
      ],),
    );
  }
  Widget orderModel(ord){
bool u=ord['you'];
    return ChatBubble(
      margin: EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 10
      ),
      elevation: 0,
      // alignment: ,
      backGroundColor:u?Color(0xffF3F4F8)
      :mc ,
      alignment:u? Alignment.topRight:Alignment.topLeft,
      child: Text(
      //  "السلام عليكم اتصل ومحد يرد"
        ord['msg']
      ,style: 
      TextStyle(color: u?Colors.grey[600]:
      Colors.white,),),
    clipper: ChatBubbleClipper5(type:u? BubbleType.sendBubble:
    BubbleType.receiverBubble),
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
      "$host/users/conversation/get/${widget.id}?limit=15&page=$page";
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
      
       orders.addAll(pres["data"]['chat']);
      print(orders.length);
     maxCount=pres["data"]["totalItems"];
    // print(orders[0]);
    // count=pres["data"]["totalItems"];
    loading=false;
    });
print("clients: $orders") ;  
  }

sendmsg(msg) async {
    timeout=false;
     if(loading)
     return;
//     FocusScope.of(context).requestFocus(
// new FocusNode()
//     );

    // if (!formKey.currentState.validate()) {
    //   // If the form is valid, display a snackbar. In the real world,
    //   // you'd often call a server or save the information in a database.

  
    // return;
    // }

  // setState(() {
  //   // loading=true;

  // });
 
  var res = await http.post(
          //  "$host/users/auth/new"
            "$host/users/chat/"
            ,
            headers: {
              "Authorization":token
            },
            body: {
              "msg":"$msg",
              "user_id":"${widget.ord['from']['id']}"
            }
      ).timeout(Duration(seconds: 20), onTimeout: () {
      setState(() {
        loading = false;
        timeout = true;
      });
       Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
      NoNet(),);})).then((value) {
        setState(() {
               loading=false;
            
             }); 
      });
      return;
    }).catchError((e){
      print(e);
      print('error');
      
      Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
      NoNet(),);})).then((value) {

             setState(() {
               loading=false;
              //  loading2=false;
              //      priceloading = false;
             }); 
      });
      timeout=true;
      return 1;
    });

     if (timeout) return;
    var pres = json.decode(res.body);
    print(pres);


   

    if (res.statusCode==200) {
  

//      Scaffold.of(b).showSnackBar(
//     SnackBar(content: Text(pres['data']["msg"]),));
// Navigator.pop(context);
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

