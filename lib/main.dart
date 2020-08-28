import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';

void main() {
  runApp(Login());
}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //@override
//  void initState() {
//    Firestore.instance.collection('NOGOZO').document()
//        .setData({ 'title': 'dukaan', 'author': 'aata' });
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,

            leading: IconButton( icon : Icon(Icons.line_weight,
              color: Colors.white,),
              onPressed: (){

              },),
            title: Image(
              image: AssetImage('assets/nogozo.jpg'),
              height: 60,
            ),
            actions: <Widget>[
              IconButton( icon : Icon(Icons.search,
                color: Colors.white,),
                onPressed: (){

                },)
            ],
          ),
          backgroundColor: Colors.black,
          body: Column(
            children: <Widget>[
              Expanded(child: Carousel()),
              Expanded(child: Grid()),

            ],
          )
      ),

    );

  }


  Widget Carousel(){
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(left: 10,top: 10, right: 10),
            child: Image(
              image: AssetImage('assets/dairy.jpg'),
              height: 100,
              width: 300,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10,top: 10, right: 10),
            child: Image(
              image: AssetImage('assets/footwear.jpg'),
              height: 100,
              width: 300,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10,top: 10, right: 10),
            height: 200,
            width: 200,
            child: Center(child: Text('We can use this space for offers and schemes',
              style: TextStyle(
                fontSize: 30,
              ),)),
            color: Colors.yellowAccent,
          )
        ],
      ),
    );
  }

  Widget Grid(){
    return SingleChildScrollView(
      child: ListBody(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    child: Card(
                      child :  Column(
                        children: <Widget>[
                          Image.asset('assets/sofa.jpg'),
                          Container(
                              child : Text('Furniture')
                          )
                        ],
                      ),
                    ),
                    onTap: (){

                    },
                    splashColor: Colors.orange,
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Card(
                    child :  Column(
                      children: <Widget>[
                        Image.asset('assets/electrical.jpg'),
                        Container(
                          child : Text('Electric')
                        )
                      ],
                      ),
                  ),
                    onTap: (){

                    },
                    splashColor: Colors.yellow,
                  ),
                  ),

              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    child: Card(
                      child :  Column(
                        children: <Widget>[
                          Image.asset('assets/dairy.jpg'),
                          Container(
                              child : Text('Dairy')
                          )
                        ],
                      ),
                    ),
                    onTap: (){

                    },
                    splashColor: Colors.greenAccent,
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Card(
                      child :  Column(
                        children: <Widget>[
                          Image.asset('assets/stat.jpg'),
                          Container(
                              child : Text('Stationary')
                          )
                        ],
                      ),
                    ),
                    onTap: (){

                    },
                    splashColor: Colors.amber,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    child: Card(
                      child :  Column(
                        children: <Widget>[
                          Image.asset('assets/grocery.jpg'),
                          Container(
                              child : Text('Grocery')
                          )
                        ],
                      ),
                    ),
                    onTap: (){

                    },
                    splashColor: Colors.redAccent,
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Card(
                      child :  Column(
                        children: <Widget>[
                          Image.asset('assets/footwear.jpg'),
                          Container(
                              child : Text('Footwear')
                          )
                        ],
                      ),
                    ),
                    onTap: (){

                    },
                    splashColor: Colors.yellow,
                  ),
                ),
              ],
            ),


          ]

      ),
    );




  }

}


