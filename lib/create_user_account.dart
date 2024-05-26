import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_delivery/repos/login_repository.dart';
import 'package:package_delivery/repos/profile_repository.dart';
import 'package:package_delivery/utils/shared_preferences.dart';
import 'package:package_delivery/welcome_screen.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

class CreateUserAccountScreen extends StatefulWidget {
  const CreateUserAccountScreen({super.key});

  @override
  _CreateUserAccountScreenState createState() =>
      _CreateUserAccountScreenState();
}

class _CreateUserAccountScreenState extends State<CreateUserAccountScreen> {
  XFile? _imageFile;
  dynamic _pickImageError;
  Position? _position;
  final ImagePicker _picker = ImagePicker();
  File? file;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String? _retrieveDataError;

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Widget _previewImage(ProfileRepository profileRepo, BuildContext context) {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      if (kIsWeb) {
        // Why network?
        // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform

        return SizedBox(
          height: 50,
          width: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              _imageFile!.path,
              height: 130,
              width: 130,
            ),
          ),
        );
      } else {
        return Semantics(
            label: 'pick image',
            child: Image.file(
              File(_imageFile!.path),
              width: 130,
            ));
      }
    } else if (_pickImageError != null) {
      if (kDebugMode) {
        print("error occured during image pick");
      }

      return InkWell(
        onTap: () {
          _onImageButtonPressed(ImageSource.gallery, context, profileRepo);
        },
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.account_circle,
              size: 70,
              color: Theme.of(context).colorScheme.secondary,
            )),
      );
    } else {
      return InkWell(
        onTap: () {
          _onImageButtonPressed(ImageSource.gallery, context, profileRepo);
        },
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.account_circle,
              size: 130,
              color: Theme.of(context).colorScheme.secondary,
            )),
      );
    }
  }

  Future<void> retrieveLostData() async {
    final response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _imageFile = response.file;
      });
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  void _onImageButtonPressed(ImageSource source, BuildContext context,
      ProfileRepository profileRepo) async {
    profileRepo.loading = true;

    try {
      final pickedFile = await _picker.pickImage(
        source: source,
      );

      var dir = await path_provider.getTemporaryDirectory();
      var targetPath = "${dir.absolute.path}/temp.jpg";
      setState(() {
        _imageFile = pickedFile;
      });

      await profileRepo.uploadImage(_imageFile!.path, targetPath);
    } catch (e) {
      // profileRepo.loading = false;

      setState(() {
        _pickImageError = e;
      });
    }
  }
  void  _getCurrentPosition() async {
    var profileRepo = context.read<ProfileRepository>();
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    _position =  await Geolocator.getCurrentPosition();
    setState(() {
      profileRepo.longitude = _position!.longitude;
      profileRepo.latitude = _position!.latitude;

    });


    print("latitude is ${_position!.latitude}");
    print("longitude is ${_position!.longitude}");


  }
  @override
  void initState() {
    // TODO: implement initState
    _getCurrentPosition();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var profileRepo = context.watch<ProfileRepository>();
    var sharedPrefs = context.watch<SharedPrefsUtils>();
    return Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 80),
          child: SafeArea(
              child: Container(
                  child: const Text(
            'Edit Profile',
            style: TextStyle(color: Colors.white),
          ))),
        ),
        body: FutureProvider<String?>(
            create: (BuildContext context) {
              return sharedPrefs.getUserEmail();
            },
            initialData: null,
            child: Consumer<String?>(builder: (_, String? email, child) {
              return email != null
                  ? SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            profileRepo.loading
                                ? Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    alignment: Alignment.center,
                                    child: const CircularProgressIndicator())
                                : InkWell(
                                    onTap: () {
                                      _onImageButtonPressed(ImageSource.gallery,
                                          context, profileRepo);
                                    },
                                    child: profileRepo.profilePicUrl.isEmpty
                                        ? Column(
                                            children: [
                                              _previewImage(
                                                  profileRepo, context),
                                              const Text(
                                                "profile picture",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            ],
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: ClipOval(
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      child: CachedNetworkImage(
                                                          width: 70.0,
                                                          height: 70.0,
                                                          fit: BoxFit.cover,
                                                          imageUrl:
                                                              profileRepo
                                                                      .profilePicUrl ??
                                                                  "",
                                                          placeholder: (context,
                                                                  url) =>
                                                              const CircularProgressIndicator(),
                                                          errorWidget: (context,
                                                                  url, ex) =>
                                                              CircleAvatar(
                                                                backgroundColor: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .secondary,
                                                                radius: 40.0,
                                                                child:
                                                                    const Icon(
                                                                  Icons
                                                                      .account_circle,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 40.0,
                                                                ),
                                                              )))),
                                            ))

                                    // child: _prev,

                                    ),
                            Form(
                              key: formKey,
                              autovalidateMode: AutovalidateMode.always,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: TextFormField(
                                      controller:
                                          profileRepo.phoneNumberController,
                                      keyboardType: TextInputType.phone,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                        filled: false,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 1),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        labelText: 'phone number',
                                        labelStyle: const TextStyle(
                                            color: Colors.white),
                                        hintText: "phone number",
                                        hintStyle: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'phone number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: TextFormField(
                                      controller:
                                      profileRepo.usernameController,
                                      style:
                                      const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        filled: false,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 1),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        labelText: 'username',
                                        labelStyle: const TextStyle(
                                            color: Colors.white),
                                        hintText: "username",
                                        hintStyle: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'username';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: TextFormField(
                                      controller:
                                          profileRepo.firstNameController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        filled: false,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 1),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        labelText: 'First Name',
                                        labelStyle: const TextStyle(
                                            color: Colors.white),
                                        hintText: "First Name",
                                        hintStyle: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'First Name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: TextFormField(
                                      controller:
                                          profileRepo.lastNameController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        filled: false,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 1),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        labelText: 'Last Name',
                                        labelStyle: const TextStyle(
                                            color: Colors.white),
                                        hintText: "Last Name",
                                        hintStyle: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Last Name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: TextFormField(
                                      controller:
                                          profileRepo.streetController,

                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        filled: false,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 1),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        labelText: "Street",
                                        labelStyle: const TextStyle(
                                            color: Colors.white),
                                        hintText: "What street are you on ?",
                                        hintStyle: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "What street are you on ?";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: TextFormField(
                                      controller:
                                      profileRepo.cityController,

                                      style:
                                      const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        filled: false,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 1),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        labelText: "City",
                                        labelStyle: const TextStyle(
                                            color: Colors.white),
                                        hintText: "What city are you in ?",
                                        hintStyle: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "What city are you in ?";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: TextFormField(
                                      controller:
                                      profileRepo.countryController,

                                      style:
                                      const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        filled: false,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 1),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: (Colors.grey[700])!,
                                              width: 1),
                                        ),
                                        labelText: "Country",
                                        labelStyle: const TextStyle(
                                            color: Colors.white),
                                        hintText: "What Country are you in ?",
                                        hintStyle: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "What Country are you in ?";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: Column(
                                children: <Widget>[
                                  profileRepo.loading
                                      ? Container(
                                          padding:
                                              const EdgeInsets.only(top: 30.0),
                                          child:
                                              const CircularProgressIndicator(),
                                        )
                                      : Container(
                                          padding:
                                              const EdgeInsets.only(top: 50),
                                          child: SizedBox(
                                            width: size.width / 1.1,
                                            height: 50,
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .secondary),
                                                    shape: MaterialStateProperty
                                                        .all(RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)))),
                                                onPressed: () {

                                                  final FormState form =
                                                      formKey.currentState!;
                                                  if (!form.validate()) {
                                                  } else {
                                                    form.save();

                                                    if (kDebugMode) {
                                                      print(profileRepo
                                                          .profilePicUrl);
                                                    }


    profileRepo
        .saveUserProfileDetails(email,"CUSTOMER")
        .then((_) {

         context.pushReplacement("/createPackage");
    });


                                                  }
                                                },
                                                child: const Text(
                                                  'Continue',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                )),
                                          ),
                                        )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : MultiProvider(providers: [
                ChangeNotifierProvider(create: (context) => LoginRepository.instance(),
                ),
                ChangeNotifierProvider(create: (context) => ProfileRepository.instance(),
                ),


              ],child: WelcomeScreen(),);
            })));
  }
}
