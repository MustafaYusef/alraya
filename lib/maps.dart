import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sunmi_thermal_printer_example/home.dart';

import 'main.dart';



class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

BitmapDescriptor icon;
Set<Marker> markers;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    markers=Set.from([]);
getpos();  
}
 getpos(){
    // Geolocator().getPositionStream().listen((event) {
    // print(  event.heading);
    // print(event.speed);
    // });
     Geolocator.getCurrentPosition().then((p){

  _controller.future.then((cont) {
 cont.animateCamera(CameraUpdate.newCameraPosition(
   CameraPosition(
     target: LatLng(
       p.latitude,
       p.longitude
     ),
     zoom: 18
   )
 ));
  });
   });
  }

  createMarker(context){

if(icon==null)
{
  ImageConfiguration configuration=createLocalImageConfiguration(context,size: Size(0.5,0.5));
  BitmapDescriptor.fromAssetImage(configuration, "assets/mark3.png").then((value) {
    setState(() {
          icon=value;

    });
  } 
  );}
  }
  int i=0;
  LatLng choosedPos;
  Marker _marker;
  @override
  Widget build(BuildContext context) {
    createMarker(context);
    return new Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
             markers: markers,
onTap: (pos){
print(pos);
Marker m=Marker(
  onTap: (){
    
  },

  icon: icon,position: pos,markerId:
 MarkerId('$i'));
 i++;
 setState(() {
   if(markers.isNotEmpty)
   markers.remove(markers.first);
   markers.add(m);
  choosedPos=pos;
print("cgh $choosedPos");
   _marker=m;
   print(_marker);
 });
},
          ),
          Positioned(
            left: 0,
            top: 40,
            child:  Stack(
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
                      ),
          ),
          Positioned(
            bottom:20 ,
            left: 15,
            right: 15,
            child: MaterialButton(
                            minWidth: double.infinity,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(30)
                              )
                            ),
                            height: 60,
                            color:_marker!=null? sc:sc.withOpacity(0.3),
                            onPressed: (){
if(_marker!=null)
{
  // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (c){return Directionality(textDirection: TextDirection.rtl,child: 
  // Home(),);}),
  // (r)=>false
  // );
  Navigator.of(context).pop(_marker.position);
}
// signIn();
                          },child: Text("التالي",
                           style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                          ),) ,
          )
        ],
      ),

    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}