import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;


class second extends StatefulWidget {
  String all_list;
  int index;

  second(this.all_list, this.index);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {



  int ind=0;
  PageController ?controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ind=widget.index;
    controller=PageController(initialPage: ind);
  }


  late File file;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;

    return Scaffold(

        body: Container(
          height: h,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF12194A),Color(0xFFE5C0DD)])),
          child: PageView.builder(controller:controller,itemCount: widget.all_list.length,onPageChanged: (value) {
            setState(() {
              ind=value;
              print("v=$ind");
            });
          },itemBuilder: (context, index) {
            return InkWell(onTap:() {
              showDialog(context: context, builder: (context) {
                return SimpleDialog(children: [
                  TextButton(onPressed: () {
                    getImageFileFromAssets("image/${widget.all_list}").then((value) async {
                      int location = WallpaperManager.LOCK_SCREEN; //can be Home/Lock Screen
                      bool result = await WallpaperManager.setWallpaperFromFile(value.path, location);
                      print("result=$result");

                    },);
                    Navigator.pop(context);
                  }, child: Text("lock screen")),
                  TextButton(onPressed: () {
                    getImageFileFromAssets("image/${widget.all_list[index]}").then((value) async {
                      int location = WallpaperManager.HOME_SCREEN; //can be Home/Lock Screen
                      bool result = await WallpaperManager.setWallpaperFromFile(value.path, location);
                      print("result=$result");

                    },);
                    Navigator.pop(context);
                  }, child: Text("home screen")),
                  TextButton(onPressed: () {
                    getImageFileFromAssets("image/${widget.all_list}").then((value) async {
                      int location = WallpaperManager.BOTH_SCREEN; //can be Home/Lock Screen
                      bool result = await WallpaperManager.setWallpaperFromFile(value.path, location);
                      print("result=$result");
                    },);
                    Navigator.pop(context);
                  }, child: Text("both screen"))
                ],);
              },);

            } ,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("${widget.all_list[index]}"))),
              ),
            );
          },),
        )
    );
  }
  Future<File> getImageFileFromAssets(path1) async {
    final byteData = await rootBundle.load('$path1');
    var path = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS)+"/wallpaperfolder";
    print("path=$path");
    Directory dr=Directory(path);
    if(!await dr.exists())
    {
      await dr.create();
    }
    print("dr=$dr");
    final tempfile=File("${await dr.path}/1.jpg");
    print("tempfile=$tempfile");
    file=await tempfile.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    print("file=$file");
    return file;
  }
}
