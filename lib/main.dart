import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/control_list.dart';
import 'first_page.dart';

void main() {
  runApp(MaterialApp(
    home: wallpaper(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
  ));
}

class wallpaper extends StatefulWidget {
  const wallpaper({Key? key}) : super(key: key);

  @override
  State<wallpaper> createState() => _wallpaperState();
}

class _wallpaperState extends State<wallpaper> {

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor:control.color ,title: Text("Disney Plus Wallpaper")),
      body: Container(
          width: double.infinity,
          height: h / 1,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF12194A),Color(0xFFE5C0DD)])),
          child: GridView.builder(
            itemCount: control.titel_image.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              return OpenContainer(closedColor: Colors.transparent,transitionDuration: Duration(seconds: 1),closedBuilder: (context, action) {
                return Container(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.center,
                    height: h / 15,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: double.infinity,
                    child: Text(
                      "${control.tile_name[index]}",
                      style: GoogleFonts.alef(
                          fontSize: 20, color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(control.titel_image[index]))),
                );
              }, openBuilder: (context, action) {
                return full_image(index);
              },);
            },
          )
      ),

    );
  }
}
