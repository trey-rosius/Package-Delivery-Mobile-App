import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    Future.delayed(Duration.zero).then((_) async {
     // postRepo.getAllPosts(10);
      profileRepo.getUserAccountById(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {


    ProfileRepository profileRepository = context.watch<ProfileRepository>();
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(),
        body: ListView.builder(
          itemBuilder: (context, index) {
            if (index == 0) {
              return SingleChildScrollView(
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
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child:
                                    Text(profileRepository.getUser!.username),
                                  ),
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
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment(0.8, 1),
                                      colors: [
                                        Color(0xFFFBDA61),
                                        Color(0xFFFF5ACD),
                                      ])),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: const Row(
                                children: [
                                  Text(
                                    '170',
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.bold),
                                  ),
                                  Text(' '),
                                  Text(
                                    'Designs',
                                    style: TextStyle(),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: const Row(
                                children: [
                                  Text(
                                    '6',
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.bold),
                                  ),
                                  Text(' '),
                                  Text('Followings',
                                      style: TextStyle())
                                ],
                              ),
                            ),
                            Container(
                              child: const Row(
                                children: [
                                  Text(
                                    '6',
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.bold),
                                  ),
                                  Text(' '),
                                  Text(
                                    'Followings',
                                    style: TextStyle(),
                                  )
                                ],
                              ),
                            ),
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
              return Container(color: Colors.red,);
            }
          },
          itemCount: 2,
        ));
  }
}
