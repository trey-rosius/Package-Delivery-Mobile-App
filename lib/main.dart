// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:package_delivery/repos/login_respository.dart';
import 'package:package_delivery/repos/profile_repository.dart';
import 'package:package_delivery/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';



import 'package:flutter/foundation.dart';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'amplifyconfiguration.dart';
import 'home_screen.dart';

final AmplifyLogger _logger = AmplifyLogger('package_delivery');
void main() {
  AmplifyLogger().logLevel = LogLevel.verbose;
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
    initializeMapRenderer();
  }
  runApp(  MaterialApp(
    debugShowCheckedModeBanner: false,
      home:MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool loadedAmplify = false;


  Future<void> _configureAmplify() async {

    try{


      await Amplify.addPlugins([


        AmplifyAPI(),

      ]);


      await Amplify.configure(amplifyconfig);
      _logger.debug('Successfully configured Amplify');

      Amplify.Hub.listen(HubChannel.Auth, (event) {
        _logger.info('Auth Event: $event');
      });
    } on Exception catch (e, st) {
      _logger.error('Configuring Amplify failed', e, st);
    }
/*

      // Once Plugins are added, configure Amplify
      await Amplify.configure(amplifyconfig);

      if(Amplify.isConfigured){
        print('amplify configure');
        setState(() {
          loadedAmplify = true;
        });
      }else{
        setState(() {
          loadedAmplify = false;
        });
      }



    } catch(e) {
      setState(() {
        loadedAmplify = false;
      });
      if (kDebugMode) {
        print('an error occured during amplify configuration: $e');
      }



    }

      */



  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _configureAmplify();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Package Delivery',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(



        primaryColor: Color(0xFF8000ff),
        colorScheme:ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFffed48)),


        useMaterial3: true,
        fontFamily: 'Montserrat',
      ),
        routerConfig: _router
        /*
      home: loadedAmplify ?
        // HomeScreen() : const Center(child: CircularProgressIndicator(),),
         WelcomeScreen() : const Center(child: CircularProgressIndicator(),),
*/
    );

  }
  final _router = GoRouter(
      routes:[
        GoRoute(
          path: '/',

          builder: (BuildContext _, GoRouterState __) =>
              MultiProvider(
                  providers: [

                    ChangeNotifierProvider(create: (BuildContext context) => LoginRepository.instance(),),
                    ChangeNotifierProvider(create: (BuildContext context) => ProfileRepository.instance(),),



                  ],
                  child:
                 WelcomeScreen() ),
        ),
      ],

  );

}


Completer<AndroidMapRenderer?>? _initializedRendererCompleter;

/// Initializes map renderer to the `latest` renderer type for Android platform.
///
/// The renderer must be requested before creating GoogleMap instances,
/// as the renderer can be initialized only once per application context.
Future<AndroidMapRenderer?> initializeMapRenderer() async {
  if (_initializedRendererCompleter != null) {
    return _initializedRendererCompleter!.future;
  }

  final Completer<AndroidMapRenderer?> completer =
  Completer<AndroidMapRenderer?>();
  _initializedRendererCompleter = completer;

  WidgetsFlutterBinding.ensureInitialized();

  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    unawaited(mapsImplementation
        .initializeWithRenderer(AndroidMapRenderer.latest)
        .then((AndroidMapRenderer initializedRenderer) =>
        completer.complete(initializedRenderer)));
  } else {
    completer.complete(null);
  }

  return completer.future;
}