import 'dart:convert';

import 'package:sunmi_thermal_printer_example/Signup.dart';
import 'package:sunmi_thermal_printer_example/driverHome.dart';
import 'package:sunmi_thermal_printer_example/home.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController name=new TextEditingController();
    TextEditingController pass =new TextEditingController();

   final formKey = GlobalKey<FormState>();
  FocusNode namef = FocusNode();
  FocusNode passf = FocusNode();
 BuildContext b;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
 getLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
          body:  Builder(

        builder: (context) {
          b=context;
              return Stack(
                fit: StackFit.expand,
        children: [

              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/Background.png",
                        
                      )
                    )
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric( 
                    horizontal: 15
                  ),
                  child: Form(
                    key: formKey,
                                  child: Column(
                      children: [
                        SizedBox(height: 50,),
                        Text("تسجيل الدخول",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                        ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
keyboardType: TextInputType.phone,
                           focusNode: namef,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'الرجاء قم بأدخال رقم الهاتف ';
                                        }
                                        return null;
                                      },
                                      
                        controller: name,
                      decoration: InputDecoration(
                        errorStyle:TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                        hintText: "رقم الهاتف",
                    focusColor: Colors.white,
                    hintStyle: TextStyle(
                      color: Colors.white
                    ),
                    focusedErrorBorder:  OutlineInputBorder(
                      
                          borderSide: BorderSide(color: mc
                          ,width: 4),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30)
                          )
                        ),
                    errorBorder: OutlineInputBorder(
                      
                          borderSide: BorderSide(color: mc
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
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15
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
                          
                          controller: pass,
                        obscureText: true,
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
                      
                          borderSide: BorderSide(color: mc
                          ,width: 4),
                          // borderRadius: BorderRadius.vertical(
                          //   top: Radius.circular(30)
                          // )
                        ),
                    errorBorder: OutlineInputBorder(
                      
                          borderSide: BorderSide(color: mc
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
                        color: mc,
                        onPressed: (){
                          // Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
                          // Home(),);}));
                          
signIn();
                      },child:loading?
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )
                      : Text("تسجيل الدخول",
                       style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onTap: (){
                            // Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
                            // ,);}));
                            
                          },
                                            child: InkWell(
                                              onTap: (){
                                                Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
                                                SignUp(),);}));
                                                
                                              },
                                                                                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text("ليس لديك حساب؟",
                             style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            // fontSize: 18
                            ),),
                            Text(" سجل الان ",
                             style: TextStyle(
                              color: mc,
                              fontWeight: FontWeight.bold,
                            // fontSize: 18
                            ),)
                          ],),
                                            ),
                        ),
                      )
                    ],),
                  ),
                ),
              )
        ],
      );
            }
          ),
    );
  }

   bool loading = false;
  bool gettingUser = true;
  bool timeout = false;
  //  var rule;
  void signIn() async {
FocusScope.of(context).requestFocus(
FocusNode()
);
if(loading)
return;
print("sign");
     if (!formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

  
    return;
    }
//  if(phoneC.text[0]=="0")
//    {
//      phoneC.text=phoneC.text.substring(1,phoneC.text.length);
//      print(phoneC.text);

//    }

  //  if("${code}${phoneC.text}".length!=14)
  //  {
  //       Scaffold.of(b).showSnackBar(
  //   SnackBar(content: Text("الرجاء قم بلتحقق من رقم الهاتف"),));
  //    return;
  //  }
    timeout = false;

    //print(passc.text);
    setState(() {
      loading = true;
    });
    var res = await http.post("$host/users/auth/login",
        body: {
          "phone": "${name.text}",
          "password": pass.text,
         "player_id": "a"
        }).timeout(Duration(seconds: 30), onTimeout: () {
          print("time");
      setState(() {
        loading = false;
        timeout = true;
      });
      return;
    });
    if (timeout) return;
    var pres = json.decode(res.body);
    print(pres);
Widget _home;

    token = pres["data"]['data']["token"];
     role=pres["data"]['data']["role"];
     is_Active=pres["data"]['data']["is_Active"];
    // print(rule);
       switch (role) {
         case 0:
           _home=Home();
           break;
             case 1:
           _home=DriverHome();
           break;  
         default:
       }
    if (token != null) {
      
      print(token);
      await savepref();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c) {
        return Directionality(textDirection: TextDirection.rtl,
         child:_home);
      }));
    } else {
           print(false);

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
    await prefs.setInt('role', role);
        // await prefs.setBool('is_Active', is_Active);

  }

  getLogin() async {
    setState(() {
      gettingUser = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _tok = prefs.getString('token');
    role= prefs.getInt('role');
        // is_Active= prefs.getBool('is_Active');

    // print('Pressed $counter times.');
    if (_tok != null) {
      token = _tok;
      role=role;
      // rule= prefs.getInt('role');
      print(token);
      print(role);
      Widget _home;
            switch (role) {
         case 0:
           _home=Home();
           break;
             case 1:
           _home=DriverHome();
           break;  
         default:
       }
 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c) {
        return Directionality(textDirection: TextDirection.rtl, 
        child:_home);
      }));
      gettingUser = false;
    } else {
    print('no user');
    }}
}