import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_1/Model/Character.dart';
import 'package:project_1/Providers/CharactersModel.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash/animated_splash.dart';

class CharacterDetails extends StatefulWidget {
  const CharacterDetails({ Key key }) : super(key: key);

  @override
  _CharacterDetails createState() => _CharacterDetails();
}

class _CharacterDetails extends State<CharacterDetails>{
  @override
  Widget build(BuildContext context) {
    Character char = ModalRoute.of(context).settings.arguments;
    return ChangeNotifierProvider<CharactersModel2>(create: (context) => CharactersModel2(),
      child:
      Consumer<CharactersModel>(
      builder: (context, charactersModel, child) {
        Character perso = charactersModel.getByName(char, charactersModel.characters);
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
                    text: "Caractéristiques",
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
                  Row(
                    children: [
                      Container(
                        child: new Image.asset(
                          "images/body/" + perso.name.replaceAll(" ", "") +
                              ".jpg",
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Column(
                            children: [
                              Container(
                                child: Text("Nom: " + perso.name,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Colors.white),),
                              ),
                              Container(
                                child: Text("Level: " + perso.level,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),),
                              ),
                              Container(
                                width: 300,
                                child: Text(perso.description, style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white),),
                              )
                              ,
                              Column(
                                  children: [
                                    Container(
                                      width: 250,
                                      child: Text("Arme: " + perso.weapon,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),),
                                    ),
                                    Container(
                                      width: 250,
                                        child : Image.asset(
                                        "images/weapons/" +
                                            perso.weapon.replaceAll(" ", "") +
                                            ".png",
                                        fit: BoxFit.cover,
                                      ),
                                     ),
                                  ]
                              )
                            ]
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
       );
       },
      ),
    );
  }
}
