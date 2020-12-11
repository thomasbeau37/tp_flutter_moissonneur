import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:project_1/Model/Character.dart';
import 'package:project_1/Providers/CharactersModel.dart';
import 'dart:developer';

import 'package:project_1/pages/team.dart';

class CreateTeam extends StatefulWidget{
  CreateTeam({this.characters});
  final List<Character> characters;
  //const CreateTeam({Key key, this.characters}) : super(key: key);

  @override
  _CreateTeam createState() => _CreateTeam();
}

class Selected {

}

final Map<int, bool> values = {};

class _CreateTeam extends State<CreateTeam> {
  var characters;

  @override
  void initState() {
    characters = widget.characters;
    super.initState();
  }

  /*Map<int, bool> values = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
    7: false,
    8: false
  };

  //va check la case et ajouter les persos qu'on a coché, si <=3 membres
  void check(index, value){
    if(selectedChar.length <= 2) {
      if(values[index] == true){
        values[index] = value;
        selectedChar.remove(characters[index]);
      }
      else {
        selectedChar.add(characters[index]);
      }
    }
    else{
      if(values[index] == true){
        values[index] = value;
        selectedChar.remove(characters[index]);
      }
      return;
    }
    values[index] = value;
  }*/

  List checked = [];
  List selectedChar = [];
  void check(index, value){
    if(checked.length <= 2) {
      if(checked.contains(index)){
        checked.remove(index);
        selectedChar.remove(characters[index]);
      }
      else{
        checked.add(index);
        selectedChar.add(characters[index]);
      }
    }
    else{
      if(checked.contains(index)){
        checked.remove(index);
        selectedChar.remove(characters[index]);
      }
    }
  }

  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return Column(
      children: [
        Container(
          width: 1000,
          child: Card(
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Sélectionnez 3 personnages", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child : Scrollbar(
            isAlwaysShown: true,
            controller: _scrollController,
            child : ListView.separated(
              itemCount: characters.length,
              controller: _scrollController,
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(color: Colors.black),
              itemBuilder: (context, index) {
                final item = characters[index];
                final path = "images/head/"+characters[index].name+".jpg";
                return new CheckboxListTile(
                    title:  Text('${item.name}', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),),
                    value:  checked.contains(index),
                    onChanged: (bool value) {
                      setState(() {
                        check(index, value);
                      });
                    },
                    secondary:  CircleAvatar(backgroundImage: AssetImage( "images/head/"+characters[index].name.replaceAll(" ", "")+".jpg"), maxRadius: 20,),
                    );
              },
            ),
          ),
        ),
        Container(
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Team(), settings: RouteSettings(arguments: selectedChar)),
              );
            },
            child: const Text('Valider', style: TextStyle(fontSize: 20)),
            color: Colors.green,
            textColor: Colors.black,
            elevation: 5,
            padding: EdgeInsets.all(20),
          ),
        ),
      ],
    );
  }

}
