import 'dart:async';
import 'dart:math' as math;
import 'package:image/image.dart' as img;

// import 'package:image/image.dart' as img;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as intl;

import 'package:sunmi_thermal_printer/sunmi_thermal_printer.dart';
import 'package:sunmi_thermal_printer_example/signin.dart';

Color sc=Color(0xFF003B4B);
Color mc=Color(0xFFB9512A);

var token;

var role;
var is_Active;

var statobj={

  "watting":'انتظار',

"driver":'مع سائق',
 'collector':'مع جامع الطلبات',
 'collected':'تم جمع الطلب',
'set_shippng_pirce':'تحديد سعر التوصيل',
"store":"تم تسلم الطلب الى المكتب من قبل الجامع",
"delivered":"تم تسلمه اللى الزبون",
"finished":"انتهى" ,
"canceled":"تم الالغاء الطلب",
 "rejected": "تم رفض الطلب من الزبون",
 "rejected_store":"راجع في المخزن",
   'to_secend_store':"في الطريق الى المكتب الثاني",
 'in_secend_store':"في المخزن الثاني",
 'rejected_store_in_secend_store':"راجع في المخزن الثاني",
'return_from_secend_store':  "راجع في الطريق الى مكتب الرئيسي",
"secend_driver":  "مع سائق الثاني",
 "rejected_client": "الراجع"
};
String host=
"https://alraai.altathamun.com"
;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

var pr;
  SunmiThermalPrinter _printer;

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';


  @override
  void initState() {
    super.initState();
    initPlatformState();
    pr=mprint;
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await SunmiThermalPrinter.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "الراية للتوصيل السريع",
home: Directionality(
  textDirection: TextDirection.rtl,
  child: SignIn()),

    );
       
    //  Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Plugin example app'),
      //   ),
      //   body: Center(
      //     child: Column(
      //       children: [
      //         Text('Running on: $_platformVersion\n'),
      //         IconButton(
      //           icon: Icon(Icons.print),
      //           onPressed: () {
      //             () async {
      //               await _loadTestData();
      //               _printer.exec();
      //             }();
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
   // );
  }

}


mprint(var prn) async{
      print(prn);

 await _loadTestData(prn);
                    _printer.exec();
}
  String formatCurrency(num val, [int pad = 10]) =>
      currencyFormat.format(val).padLeft(pad);

  intl.NumberFormat currencyFormat = intl.NumberFormat.currency(name: 'MYR', symbol: '');

  Future<void> _loadTestData(prn) async {
    print(prn);
    var header = 'شركة الرايه للبريد  السريع';
    var id = '${prn['id']}';
    var timestamp = '30-02-2020 23:59:59';
    var cashier =  '${prn['name']}';
    var itemsHeaderLeft = 'Item';
    var itemsHeaderRight = 'Amount (RM)';
    var items = [
      TestItem(name: 'Your Soul', price: 6.66, quantity: 1),
      TestItem(
          name: 'Someone Else\'s Soul',
          price: 1,
          quantity: 666,
          discount: '10%'),
      TestItem(
          name: 'Something Else Entirely',
          price: 9000.01,
          quantity: 1,
          discount: '0.01'),
    ];
    num subtotal = 0;
    for (var item in items) {
      subtotal += item.afterDiscountValue;
    }
    var cent = (subtotal * 100) % 10;
    var roundingCent = cent < 3 ? -cent : (cent < 8 ? 5 - cent : 10 - cent);
    var total = subtotal + roundingCent / 100;
    var cash = 10000;
    var change = cash - total;
    var footer = 'Please come again';
ByteData imageBytes = await rootBundle.load('assets/logo.png');
List<int> values = imageBytes.buffer.asUint8List();
// img.Image photo;
// photo = img.decodeImage(values);
// int pixel = photo.getPixel(5, 0);
    _printer = SunmiThermalPrinter()
      // ..bitmap(img.Image.fromBytes(
      //         36,
      //         36,
      //         (await rootBundle.load('assets/trilobyte.png'))
      //             .buffer
      //             .asUint8List())
      //     .getBytes())
      ..bold()
      ..fontScale(2)
      
      // ..bitmap(img.Image.fromBytes(
        //       36,
        //       36,
        //       (await rootBundle.load('assets/logo.png'))
        //           .buffer
        //           .asUint8List())
        //   .getBytes())
      ..printCenter("شركة الراية")
      ..printCenter("للتوصيل السريع")
      ..bold()
       ..fontScale(1)
      ..printLR(' رقم الطلب #:', id)
      ..printLR('التاريخ', "${prn['createdAt']}")
      ..printLR('اسم الزبون', cashier)
      ..printLR('رقم الهاتف', '${prn['phone']}')
       ..printLR('الرقم الاحتياطي', '${prn['phone2']}')
        ..printLR('المحافظة', '${prn['government']}')
           ..printLR('المدينة', '${prn['city']}')
..printLR('العنوان', '${prn['address']}')
..printLR('السعر مع التوصيل', '${prn['price']}')
..divider()
..printCenter("ملاحظات")
..printRight('${prn['notes']}')
..divider()
..printLR('اسم العميل', '${prn['client']['name']}')
..printLR('رقم الهاتف', '${prn['client']['phone']}')
      // ..divider()
      // ..printLR(itemsHeaderLeft, itemsHeaderRight)
      ..divider()..qr( '${prn['id']}',moduleSize: 10)
       ..divider()
       ..printCenter("شركة الراية للتوصيل السريع")
       ..printRight("العنوان: بغداد-المنصور-الداوودي")
       ..printRight("رقم الهاتف:  07806447000")
       ;
    // for (var item in items) {
    //   String amountStr = formatCurrency(item.afterDiscountValue);
    //   _printer
    //     ..printLR(
    //         item.name.substring(
    //             0, math.min(item.name.length, _printer.cpl - amountStr.length)),
    //         amountStr)
    //     ..println(
    //         '  ${currencyFormat.format(item.price)} × ${item.quantity.toString()}');
    //   if (item.discount != null) {
    //     _printer
    //       ..println(
    //           '  Discount ${item.discount.endsWith('%') ? item.discount : currencyFormat.format(num.parse(item.discount))}');
    //   }
    // }
    // _printer
    //   ..divider()
    //   ..printLR('Subtotal', formatCurrency(subtotal))
    //   ..printLR('Rounding', formatCurrency(roundingCent / 100))
    //   ..fontSize(height: 2)
    //   ..printLR('Total', formatCurrency(total))
    //   ..fontScale()
    //   ..divider()
    //   ..printLR('CASH', formatCurrency(cash))
    //   ..printLR('Change', formatCurrency(change))
    //   ..newLine()
    //   ..qr('3b.my', moduleSize: 8)
    //   ..newLine()
    //   ..barcode( '${prn['id']}',
    //       symbology: BarcodeSymbology.,
    //       height: 32,
    //       textPosition: BarcodeText.Bottom)
    //   ..newLine()
    //   ..printCenter(footer);
  }

class TestItem {
  final String name;
  final num price;
  final num quantity;
  final String discount;

  TestItem({this.name, this.price, this.quantity, this.discount});

  num get afterDiscountValue {
    var amount = price * quantity;
    if (discount != null) {
      if (discount.endsWith('%')) {
        amount -=
            (num.tryParse(discount.replaceFirst('%', '')) ?? 0) / 100 * amount;
      } else {
        amount -= num.tryParse(discount) ?? 0;
      }
    }
    return amount;
  }
}
