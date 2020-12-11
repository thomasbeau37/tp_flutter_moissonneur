import 'package:flutter/material.dart';
import 'package:project_1/pages/create_team.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'Model/Character.dart';
import 'Providers/CharactersModel.dart';

void main() {
  runApp(FutureProvider(
    create: (context) => loadModelFromInternet(),
    child: MyApp(),
    initialData: CharactersModel(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
     );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _checked = false;

  @override
  Widget build(BuildContext context) {
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
                text: "Créer une équipe",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Consumer<CharactersModel>(
              builder: (context, charactersModel, child) {
                return CreateTeam(
                  characters: charactersModel.characters,
                );
              },
            ),
          ],
        ),
      ),
    ),
    );
  }
}
