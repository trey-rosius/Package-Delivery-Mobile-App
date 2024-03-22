import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_delivery/utils/FABBottomAppBarItem.dart';
import 'package:package_delivery/utils/icon_text.dart';
import 'package:package_delivery/utils/step_progress_view.dart';

import 'order/line_chart.dart';
import 'order/order_history_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> deliveryProgress = ['PENDING', "IN TRANSIT", "DELIVERED"];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final int _curStep = 2;
  int _selectedTabIndex = 0;

  void _selectedTab(int index) {

    if(index == 2)
    {

    }
    setState(() {
      _selectedTabIndex = index;


    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
      key: _scaffoldKey,
      appBar:  PreferredSize(


        preferredSize: const Size(double.infinity,80),
        child: SafeArea(
            child:
            Container(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                child:
                _selectedTabIndex ==0 ?
                Text('dlveries',style: TextStyle(color: Colors.white,fontSize: 20),) :
                _selectedTabIndex == 2 ?
                Text('order history',style: TextStyle(color: Colors.white,fontSize: 20),)  :
                Text('other screen',style: TextStyle(color: Colors.white,fontSize: 20),)
            )),
      ),
         body: _selectedTabIndex ==0 ?SingleChildScrollView(
           child:  Container(
             
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Container(
             
             
                         decoration: BoxDecoration(
                             color: const Color(0xFF222222),
                             borderRadius: BorderRadius.circular(30)
             
                         ),
                         padding: const EdgeInsets.only(top: 7,right: 10),
                         margin: const EdgeInsets.only(right: 10),
             
             
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
             
                               children: [
                                 Stack(
                                   alignment:Alignment.bottomRight,
                                   children: [
                                     ClipRRect(
                                         borderRadius:BorderRadius.circular(1000),
                                         child: Image.asset('assets/images/rosius.jpg',fit: BoxFit.cover,
                                           height: 50,width: 50,)),
             
                                     Container(
                                         padding: const EdgeInsets.all(2),
                                         decoration:  BoxDecoration(
                                             border: Border.all(color: Colors.white,width: 2),
                                             shape: BoxShape.circle,
                                             color:  Theme.of(context).colorScheme.secondary),
             
                                         child: SvgPicture.asset('assets/svgs/car.svg',height: 15,width:15,color: Colors.black,))
                                   ],
                                 ),
                                 Container(
                                   padding: const EdgeInsets.only(left: 10),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       const Text("Hi, Rosius",style: TextStyle(color: Colors.white,fontSize: 14),),
                                       const Text("Update Profile",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                       Text("Out for delivery",style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontSize: 13,fontWeight: FontWeight.bold),)
                                     ],
                                   ),
                                 )
                               ],
                             ),

                             Container(
                               padding: const EdgeInsets.only(top: 10,bottom: 5),
             
             
                               child: Row(
             
                                 children: [
                                   Container(
                                     alignment: Alignment.center,
                                     padding: const EdgeInsets.all(10.0),

             
                                     width: 50,
                                     height: 50,
                                     decoration:  BoxDecoration(
                                         color:Theme.of(context).colorScheme.secondary,
             
             
                                         shape: BoxShape.circle
             
                                     ),
             
                                     child:  SvgPicture.asset('assets/svgs/precise_location.svg',height: 70,width:70,color: Colors.black,),),
                                   Container(
                                     padding: const EdgeInsets.only(left: 10),
                                     child: const Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text("Your Location",style: TextStyle(color: Colors.white,fontSize: 15),),
                                         Text("Douala,Cameroon",style: TextStyle(color: Colors.grey,fontSize: 12),)
                                       ],
                                     ),
                                   )
                                 ],
                               ),
                             ),
             
                           ],
                         ),
             
             
                       ),
                       const Column(
                         children: [
                          IconText(
                                 header1:"Order Number",
                                 header2:"#653576574",
                                 svgIcon:'assets/svgs/distance.svg'

                             ),

                           IconText(
                                 header1:"Order with us",
                                 header2:"dlveries",
                                 svgIcon:'assets/svgs/truck.svg'

                             ),


                         ],
                       )
                     ],
                   ),
                   Container(
             
                     decoration: BoxDecoration(
                         color: const Color(0xFF222222),
                         borderRadius: BorderRadius.circular(10)
             
                     ),
                     padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                     margin: const EdgeInsets.symmetric(vertical: 20,),
             
             
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             const Text("Current Delivery",style: TextStyle(fontSize: 20,
                                 color: Colors.white,
                                 fontWeight:FontWeight.bold),),
                             ElevatedButton(
                                 style: ButtonStyle(
                                     backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary)
                                 ),
                                 onPressed: (){}, child: const Text("Transit",style: TextStyle(color: Colors.black),))
                           ],
                         ),
                         Container(
                           padding: const EdgeInsets.only(top: 10,bottom: 20),
                           child: StepProgressView(width: MediaQuery.of(context).size.width,
                             curStep: _curStep,
                             color: Theme.of(context).colorScheme.secondary,
                             titles: deliveryProgress,),
                         ),
             
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Container(
                               color: Colors.white,
                               width: size.width/4,
                               height: 2,
                             ),
                             Text('Package Status',style: TextStyle(fontSize: 15,
                                 fontWeight: FontWeight.bold,
                                 color: Theme.of(context).colorScheme.secondary),),
                             Container(
                               color: Colors.white,
                               width: size.width/4,
                               height: 2,
                             ),
                           ],
                         ),
             
                         Column(
                           children: [
                             Container(
                               padding: const EdgeInsets.symmetric(vertical: 10),
                               child: const Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
             
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text('Pending',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                                       Text('Santa Lucia',style: TextStyle(color: Colors.grey,))
             
             
                                     ],
                                   ),
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text('4:40pm',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                                       Text('21 Nov 2024',
                                         style: TextStyle(color: Colors.grey,fontSize: 12),)
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                             Container(
                               padding: const EdgeInsets.symmetric(vertical: 10),
                               child:  Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
             
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text('In Transit',style: TextStyle(fontSize: 15,color:
                                       Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold),),
                                       const Text('Total Bssdi 2',style: TextStyle(color: Colors.grey,))
             
             
                                     ],
                                   ),
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text('5:12pm',style: TextStyle(fontSize: 15,color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold),),
                                       const Text('21 Nov 2024',
                                         style: TextStyle(color: Colors.grey,fontSize: 12),)
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                             Container(
                               padding: const EdgeInsets.symmetric(vertical: 10),
                               child: const Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
             
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text('Pending Delivered',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                                       Text('My Location',style: TextStyle(color: Colors.grey,))
             
             
                                     ],
                                   ),
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text('5:40pm',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                                       Text('21 Nov 2024',
                                         style: TextStyle(color: Colors.grey,fontSize: 12),)
                                     ],
                                   ),
                                 ],
                               ),
                             ),
             
                           ],
                         ),
             
             
                       ],
                     ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                         color: const Color(0xFF222222),
                         borderRadius: BorderRadius.circular(10)
             
                     ),
                     padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                     margin: const EdgeInsets.symmetric(vertical: 20,),
             
                     child: Column(children: [
             
                       const Row(
                         children: [
                           Text('Recent Deliveries',style: TextStyle(fontSize: 20,color: Colors.white),),
                         ],
                       ),
                       Container(
                         margin: const EdgeInsets.symmetric(vertical: 5),
                         height: 80,
                         width: size.width,
                         alignment: Alignment.center,
             
                         decoration: BoxDecoration(
                             color: Theme.of(context).colorScheme.secondary,
                             borderRadius: BorderRadius.circular(10)
                         ),
                         child: const Text('Delivery 1'),
                       ),
                       Container(
                         margin: const EdgeInsets.symmetric(vertical: 5),
                         height: 80,
                         width: size.width,
                         alignment: Alignment.center,
             
                         decoration: BoxDecoration(
                             color: Theme.of(context).colorScheme.secondary,
                             borderRadius: BorderRadius.circular(10)
                         ),
                         child: const Text('Delivery 1'),
                       ),
                       Container(
                         margin: const EdgeInsets.symmetric(vertical: 5),
                         height: 80,
                         width: size.width,
                         alignment: Alignment.center,
             
                         decoration: BoxDecoration(
                             color: Theme.of(context).colorScheme.secondary,
                             borderRadius: BorderRadius.circular(10)
                         ),
                         child: const Text('Delivery 1'),
                       ),
                     ],),
             
             
                   )
                 ],
               ),
             ),

         ): _selectedTabIndex ==2 ?
         OrderHistoryScreen():LineChartSample2(),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: '',
        color: Colors.grey,
        selectedColor: Theme.of(context).colorScheme.secondary,

        onTabSelected: _selectedTab,



        items: [
          FABBottomAppBarItem(iconName:'assets/svgs/home.svg', text: 'home',),
          FABBottomAppBarItem(iconName:'assets/svgs/map.svg', text: 'chats'),
          FABBottomAppBarItem(iconName:'assets/svgs/notification.svg', text: 'noti'),
          FABBottomAppBarItem(iconName:'assets/svgs/profile.svg', text: 'profile'),
        ],
      ),
    );
  }
}
