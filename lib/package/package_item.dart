import 'package:flutter/material.dart';

import '../models/Package.dart';
import '../utils/step_progress_view.dart';

class PackageItem extends StatefulWidget {
  const PackageItem({required this.packageItem,super.key});
  final Package packageItem;


  @override
  State<PackageItem> createState() => _PackageItemState();
}

class _PackageItemState extends State<PackageItem> {
  final List<String> deliveryProgress = ['PENDING', "IN TRANSIT", "DELIVERED"];
  final int _curStep = 2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(

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
    );
  }
}
