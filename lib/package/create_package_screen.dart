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
          child: Column(
            children: [

              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Text("Package Status :",style: TextStyle(color: Colors.white,fontSize: 15),),
                    DropdownButton<String>(
                      value: packageRepo.packageStatus,

                      elevation: 16,
                      style:  TextStyle(color: Theme.of(context).primaryColor,fontSize: 20),

                      onChanged: (String? value) {

                        packageRepo.packageStatus= value!;

                      },
                      items: packageRepo.packageStatusList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },),)

    );
  }
}
