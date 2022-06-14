
import 'http.dart';
import 'sorcier.dart';


void main(List<String> args)async {
  List<Sorcier> sorciers = await HTTP.RecupSorcier();
  for(Sorcier sorcier in sorciers){
    print(sorcier.toString());
  }
  print("---------");
  
  /*http.Response reponse = await http.get(Uri.parse('http://hp-api.herokuapp.com/api/characters'));
  List<dynamic> data = [Map<String,String>()];
  if (reponse.statusCode == 200){
      data = convert.jsonDecode(reponse.body);
    }else{
      print("erreur");
    }
  List<Sorcier> lesSorciers = [];                 
  for(Map sorcier in data){
    Baguette laBaguette = Baguette(sorcier['wand']['wood'],sorcier['wand']['core'],sorcier['wand']['length'].toString());
    Sorcier lesorcier = Sorcier(sorcier['name'], sorcier['gender'], sorcier['house'], sorcier['wizard'], sorcier['dateOfBirth'], laBaguette);
    lesSorciers.add(lesorcier);
  }
  for(Sorcier sorcier in lesSorciers){
    print(sorcier.toString());
    if(!sorcier.getBaguette().estVide()){
    print(sorcier.getBaguette().toString());
    }else{
      print("Ce sorcier n'a pas de baguette");
    }
    print("\n");

  }

    print("\n" + "| SEARCH BY NAME |");
    List<Sorcier> trie = Trie.searchByName(lesSorciers, 'lestrange');
    print(trie);

    print("\n" + "| SEARCH BY HOUSE |");
    List<Sorcier> house = Trie.searchByHouse(lesSorciers, 'gryffindor');
    print(house);*/

}