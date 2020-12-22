// import 'package:alrayaclient/main.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Chat extends StatefulWidget {
//   @override
//   _ChatState createState() => _ChatState();
// }

// class _ChatState extends State<Chat> {

//       ScrollController sc = ScrollController();

//   TextEditingController msg=TextEditingController();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     sc.addListener(() {
//       if (sc.offset >= sc.position.maxScrollExtent) {
//         print("object");
//         print(items.length);
//         if (!lastPAge) {
//           if (items.length < 1) return;
//           print("new page");
//           page++;
//           getmsgs();
//         }
//       }
//     });
//               getmsgs();

//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       backgroundColor: mc,
//       body: Column(children: [
//         Expanded(
//           child: ListView(
//             reverse: true,
//             controller: sc,
//             children: [
// ...items.map((e) {
//   return Container(
//     margin: EdgeInsets.symmetric(
//       vertical: 20,
//       horizontal: 100
//     ),
//     height: 300,
//     color: Colors.white,
//     child: Text("${e['msg']}"),
//   );
// }).toList()
//             ],
//           ),
          
//         ),
//         Container(
//           color: Colors.white,
//           child: 
//         Row(
//           children: [
//                  IconButton(icon: Icon(Icons.send), onPressed: (){
// sendmsg();
//             }),
//             Expanded(
//                           child: TextField(
// controller: msg,
//               ),
            
//             ),
       
//           ],
//         ),)
//       ],),
//     );
//   }
//   sendmsg() async{
// firestore.collection('msgs').doc(
//    "${user.uid}driverid"
// ).collection("msgs").add({
//   "time":FieldValue.serverTimestamp(),
//   "msg":"${msg.text}",
//   "sender":0
// });
// setState(() {
//   msg.text="";
// });
//   }



// var items=[];
//    var page = 0;
//   var lastPAge = false;
//   var lastDoc;
//   var loading = false;

//     getmsgs() async{
//       if(firestore==null)
//       {
//         print("null");
//       return;

//       }
//       if(loading)
//       return;
//       setState(() {
//         loading=true;
//       });
//    print("object");
//           int lim=4;
//   var qr = firestore.collection('msgs').doc(
//    "${user.uid}driverid"
// ).collection("msgs")
// .orderBy('time',descending: true);
//   //  var qr;

//    if (lastDoc == null) {
//       qr.limit(lim).get().then((v) {
//         print(v.docs);
//         for (var it in v.docs) {
//           items.add({...it.data(), "id": it.id});
//         }
//         if (v.docs.length > 0) {
//           lastDoc = v.docs[v.docs.length - 1];
//         } else
//           lastPAge = true;
//         setState(() {
//           loading = false;
//         });
//       });
//     } else {
//       qr.startAfterDocument(lastDoc).limit(lim).get().then((v) {
//         for (var it in v.docs) {
//            items.add({...it.data(), "id": it.id});

//         }
//         if (v.docs.length > 0)
//           lastDoc = v.docs[v.docs.length - 1];
//         else
//           lastPAge = true;
//         setState(() {
//           loading = false;
//         });
//       });
//     }

// // firestore.collection('msgs').doc(
// //    "${user.uid}driverid"
// // ).collection("msgs")
// // .orderBy('time',descending: true)
// // .limit(5).get()
// // ;

//   }
// }