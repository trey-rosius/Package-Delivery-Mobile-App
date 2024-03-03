import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class IconText extends StatelessWidget {
   IconText({required this.header1,required this.header2,required this.svgIcon,super.key});
 final String header1;
 final String header2;
 final String svgIcon;



  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(right: 10),
      margin: EdgeInsets.only(top: 10,),
      decoration: BoxDecoration(
          color: Color(0xFF222222),
          borderRadius: BorderRadius.circular(30)

      ),


      child:   Row(

        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10.0),


            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary
            ),

            child:  SvgPicture.asset(svgIcon,height: 50,width: 50,color: Colors.black,),),
          Container(
            padding: EdgeInsets.only(left: 5),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(header1,style: TextStyle(color: Colors.white,fontSize: 12),),
                Text(header2,style: TextStyle(color: Colors.grey),)
              ],
            ),
          )
        ],
      ),



    );
  }
}
