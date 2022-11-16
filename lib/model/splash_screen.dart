import 'dart:async';
import 'package:covidapp/model/world_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math'as math;

class SplassScreen extends StatefulWidget {
  const SplassScreen({Key? key}) : super(key: key);
  @override
  _SplassScreenState createState() => _SplassScreenState();
}

class _SplassScreenState extends State<SplassScreen> with TickerProviderStateMixin {

 late final AnimationController _controller=AnimationController(
   duration:const Duration(seconds: 3),
     vsync: this)..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>WorldStatesScreen()))
    );
  }
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:const Center(child: Text('Covid App',style: TextStyle(color:Colors.cyanAccent),)),
        ),
        body: SafeArea(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedBuilder(
                    animation: _controller,
                    child: Container(
                      height: 200,
                      width: 200,
                      child:const Center(
                        child: Image(image: AssetImage('images/covid.png')),

                      ),

                    ),
                    builder: (BuildContext contex, Widget? child){
                      return Transform.rotate(
                          angle: _controller.value *2.0 * math.pi,
                         child: child,
                      );
                    }),
                 const  Align(
                   alignment: Alignment.center,
                   child: Text('Covid-19 \n Tracar app',
                   style: TextStyle(
                     fontWeight:FontWeight.bold,fontSize: 25,


               ),),
                 )

              ],
            )),
      ),

    );
  }
}
