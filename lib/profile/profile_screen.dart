import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:package_delivery/profile/shimmer_profile_screen.dart';
import 'package:package_delivery/repos/package_repository.dart';
import 'package:provider/provider.dart';



import '../repos/profile_repository.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({required this.userId, super.key});

  final String userId;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var profileRepo = context.read<ProfileRepository>();
    var  packagesRepo = context.read<PackageRepository>();
    Future.delayed(Duration.zero).then((_) async {
      packagesRepo.getPackagesByStatus("PENDING");
      profileRepo.getUserAccountById(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {


    ProfileRepository profileRepository = context.watch<ProfileRepository>();
    PackageRepository packageRepository = context.watch<PackageRepository>();
    return Scaffold(
        key: _scaffoldKey,

        body: ListView.builder(
          itemBuilder: (context, index) {
            if (index == 0) {
              return profileRepository.getUser == null
                  ? ShimmerProfileScreen(): SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [



                          FutureProvider(create: (context)=>profileRepository.getProfilePicDownloadUrl(key: profileRepository.getUser!.profile_pic_url),
                              initialData: null,
                          child: Consumer(
                            builder: (BuildContext context,String? profilePicUrl,child){
                                 return  ClipRRect(
                                     borderRadius: BorderRadius.circular(30),
                                     child:
                                     CachedNetworkImage(
                                       width: 60,
                                       height: 60,
                                       fit: BoxFit.cover,
                                       imageUrl: profilePicUrl??"",
                                       placeholder: (context, url) =>
                                           CircularProgressIndicator(),
                                       errorWidget:
                                           (context, url, error) =>
                                           ClipRRect(
                                             borderRadius:
                                             BorderRadius.circular(
                                                 1000),
                                             child: Image.asset(
                                               "assets/avatars/Image-71.jpg",
                                               width: 60,
                                               height: 60,
                                               fit: BoxFit.cover,
                                             ),
                                           ),
                                     ));

                            },


                          )),



                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "${profileRepository.getUser!.last_name} ${profileRepository.getUser!.first_name}",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                  ),
                                  TextButton.icon(onPressed: (){

                                  }, icon: Icon(Icons.phone,
                                  color: Theme.of(context).colorScheme.secondary,), label:  Text(profileRepository.getUser!.phone_number,
                                    style: TextStyle(color: Colors.white,fontSize: 17),))

                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context.push(
                                  "/createUserAccount");
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).colorScheme.secondary),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Text("Customer Address",style: TextStyle(fontSize: 17,
                            color: Colors.white,decoration: TextDecoration.underline),),
                      ),
                      Container(

                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("address: ${profileRepository.getUser!.address.street}123 Main Street, Apt. 5",style: TextStyle(color: Colors.white)),
                            Text("zip: ${profileRepository.getUser!.address.zip}",style: TextStyle(color: Colors.white),),
                            Text("city: ${profileRepository.getUser!.address.city}",style: TextStyle(color: Colors.white)),
                            Text("country: ${profileRepository.getUser!.address.country}",style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'About',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10),
                              child: Text(profileRepository.getUser!.address.country),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }else{
              index -= 1;
              return Container(
                child:Text( packageRepository.packageList[index].packageName,style: TextStyle(color: Colors.white),),
              );
            }
          },
          itemCount: packageRepository.packageList.length+1,
        ));
  }
}
