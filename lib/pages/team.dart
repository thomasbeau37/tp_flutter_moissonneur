import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_1/Model/Character.dart';
import 'package:project_1/Providers/CharactersModel.dart';
import 'package:project_1/pages/character_details.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class Team extends StatefulWidget {
  Team({this.characters});
  final List<Character> characters;

  @override
  _Team createState() => _Team();

}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage("images/background_character.jpg"),
      fit: BoxFit.cover,
    ),
    border: Border.all(
        width: 2.0
    ),
    borderRadius: BorderRadius.all(
        Radius.circular(15.0) //
    ),
  );
}


class _Team extends State<Team> {

  @override
  Widget build(BuildContext context) {
    final char = ModalRoute.of(context).settings.arguments;
    List selectedChar = [];
    selectedChar = char;
    return MaterialApp(
      home: DefaultTabController(
        length: 1,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Mission Finale : Abattre le moissonneur"),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Équipe",
                )
              ],
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.black,
                    size: 24.0,
                  ),
                  color: Colors.blueGrey,
                  textColor: Colors.white,
                  elevation: 5,
                  padding: EdgeInsets.all(20),
                ),
              ),
              Expanded(
                child : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: selectedChar.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        decoration: myBoxDecoration(),
                        child: AspectRatio(
                          aspectRatio: 3 / 1,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    AspectRatio(
                                      aspectRatio: 1 / 1,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "images/head/"+selectedChar[index].name.replaceAll(" ", "")+".jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    AspectRatio(
                                      aspectRatio: 4 / 3,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            selectedChar[index].name,
                                            style: TextStyle(
                                                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                          ),
                                          Text(
                                            "",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey[500],
                                                fontWeight: FontWeight.w300),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "Level: "+selectedChar[index].level,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CharacterDetails(), settings: RouteSettings(arguments: selectedChar[index])),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.zoom_in,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }

}

