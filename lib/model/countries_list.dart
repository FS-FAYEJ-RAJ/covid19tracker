import 'package:covidapp/services/start_servises.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../model/detels.dart';
class CountrisListScren extends StatefulWidget {
  const CountrisListScren({Key? key}) : super(key: key);

  @override
  _CountrisListScrenState createState() => _CountrisListScrenState();
}

class _CountrisListScrenState extends State<CountrisListScren> {
  TextEditingController searchcontrolar=TextEditingController();
  @override
  Widget build(BuildContext context) {
    StartServises startServises=StartServises();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value){
                    setState(() {

                    });
                  },
                  controller: searchcontrolar,
                  decoration: InputDecoration(
                    hintText: 'Search Countries',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    )
                  ),
                ),
              ),
              Expanded(
                  child: FutureBuilder(
                     future:startServises.countriesListApi() ,
                      builder: (context,AsyncSnapshot<List<dynamic>> snapshot)
                      {
                        if(!snapshot.hasData)
                          {
                            // Ai Return Ar kaj Sudu Shimmar ta Show Korar Jonno
                            return ListView.builder(
                                itemCount: 7,
                                itemBuilder: (context,index) {
                                  return Shimmer.fromColors(
                                      baseColor: Colors.grey.shade700,
                                      highlightColor: Colors.grey.shade100,
                                     child:  Column(
                                       children: [

                                         ListTile(
                                           title:Container(height: 10,width: 89,color: Colors.white,),
                                           subtitle: Container(height: 10,width: 89,color: Colors.white,),
                                           leading:Container(height: 50,width: 50,color: Colors.white))
                                       ],
                                     ),
                                  );

                                });
                          }
                        else{
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                              itemBuilder: (context,index) {

                              String name=snapshot.data![index]['country'];
                              if(searchcontrolar.text.isEmpty)
                                {
                                  return Column(
                                    children: [

                                      InkWell(
                                        onTap: (){
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context)=>DetelsScreen(
                                                name: snapshot.data![index]['country'],
                                                image:snapshot.data![index]['countryInfo']['flag'],
                                                todayCases:snapshot.data![index]['countryInfo']['todayCases'],
                                                todayDeaths: snapshot.data![index]['countryInfo']['todayDeaths'],
                                                todayRecovered: snapshot.data![index]['countryInfo']['todayRecovered'],


                                              )));
                                        },
                                        child: ListTile(
                                          title: Text(snapshot.data![index]['country']),
                                          subtitle: Text(snapshot.data![index]['cases'].toString()),

                                          leading: Image(
                                              height: 50,
                                              width: 40,
                                              image:NetworkImage(
                                                  snapshot.data![index]['countryInfo']['flag']
                                              )),),
                                      )
                                    ],
                                  );

                                }
                              else if(name.toLowerCase().contains(searchcontrolar.text.toLowerCase()))
                                {
                                  return Column(
                                    children: [

                                      ListTile(
                                        title: Text(snapshot.data![index]['country']),
                                        subtitle: Text(snapshot.data![index]['cases'].toString()),

                                        leading: Image(
                                            height: 50,
                                            width: 40,
                                            image:NetworkImage(
                                                snapshot.data![index]['countryInfo']['flag']
                                            )),)
                                    ],
                                  );

                                }
                              else{
                               return Container();

                              }




                              });
                        }


                      })),

            ],
          )),
    );
  }
}

