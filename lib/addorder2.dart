import 'package:sunmi_thermal_printer_example/succes.dart';

import 'main.dart';
import 'package:flutter/material.dart';
//AIzaSyAbZOvdb_fUdBlC_ER2JpzhtQSwXN-NwGg
class AddOrder2 extends StatefulWidget {
  @override
  _AddOrder2State createState() => _AddOrder2State();
}

class _AddOrder2State extends State<AddOrder2> {

    TextEditingController name=new TextEditingController();
    TextEditingController phone =new TextEditingController();
    TextEditingController phone2 =new TextEditingController();
    TextEditingController state =new TextEditingController();
    TextEditingController city =new TextEditingController();
    TextEditingController address =new TextEditingController();
    TextEditingController price =new TextEditingController();
    TextEditingController notes =new TextEditingController();

   final formKey = GlobalKey<FormState>();
  FocusNode namef = FocusNode();
  FocusNode passf = FocusNode();
 BuildContext b;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Container(
        height: double.infinity,
        color: mc,
        child: SingleChildScrollView(
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
                     child: InkWell(child: Icon(Icons.arrow_back_ios_rounded,
                              color: Colors.white,), onTap: (){

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
                     SizedBox(height: 10,),
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
                            hintText: "اسم الزبون",
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
                               focusNode: passf,
                                      validator: (value) {
                                      if (value.isEmpty) {
                                        return 'الرجاء قم بأدخال  كلمة المرور';
                                      }
                                      return null;
                                    },
                              
                              controller: phone,
                            decoration: InputDecoration(
                              hintText: "رقم الهاتف",
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
                              Padding(
                            padding: const EdgeInsets.only(
                              bottom: 15
                            ),
                            child:  TextFormField(
                style: TextStyle(color: Colors.white),

                              // focusNode: passf,
                                      validator: (value) {
                                      if (value.isEmpty) {
                                        return 'الرجاء قم بأدخال  كلمة المرور';
                                      }
                                      return null;
                                    },
                              
                              controller: phone2,
                            decoration: InputDecoration(
                              
                              hintText: "رقم الهاتف 2",
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
                            color: sc,
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
                              Success(),);}));
                              
// signIn();
                          },child: Text("تم",
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
}