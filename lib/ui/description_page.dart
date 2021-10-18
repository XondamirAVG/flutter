import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  int uzunligi = 20;
  List iconlar = List.generate(5, (index) => false);
  @override
  void initState() {
    super.initState();
    iconlar[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            width: 400,
            // color: Colors.redAccent,
            child: Stack(
              children: [
                Container(
                  height: 250,
                  width: 400,
                  // color: Colors.purple,
                  child: PageView.builder(
                    itemCount: iconlar.length,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: .3),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://source.unsplash.com/random/$index"),
                        ),
                      ),
                    ),
                    onPageChanged: (d) {
                      setState(() {
                        iconlar = List.generate(5, (index) => false);
                        iconlar[d] = true;
                      });
                    },
                  ),
                ),
                Positioned(
                  left: 25,
                  bottom: 20,
                  child: Container(
                    width: 100,
                    height: 7,
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 2),
                              width: iconlar[index] ? 17 : 7,
                              decoration: BoxDecoration(
                                  color:
                                      iconlar[index] ? Colors.white : Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                            )),
                  ),
                ),
                Positioned(
                    top: 50,
                    left: 20,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Container(
            width: 400,
            height: 170,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            // color: Colors.black26,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Meadow Spring Golf And Country Club",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 14),
                Text(
                  "San Fransisco, United States",
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 35,
                  decoration: BoxDecoration(
                    //color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                       Icon(
                    Icons.navigation,
                    color: Colors.black54,
                    size: 20,
                  ), Icon(
                    Icons.navigation,
                    color: Colors.black54,
                    size: 20,
                  ),
                        Icon(
                    Icons.navigation,
                    color: Colors.black54,
                    size: 20,
                  ), Icon(
                    Icons.navigation,
                    color: Colors.black54,
                    size: 20,
                  ),
                  Container(
                    width: 80,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green, width: 1),
                    ),
                    child: Text(
                      "Follow",
                      style: TextStyle(color: Colors.green, fontSize: 17),
                    ),
                  ),
                    ],
                  )
                ),
              ],
            ),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: .5))),
          ),
          Container(
            height: 250,
            width: 400,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Information",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Icon(Icons.star),
                              Text("4.6"),
                            ],),
                            Text("  341  Views",style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                         child: Column(
                          children: [
                            
                              
                              Text("4,346"),
                              SizedBox(height: 10,),
                            
                            Text("Followers",style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                         child: Column(
                          children: [
                           
                              Icon(Icons.flag),
                             
                           
                            Text(" 18 holes",style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                      )
                    ],
                  ),
                  Text("fhdshafhashdfhashgadfhjsdfjhadsjdsafjkadsghadsgagtvaivygyvudfyguaeigdg27gvbiuasg478gbaiusfgaw7gadsuifaibfdasfADSFADSFJJSFHEUHFDHDKSHARUKAUIOEHIOFQHdiuf7")
                ],
              ),
            ),
          ),
          Container(
            height: 89.2,
            width: 400,
            // color: Colors.black87,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 167,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green, width: 1),
                    ),
                    child: Text(
                      "Preview",
                      style: TextStyle(color: Colors.green, fontSize: 17),
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    width: 167,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 1)),
                    child: Text(
                      "Start Round",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
