import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutteronboarding/modals/exercie_hub.dart';
import 'package:http/http.dart' as http;

import 'exercise_start_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String apiUrl = "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";

  ExerciseHub excercieHub;
  ScrollController _scrollController = ScrollController();

  @override
  void initState(){
    getExcercises();
    super.initState();
  }

  void getExcercises() async {
    var response = await http.get(apiUrl);
    var body = response.body;

    var decodedJson = jsonDecode(body);
    excercieHub = ExerciseHub.fromJson(decodedJson);
//    print(excercieHub);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: excercieHub != null ? ListView(
              children: excercieHub.exercises.map((e) {
                return InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder:(context)=> ExerciseStartScreen(
                            exercises:e,
                          )
                      )
                    );
                  },
                  child: Hero(
                    tag: e.id,
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Stack(
                        children: <Widget>[
                         ClipRRect(
                            borderRadius: BorderRadius.circular(16),
//                            child: FadeInImage(
//                              image: NetworkImage(e.thumbnail),
//                              placeholder: AssetImage("assets/images/placeholder.png"),
//                              width: MediaQuery.of(context).size.width,
//                              height: 250,
//                              fit: BoxFit.cover,
//                            ),
                              child: CachedNetworkImage(
                                imageUrl: e.thumbnail,
                                placeholder: (context, url) => Image(
                                  image: AssetImage("assets/images/placeholder.png"),
                                  fit: BoxFit.cover,
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                                fit: BoxFit.cover,
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                              ),
                          ),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF000000),
                                    Color(0x00000000),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.center,
                                )
                              ),
                            ),
                          ),

                          Container(
                            height: 250,
                            padding: EdgeInsets.only(left: 10, bottom: 10),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              e.title,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                              )
                            )
                          )

                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            )
            : LinearProgressIndicator(),
      )
    );
  }
}
