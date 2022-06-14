import 'baguette.dart';

class Sorcier{
  String _name;
  String _sexe;
  String _maison;
  bool _estSorcier;
  String _birthday;
  Baguette _baguette;
  String _image;

  Sorcier(this._name,this._sexe,this._maison,this._estSorcier,this._birthday,this._baguette,this._image);

  @override
  String toString() {
    // TODO: implement toString
    return this._name + ", " + this._sexe + ", " + this._maison + ", " + this._estSorcier.toString() +", " + this._image;
  }
  String getName(){
    return this._name;
  }

  String getMaison(){
    return this._maison;
  }
  Baguette getBaguette(){
    return this._baguette;
  }
  String getImage(){
    return this._image;
  }
  
}