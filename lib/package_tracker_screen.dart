import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:package_delivery/repos/location_repository.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'constants.dart';
class PackageTrackerScreen extends StatefulWidget {
  const PackageTrackerScreen({Key? key}) : super(key: key);

  @override
  State<PackageTrackerScreen> createState() => _PackageTrackerScreenState();
}

class _PackageTrackerScreenState extends State<PackageTrackerScreen> {

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  Set<Polyline> _polyline = {};
  List<LatLng> polylineCoordinates = [];


  StreamSubscription<Position>? _positionStreamSubscription;

  bool positionStreamStarted = false;

  Position? _position;

  List<Position?> _positionList = [];
  PolylinePoints polylinePoints = PolylinePoints();

  static const LatLng _destination =  LatLng(4.0938311, 9.7508429);


  late final Stream<GraphQLResponse<String>> getLocationUpdatesStream;


  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
 void  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    _position =  await Geolocator.getCurrentPosition();
    setState(() {

    });


    print("latitude is ${_position!.latitude}");
    print("longitude is ${_position!.longitude}");
    getPolyPoints();

  }

  void setCustomMarkerIcon(){
  BitmapDescriptor.fromAssetImage(createLocalImageConfiguration(context, size: Size(20,20)), 'assets/images/source.png').then((icon){

     sourceIcon = icon;

  });
  BitmapDescriptor.fromAssetImage(createLocalImageConfiguration(context, size: Size(20, 20)), 'assets/images/destination.png').then((icon){

     destinationIcon = icon;

  });
  }
  void streamPosition(LocationRepository locationRepository) async {

    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 5,
    );

    GoogleMapController _googleMapController = await _controller.future;
    StreamSubscription<Position> positionStream =
    Geolocator.getPositionStream(locationSettings: locationSettings).listen(
            (Position? position) {
               print("new position is ${position!.latitude} , ${position.longitude}");
              _positionList.add(position);
              _position = position;
               getPolyPoints();
              _googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                  zoom: 15.5,
                  target: LatLng(
                position.latitude,position.longitude
              ))));
              setState(() {

              });

             if(position != null){
               double longitude = position.longitude;
               double latitude = position.latitude;

              // locationRepository.createPackage(longitude, latitude);
             }

          print(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');
        });


    }


  Future<void> subscribeToLocationUpdates() async {


    const graphQLDocument = '''
      subscription updatePackageTimelapse {
  updatePackageTimelapse {
    id
    latitude
    longitude
    timestamp
  }
}

    ''';

    getLocationUpdatesStream = Amplify.API.subscribe(
      GraphQLRequest<String>(
        document: graphQLDocument,
        apiName: "package-delivery-tidy-lizard",
      ),
      onEstablished: () => print('Subscription established'),
    );

    try {
      await for (var event in getLocationUpdatesStream) {

        if (kDebugMode) {
          //  print("all list messages are $chatMessagesList");
          print('Subscription event data received: ${event.data}');
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error in subscription stream: $e');
      }
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose


    super.dispose();
  }

  void getPolyPoints() async{


    PolylineResult result =
    await polylinePoints.getRouteBetweenCoordinates(
      GOOGLE_API_KEY,
      PointLatLng(_position!.latitude,_position!.longitude),
      PointLatLng(_destination.latitude,_destination.longitude),

    );
    polylineCoordinates.clear();
    if(result.points.isNotEmpty){
      result.points.forEach((PointLatLng pointLatLng) {

          polylineCoordinates.add(
              LatLng(pointLatLng.latitude, pointLatLng.longitude)
          );


      });

setState(() {

});

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _determinePosition();
   // getPolyPoints();
    var locationRepo =  context.read<LocationRepository>();
    streamPosition(locationRepo);

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    var locationRepo =  context.watch<LocationRepository>();
    setCustomMarkerIcon();
    return Scaffold(
      backgroundColor: Colors.black,
      body:_position == null ? Text("loading..."):
      GoogleMap(
         mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(_position!.latitude,_position!.longitude),
            zoom: 15.5
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },

        markers: {
          Marker(markerId: MarkerId("current"),
            icon: sourceIcon,
            position: LatLng(_position!.latitude,_position!.longitude),),

          Marker(markerId: MarkerId("destination"),
              icon: destinationIcon,
              position: _destination)

        },
        polylines: {
          Polyline(polylineId: PolylineId("route"),
            points: polylineCoordinates,
            color: Colors.purpleAccent,
            width: 3,)
        },
      ),
          /*
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child:  Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(


                          decoration: BoxDecoration(
                              color: Color(0xFF222222),
                              borderRadius: BorderRadius.circular(30)

                          ),
                          padding: EdgeInsets.only(top: 7,right: 10),
                          margin: EdgeInsets.only(right: 10),


                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(

                                children: [
                                  ClipRRect(
                                      borderRadius:BorderRadius.circular(1000),
                                      child: Image.asset('assets/images/rosius.jpg',fit: BoxFit.cover,height: 70,width: 70,)),
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Hi, Rosius",style: TextStyle(color: Colors.white,fontSize: 14),),
                                        Text("Update Profile",style: TextStyle(color: Colors.grey,fontSize: 13),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10,bottom: 5),


                                child: Row(

                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(15.0),


                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              const Color(0xFFfccb90),
                                              const Color(0xFFd57eeb)


                                            ],
                                          ),


                                          shape: BoxShape.circle

                                      ),

                                      child:  SvgPicture.asset('assets/svgs/precise_location.svg',height: 70,width:70,color: Colors.white,),),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Your Location",style: TextStyle(color: Colors.white,fontSize: 15),),
                                          Text("Douala,Cameroon",style: TextStyle(color: Colors.grey,fontSize: 14),)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),


                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Color(0xFF222222),
                                  borderRadius: BorderRadius.circular(30)

                              ),


                              child:   Row(

                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(15.0),


                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF333333)
                                    ),

                                    child:  SvgPicture.asset('assets/svgs/distance.svg',height: 70,width: 70,color: Colors.white,),),
                                  Container(
                                    padding: EdgeInsets.only(left: 10,),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("New Tracking",style: TextStyle(color: Colors.white,fontSize: 12),),
                                        Text("Tracking by ID",style: TextStyle(color: Colors.grey,fontSize: 12),)
                                      ],
                                    ),
                                  )
                                ],
                              ),



                            ),
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              margin: EdgeInsets.only(top: 10,),
                              decoration: BoxDecoration(
                                  color: Color(0xFF222222),
                                  borderRadius: BorderRadius.circular(30)

                              ),


                              child:   Row(

                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(15.0),


                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF333333)
                                    ),

                                    child:  SvgPicture.asset('assets/svgs/truck.svg',height: 70,width: 70,color: Colors.white,),),
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Order with us",style: TextStyle(color: Colors.white,),),
                                        Text("Cargo, DS",style: TextStyle(color: Colors.grey),)
                                      ],
                                    ),
                                  )
                                ],
                              ),



                            ),
                          ],
                        )
                      ],
                    ),
                    Container(

                      decoration: BoxDecoration(
                          color: Color(0xFF222222),
                          borderRadius: BorderRadius.circular(30)

                      ),
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),


                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Current Delivery",style: TextStyle(fontSize: 25,
                                  color: Colors.white,
                                  fontWeight:FontWeight.bold),),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Color(0xFFd57eeb))
                                  ),
                                  onPressed: (){}, child: const Text("Transit",style: TextStyle(color: Colors.white),))
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child:
              )
            ],
          )
          */


    );
  }
}

