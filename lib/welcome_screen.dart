import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:package_delivery/repos/login_repository.dart';
import 'package:package_delivery/repos/profile_repository.dart';
import 'package:provider/provider.dart';

import 'models/User.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Position? _position;
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



    print("latitude is ${_position!.latitude}");
    print("longitude is ${_position!.longitude}");


  }

  @override
  void initState() {
    _determinePosition();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoginRepository loginRepo = context.watch<LoginRepository>();
    ProfileRepository profileRepo = context.watch<ProfileRepository>();
    return Scaffold(

      body: Stack(

        children: [
          // Create the largest circle as the base
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Theme.of(context).colorScheme.secondary,width: 1),
              //color: Colors.grey[800], // Adjust grey tone for the base
            ),
          ),
          Positioned(
            top: 245,
            left: 280,
            child: Container(

              padding:const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.secondary),


              child: SvgPicture.asset(
                'assets/svgs/precise_location.svg',

                height: 25,
                width: 25,
                fit: BoxFit.cover,
                color: Colors.black,

              ),
            ),),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  width: size.width/1.3,
                  height:size.height/1.3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).primaryColor,width: 2),
                    //color: Colors.grey[800], // Adjust grey tone for the base
                  ),
                ),
                Positioned(
                  top: 200,
                  right: 230,
                  child: Container(

                    padding:const EdgeInsets.all(10),
                    decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor),


                    child: SvgPicture.asset(
                      'assets/svgs/distance.svg',

                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                      color: Colors.white,

                    ),
                  ),),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  width: size.width/2.8,
                  height:size.height/2.8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).colorScheme.secondary,width: 2),
                    //color: Colors.grey[800], // Adjust grey tone for the base
                  ),
                ),
                /*
              Positioned(
                top: 75,
                child: ClipOval(
                  child: Image.network(
                    // Replace with a placeholder image URL or fetch random images
                    'https://plus.unsplash.com/premium_photo-1682090260563-191f8160ca48?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                  ),
                ),),
*/
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  width: size.width/1.8,
                  height:size.height/1.8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFff7485),width: 2),
                    //color: Colors.grey[800], // Adjust grey tone for the base
                  ),
                ),
                Positioned(
                  top: 315,
                  left: 110,
                  child: Container(

                    padding:const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFff7485)),


                    child: SvgPicture.asset(
                      'assets/svgs/map.svg',

                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                      color: Colors.white,

                    ),
                  ),),
              ],
            ),
          ),


          Align(
            alignment: Alignment.center,
            child:  Container(

              padding:const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.secondary),


              child: SvgPicture.asset(
                'assets/svgs/truck.svg',

                height: 35,
                width: 35,
                fit: BoxFit.cover,
                color: Colors.black,

              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Align(
              alignment: Alignment.bottomCenter,
              child:loginRepo.googleLoading ? CircularProgressIndicator() : SizedBox(
                height: size.height/14,
                width: size.width/1.5,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary)
                  ),
                  onPressed: (){

                    loginRepo.googleSignIn(context).then((User? user) {
                      if(user != null){

                        print("user found, move to homescreen");
                        //find out if user is old or new
                        context.pushReplacement('/createUserAccount');

                      }else{
                        print("user not found, create new user");

                        context.pushReplacement('/createUserAccount');
                      }
                    });



                  },

                  child: const Text("Login with Google",style: TextStyle(fontSize: 15,color: Colors.black,
                      fontFamily: 'SometypeMono'),),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: size.height/12,
                width: size.width/1.2,
                child: TextButton.icon(
                  style: const ButtonStyle(

                  ),
                  onPressed: (){

                  },
                  icon: Icon(Icons.account_circle_rounded,color: Theme.of(context).colorScheme.secondary,),
                  label: const Text("Create an account",style: TextStyle(color: Colors.white,fontFamily: 'SometypeMono'),),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.only(top: 50,left: 10),
              child: Text('dlveries',style: TextStyle(fontFamily: 'SometypeMono',

                  color: Theme.of(context).primaryColor,
                   decoration:  TextDecoration.underline,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,fontSize: 20),),
            ),
          ),

        ],
      ),
    );
  }
}
