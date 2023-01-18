

class DataController{
  static final DataController _data = DataController._internal();

  bool? clicked = false;


  factory DataController(){
    return _data;
  }

  DataController._internal(){

  }
}