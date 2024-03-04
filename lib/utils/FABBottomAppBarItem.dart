
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../package_tracker_screen.dart';
import '../repos/location_repository.dart';





class FABBottomAppBarItem {
  FABBottomAppBarItem({required this.iconName, required this.text});
  String iconName;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({super.key, 
    required this.items,
    required  this.centerItemText,
    this.height = 60.0,
    this.iconSize = 24.0,
    required this.color,
    required this.selectedColor,

    required this.onTabSelected,

  }) {
    //  assert(this.items.length == 2 || this.items.length == 4);
  }
  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;

  final Color color;
  final Color selectedColor;

  final ValueChanged<int> onTabSelected;




  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;


  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      height: 100,
      elevation: 0.0,
      color: Colors.black,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),

    );
  }

  Widget _buildMiddleTabItem() {
    return
      Expanded(
        child: InkWell(
          onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (context){
             return ChangeNotifierProvider(create: (BuildContext context) {
                return LocationRepository.instance();
              },
                  child:
             const PackageTrackerScreen());
            }));
          },
          child: SizedBox(
            height: 100,
            width: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(

                  padding:const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.secondary),


                  child: SvgPicture.asset(
                    'assets/svgs/truck.svg',

                    height: 35,
                    width: 35,
                    fit: BoxFit.cover,
                    color: Colors.black,

                  ),
                ),

              ],
            ),
          ),
        ),

      );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem? item,
    int? index,
    required ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index!),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[




                SizedBox(
                  height: 30,
                  width: 30,


                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Align(
                        alignment:Alignment.center,
                        child: SvgPicture.asset(
                          item!.iconName,

                          height: 24,
                          width: 24,
                          fit: BoxFit.cover,
                          color: color,

                        ),
                      ),



                    ],
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}