import 'package:flutter/material.dart';
import 'package:sunmi_thermal_printer_example/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class NoNet extends StatefulWidget {
  @override
  _NoNetState createState() => _NoNetState();
}

class _NoNetState extends State<NoNet> {
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sc,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
children: [
  Image.asset('assets/net.png'),
  Text("لا يوجد انترنت",
  style: TextStyle(color: Colors.white,
  fontSize: 32,
  fontWeight: FontWeight.bold
  ),),
   Center(
     child: MaterialButton(
                          minWidth: 200,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(30)
                            )
                          ),
                          height: 60,
                          color: mc,
                          onPressed: (){
                            // Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
                            // Home(),);}));
                      
                          Navigator.pop(context)  ;
// signIn();
                        },child:
                         Text("اعادة المحاولة",
  style: TextStyle(color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.bold
  ),),
                       )
                        //  Text("تسجيل الدخول",
                        //  style: TextStyle(
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 18
                        //   ),
                        // ),
                        ),
   
],
      ),
    );
  }

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
  // prof=pres['data']['profile'];
  // print(prof['is_Active']);
  //    count=prof['notification'].length;

  // is_Active=prof['is_Active'];
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