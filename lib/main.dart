
import 'package:flutter/material.dart';
import 'dart_harry_potter/bin/http.dart';
import 'dart_harry_potter/bin/baguette.dart';
import 'dart_harry_potter/bin/sorcier.dart';
import 'dart_harry_potter/bin/trie.dart';
Future<void> main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happy Potter API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Harry Potter API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}





Sorcier recupSorcier(List<Sorcier> sorciers, int index){
  return sorciers[index];
}


class _MyHomePageState extends State<MyHomePage> {
  List<Sorcier> _lesSorciers = new List.empty(growable: true);

  //Bool pour savoir si la récupération des données est ok
  bool recupData = false;

  void recupDataJson() async{
    await recupLesSorciers();
    if(mounted){
    setState(() {
      recupLesSorciers();
    });
    }

  }
  //Méthode pour récupérer les données de l'api HP
  Future<void> recupLesSorciers() async {
    _lesSorciers = await HTTP.RecupSorcier();
    recupData = true;
 

  }
  void incrementIndex(){
    setState(() {
      if(index<100){
        index++;
        afficheSorcier(context);
      }
    });

  }
  void decrementIndex(){
    setState(() {
      if(index>0){
        index--;
        afficheSorcier(context);
        
      }      
    });

  }
  Widget afficheSorcier(BuildContext context){
    Column contenu = new Column();
    setState(() {
      if(recupData){
      contenu =  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                _lesSorciers[index].getImage(),
                width: 320,
              ),
              Text(
                'Nom : ' + this._lesSorciers[index].getName(),
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'Maison : ' + this._lesSorciers[index].getMaison(),
                style: Theme.of(context).textTheme.headline4,
              ),   
              Text('Index : $index'),         
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: decrementIndex, child: const Text('Avant')),
                  const Padding(padding: EdgeInsets.all(10)),
                  ElevatedButton(onPressed: incrementIndex, child: const Text('Suivant'))
                ],
              )
            ],
            
          );
    }else{
      recupDataJson();
      contenu = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Attente des données")
        ],
      );
    }
    });
    

   
      return contenu;
  }
  int index = 0;
  @override
  Widget build(BuildContext context) {
    if(_lesSorciers.isEmpty){
      recupDataJson();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: afficheSorcier(context),
      ), //  This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

