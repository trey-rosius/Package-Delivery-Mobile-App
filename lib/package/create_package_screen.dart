import 'package:flutter/material.dart';
import 'package:package_delivery/repos/package_repository.dart';
import 'package:package_delivery/repos/profile_repository.dart';
import 'package:provider/provider.dart';
class CreatePackageScreen extends StatefulWidget {
  const CreatePackageScreen({Key? key}) : super(key: key);

  @override
  State<CreatePackageScreen> createState() => _CreatePackageScreenState();
}

class _CreatePackageScreenState extends State<CreatePackageScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:  PreferredSize(


          preferredSize: const Size(double.infinity,80),
          child: SafeArea(
              child:
              Container(child:
              const Text('Create Package',style: TextStyle(color: Colors.white),))),
        ),
      body:ChangeNotifierProvider.value(value: PackageRepository.instance(),
      child: Consumer(builder: (_,PackageRepository packageRepo,child){
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
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
                  child: TextFormField(
                    controller: packageRepo.deliveryAddressController,
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
                      labelText: 'Package Delivery Address',
                      labelStyle: const TextStyle(color: Colors.white),
                      hintText: "Package Delivery Address",
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Package Delivery Address';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },),)

    );
  }
}
