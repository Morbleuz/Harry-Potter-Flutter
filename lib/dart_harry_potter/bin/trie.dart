import 'sorcier.dart';

class Trie{
  static List<Sorcier> searchByName(List <Sorcier> list,String name){
    List<Sorcier> trie = [];
    List<String> part = name.split(' ');
    name = "";
    for(String partie in part){
      name = partie.substring(0,1).toUpperCase() + partie.substring(1,partie.length).toLowerCase();
    } 
    for(Sorcier sorcier in list){
      if(sorcier.getName().contains(name)){
        trie.add(sorcier);
      }
     
    }
    return trie;
  }

    static List<Sorcier> searchByHouse(List <Sorcier> list,String house){
    List<Sorcier> trie = [];
    List<String> part = house.split(' ');
    house = "";
    for(String partie in part){
      house = partie.substring(0,1).toUpperCase() + partie.substring(1,partie.length).toLowerCase();
    } 
    for(Sorcier sorcier in list){
      if(sorcier.getMaison().contains(house)){
        trie.add(sorcier);
      }
     
    }
    return trie;
  }
}