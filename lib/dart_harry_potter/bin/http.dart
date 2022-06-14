import 'baguette.dart';
import 'sorcier.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class HTTP{
  static Future<List<Sorcier>> RecupSorcier() async{
    http.Response reponse = await http.get(Uri.parse('http://hp-api.herokuapp.com/api/characters'));
    List<dynamic> data = [Map<String,String>()];
    if (reponse.statusCode == 200){
        data = convert.jsonDecode(reponse.body);
      }else{
        print("erreur");
      }
    List<Sorcier> lesSorciers = [];                 
    for(Map sorcier in data){
      Baguette laBaguette = Baguette(sorcier['wand']['wood'],sorcier['wand']['core'],sorcier['wand']['length'].toString());
      Sorcier lesorcier = Sorcier(sorcier['name'], sorcier['gender'], sorcier['house'], sorcier['wizard'], sorcier['dateOfBirth'], laBaguette, sorcier['image']);
      lesSorciers.add(lesorcier);
    }
    return lesSorciers;
  }
}