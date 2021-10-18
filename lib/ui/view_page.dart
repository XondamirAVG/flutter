import 'dart:convert';

import 'package:dasrsuper/models/weather_data.dart';
import 'description_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewPage extends StatefulWidget {
  String img;
  String name;
  String cityname;
  ViewPage(
      {required this.img,
      required this.name,
      required this.cityname});
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.img), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  )),
              SizedBox(
                height: 300,
              ),
                FutureBuilder(
                  future: getWeather(),
                  builder: (context,AsyncSnapshot<Map<String,String>> snap) {
                    var data= snap.data;
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                
                              ),
                            ),
                            Column(
                              children: [
                                Text("${double.parse(data!['temp']!)-273.15}",style: TextStyle(color: Colors.white,fontSize: 22),),
                                Text("Wind: ${data['speed']}km/h NNE",style: TextStyle(color: Colors.white, fontSize: 18  ),)
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                ),
                SizedBox(height: 60,),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "${widget.name}",
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 30),
                child: Text(
                  "SAn Francisco, United States",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfoPage()));
                      },
                      child: Container(
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white)),
                        alignment: Alignment.center,
                        child: Text(
                          "PreView",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green),
                      alignment: Alignment.center,
                      child: Text(
                        "Start Round",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Swipe for detail",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map<String,String>> getWeather() async {
    var url = Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=${widget.cityname}&appid=c7d88febc9679d418f7d69d8e2764c4f");
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var weather=jsonDecode(res.body) ;
      return {
        "temp":weather["main"]["temp"].toString(),
        "speed":weather["wind"]["speed"].toString()
      };
    } else {
      throw Exception("Xatolar:");
    }
  }
}
