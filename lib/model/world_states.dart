import 'package:covidapp/detels/WorldStatasModels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import '../services/start_servises.dart';
import '../model/countries_list.dart';


class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({Key? key}) : super(key: key);

  @override
  _WorldStatesScreenState createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen> with TickerProviderStateMixin {

  late final AnimationController _controller=AnimationController(
      duration:const Duration(seconds: 3),
      vsync: this)..repeat();
    @override
     void dispose() {
    super.dispose();
    _controller.dispose();
  }

     final colorlist =<Color> [
        const Color (0xff4285F4),
        const Color (0xff1aa260),
        const Color (0xffde5246),


  ];
  @override
  Widget build(BuildContext context) {
    StartServises startServises=StartServises();

    return Scaffold(
      appBar:AppBar(title:const Center(child: Text('Covid-19 Demo'))),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder(
                     future: startServises.factWorldStatRecord(),
                      builder: (context,AsyncSnapshot<WorldStatasModels> snapshot){
                       if(!snapshot.hasData)
                         {
                          return Expanded(
                            flex: 1,
                              child: SpinKitFadingCircle(
                                color: Colors.grey,
                                size: 5.0,
                                controller: _controller,
                              )

                          );
                         }
                       else{
                         return Column(
                           children: [
                            PieChart(
                               legendOptions:const LegendOptions(
                                   legendPosition: LegendPosition.left
                               ),
                               dataMap: {
                                 'total':double.parse(snapshot.data!.cases!.toString()),
                                 'Recovered':double.parse(snapshot.data!.recovered!.toString()),
                                 'Deaths':double.parse(snapshot.data!.recovered!.toString()),
                               },

                               animationDuration:const Duration(milliseconds:1200 ),
                               chartType: ChartType.ring,
                               colorList:colorlist,
                              chartValuesOptions: ChartValuesOptions (
                                showChartValuesInPercentage: true,
                                ),

                             ),
                             SizedBox(height: MediaQuery.of(context).size.height*.1),

                               Card(
                                 child: Padding(
                                   padding: const EdgeInsets.all(15),
                                     child: Column(
                                       children: [
                                         ReseableRow(title:'Total', value: snapshot.data!.cases.toString()),
                                         ReseableRow(title: 'deaths', value: snapshot.data!.deaths.toString()),
                                         ReseableRow(title: 'recovered', value: snapshot.data!.recovered.toString()),
                                         ReseableRow(title:'active', value: snapshot.data!.active.toString()),
                                         ReseableRow(title: 'critical', value: snapshot.data!.critical.toString()),
                                         ReseableRow(title: 'todayCases', value: snapshot.data!.todayCases.toString()),
                                         ReseableRow(title:'todayDeaths', value: snapshot.data!.todayDeaths.toString()),

                                       ],
                                     ),

                                 ),
                               ),
                             GestureDetector(
                                     onTap: (){
                                       Navigator.push(context,MaterialPageRoute(builder: (context)=>CountrisListScren()));
                                     },
                               child: Container(
                                 height: 50,
                                 decoration: BoxDecoration(
                                   color:const Color(0xff1aa260),
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 child:const Center(
                                   child: Text('Track Countire'),
                                 ),
                               ),
                             )

                           ],
                         ) ;

                       }
                      }),

                ],

              ),
            ),

        ),
      ),
    );
  }
}

class ReseableRow extends StatelessWidget {
  String title,value;
    ReseableRow({Key? key, required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),


        child: Column(
          children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title),
                   Text(value)
                ],
              ),
            SizedBox(height: 5,),
            Divider()
          ],
        ),
    );
  }
}

