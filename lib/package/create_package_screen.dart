import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_delivery/repos/package_repository.dart';
import 'package:provider/provider.dart';

import '../repos/login_repository.dart';
import '../repos/profile_repository.dart';
import '../utils/shared_preferences.dart';
import '../welcome_screen.dart';
class CreatePackageScreen extends StatefulWidget {
  const CreatePackageScreen({Key? key}) : super(key: key);

  @override
  State<CreatePackageScreen> createState() => _CreatePackageScreenState();
}

class _CreatePackageScreenState extends State<CreatePackageScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var profileRepo = context.watch<ProfileRepository>();
    var sharedPrefs = context.watch<SharedPrefsUtils>();
    return  Scaffold(
      key: _scaffoldKey,
        appBar:  PreferredSize(


          preferredSize: const Size(double.infinity,80),
          child: SafeArea(
              child:
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                  child:
              Text('Create Package',style: TextStyle(color: Theme.of(context).primaryColor),))),
        ),
      body:FutureProvider<String?>(
    create: (BuildContext context) {
    return sharedPrefs.getUserEmail();
    },
    initialData: null,
    child: Consumer<String?>(builder: (_, String? email, child) {
      return email != null ?
      ChangeNotifierProvider.value(value: PackageRepository.instance(),
        child: Consumer(builder: (_,PackageRepository packageRepo,child){
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [

                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              const Text("Package Type :",style: TextStyle(color: Colors.white,fontSize: 15),),
                              DropdownButton<String>(
                                value: packageRepo.packageType,

                                elevation: 16,
                                style:  TextStyle(color: Colors.white,fontSize: 15),

                                onChanged: (String? value) {

                                  packageRepo.packageType= value!;

                                },
                                items: packageRepo.packageTypeList.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,style: TextStyle(fontFamily: 'SometypeMono',fontSize: 15),),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              const Text("Delivery Mode :",style: TextStyle(color: Colors.white,fontSize: 15),),
                              DropdownButton<String>(
                                value: packageRepo.deliveryMode,

                                elevation: 16,
                                style:  TextStyle(color: Colors.white,fontSize: 15),

                                onChanged: (String? value) {

                                  packageRepo.deliveryMode= value!;

                                },
                                items: packageRepo.deliveryModeList.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,style: TextStyle(fontFamily: 'SometypeMono',fontSize: 15),)
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: packageRepo.packageNameController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              filled: false,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: (Colors.grey[700])!, width: 1),

                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: (Colors.grey[700])!, width: 1),

                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2),

                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: (Colors.grey[700])!, width: 1),

                              ),
                              labelText: 'Package Name',
                              labelStyle: const TextStyle(color: Colors.white),
                              hintText: "Package Name",
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Package Name';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: packageRepo.packageDescriptionController,
                            maxLines: 4,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              filled: false,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: (Colors.grey[700])!, width: 1),

                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: (Colors.grey[700])!, width: 1),

                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1),

                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: (Colors.grey[700])!, width: 1),

                              ),
                              labelText: 'Package Description',
                              labelStyle: const TextStyle(color: Colors.white),
                              hintText: "Package Description",
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Package Description';
                              }
                              return null;
                            },
                          ),
                        ),


                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: TextButton.icon(onPressed: (){

                          }, icon: Icon(Icons.location_history, color: Theme.of(context).colorScheme.secondary), label: Text("Pick Location",style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),)),
                        ),

                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: <Widget>[
                        packageRepo.loading
                            ? Container(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: const CircularProgressIndicator(),
                        )
                            : Container(
                          padding: const EdgeInsets.only(top: 50),
                          child: SizedBox(
                            width: size.width / 1.1,
                            height: 50,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(
                                        Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                                10)))),
                                onPressed: () {
                                  context.pushReplacement('/');
                                  final FormState form =
                                  formKey.currentState!;
                                  if (!form.validate()) {
                                  } else {
                                    form.save();




                                              packageRepo
                                                  .createPackage(
                                                      "2gsAPYsRwadD5qEwLPYFsbKs9Vc",)
                                                  .then((_) {

                                                    context.pushReplacement("/");


                                              });


                                  }
                                },
                                child: const Text(
                                  'Create Package',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
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
          );
        },),) :
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => LoginRepository.instance(),
        ),
        ChangeNotifierProvider(create: (context) => ProfileRepository.instance(),
        ),


      ],child: WelcomeScreen(),);
    }))



    );
  }
}
