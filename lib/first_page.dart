import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/control_list.dart';
import 'package:wallpaper/second_page.dart';

class full_image extends StatefulWidget {
  int index;

  full_image(this.index);

  @override
  State<full_image> createState() => _full_imageState();
}

class _full_imageState extends State<full_image> {
  List all_list = [];

  @override
  void initState() {
    if (widget.index == 0) {
      all_list = control.disney;
    } else if (widget.index == 1) {
      all_list = control.Nature;
    } else if (widget.index == 2) {
      all_list = control.Animals;
    } else if (widget.index == 3) {
      all_list = control.galaxy;
    } else if (widget.index == 4) {
      all_list = control.black;
    }else if (widget.index == 5) {
      all_list = control.flower;
    }else if (widget.index == 6) {
      all_list = control.girly;
    }else if (widget.index == 7) {
      all_list = control.minimal;
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor:control.color,title: Text("${control.tile_name[widget.index]}",style: TextStyle(color: Colors.white),),),
      body: Container(
        height: h,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF12194A),Color(0xFFE5C0DD)])),
        child: GridView.builder(itemCount: all_list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,crossAxisSpacing: 10, mainAxisSpacing: 10,childAspectRatio: 0.6),
          itemBuilder: (context, index) {
            return OpenContainer(closedColor: Colors.transparent,closedBuilder: (context, action) {
              return Container(decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(10),image: DecorationImage(fit: BoxFit.fill,image: AssetImage("${all_list[index]}"))),);
            }, openBuilder: (context, action) {
              return second(all_list[index],index);
            },);
          },),
      ),
    );
  }
}
