class Baguette{
  String _wood;
  String _core;
  String _lenght;

  Baguette(this._wood,this._core,this._lenght);

  bool estVide(){
    bool empty = false;
    if(this._core.isEmpty && this._lenght.isEmpty && this._wood.isEmpty){
      empty = true;
    }
    return empty;
  }
  @override
  String toString() {
    // TODO: implement toString
    return "Information sur sa baguette  de : " + this._wood + ", " + this._core + ", " + this._lenght.toString();
  }
}