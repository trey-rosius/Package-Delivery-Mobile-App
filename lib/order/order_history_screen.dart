import 'package:flutter/material.dart';

import '../utils/step_progress_view.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> deliveryProgress = ['PENDING', "IN TRANSIT", "DELIVERED"];
  final List<String> cancelledProgress = ['PENDING', "IN TRANSIT", "CANCELLED"];
  final int _curStep = 3;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              decoration: BoxDecoration(
                  color: const Color(0xFF222222),
                  borderRadius: BorderRadius.circular(10)

              ),
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              margin: const EdgeInsets.symmetric(vertical: 10,),


              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Order Number",style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight:FontWeight.bold),),
                          Text("#543535567567",style: TextStyle(
                              color: Colors.white,
                              ),),
                        ],
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary)
                          ),
                          onPressed: (){}, child: const Text("Delivered",style: TextStyle(color: Colors.black),))
                    ],
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
                                Text('Package Delivery',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                                Text('Bloc D, Bssdi, Douala',style: TextStyle(color: Colors.grey,))


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
              margin: const EdgeInsets.symmetric(vertical: 10,),


              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Order Number",style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight:FontWeight.bold),),
                          Text("#543535567567",style: TextStyle(
                            color: Colors.white,
                          ),),
                        ],
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xFFff7485))
                          ),
                          onPressed: (){}, child: const Text("Cancelled",style: TextStyle(color: Colors.white),))
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10,bottom: 20),
                    child: StepProgressView(width: MediaQuery.of(context).size.width,
                      curStep: _curStep,
                      color: Color(0xFFff7485),
                      titles: cancelledProgress,),
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
                                Text('Package Cancelled',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                                Text('14th street, Mangoa Bell,Dla',style: TextStyle(color: Colors.grey,))


                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('11:30pm',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                                Text('19 March 2024',
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
              margin: const EdgeInsets.symmetric(vertical: 10,),


              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Order Number",style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight:FontWeight.bold),),
                          Text("#543535567567",style: TextStyle(
                            color: Colors.white,
                          ),),
                        ],
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary)
                          ),
                          onPressed: (){}, child: const Text("Delivered",style: TextStyle(color: Colors.black),))
                    ],
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
                                Text('Package Delivery',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                                Text('Bloc D, Bssdi, Douala',style: TextStyle(color: Colors.grey,))


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
          ],
        ),
      ),
    );
  }
}
