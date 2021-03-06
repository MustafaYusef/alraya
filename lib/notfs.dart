import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sunmi_thermal_printer_example/orderDetails.dart';
import 'dart:convert';

import 'main.dart';

class Notfs extends StatefulWidget {
  final notf;

  const Notfs({Key key, this.notf}) : super(key: key);
  @override
  _NotfsState createState() => _NotfsState();
}

class _NotfsState extends State<Notfs> {

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Container(color: mc,),
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
                   Center(child:  Image.asset(
                            "assets/logo.png",
                            height: 63,
                            
                              ),),
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
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView(
           //   controller: scr,
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
             ...widget.notf.map((e){
               print(e);
               return orderModel(e);
             }).toList()

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
    color: sc,
    borderRadius: BorderRadius.circular(15)
  ),
  child:
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Padding(
    padding: const EdgeInsets.all(14.0),
    child: Text("${ord['title']}",
    style: TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold),
    ),
  ),
  // Divider(color: Colors.white,),
    Padding(
    padding: const EdgeInsets.all(14.0),
    child: Text("${ord['bode']}",
    style: TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold),
    ),
  ),
  // Divider(color: Colors.white,),
  //   Padding(
  //   padding: const EdgeInsets.all(14.0),
  //   child: Text("${ord['city']}",
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
                                color: mc,
  
                                onPressed: (){
// Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
// OrderDetails(order: ord,),);}));
deletnot(ord['id']);
// print(ord['id']);
 
  // signIn();

                              },child:selectednotf==ord['id']?CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                  Colors.white
                                ),
                              )
                              : Text("مسح",
  
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

var selectednotf=-1;

   var orders=[];
bool loading=true;
int page=1;
var maxCount=-1;
bool lastPage=false;
var timeout=false;
   void getOrders(bool first)async{
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
      "$host/orders/client/orders/my?limit=11&page=$page";
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



   deletnot(or) async {
 
     if(loading)
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
    selectednotf=or;
  });
 
  var res = await http.delete(
          //  "$host/users/auth/new"
            "$host/users/notification/$or"
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


   List x;
   

    if (res.statusCode==200) {
  

    //  Scaffold.of(b).showSnackBar(
    // SnackBar(content: Text(pres['data']["msg"]),));

    } else {
     
   //   EDailog.errorDialog(pres["message"], false, context);
    //  Scaffold.of(b).showSnackBar(
    // SnackBar(content: Text(pres["message"]),));
    }
    setState(() {
      loading = false;
      selectednotf=-1;
      
  widget.notf.removeWhere((element) => element['id']==or);

    });

  }



}

