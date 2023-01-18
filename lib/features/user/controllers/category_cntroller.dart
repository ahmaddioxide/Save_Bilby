

class ImageController{
  static final ImageController _data = ImageController._internal();

  bool? imageleft = true;

  factory ImageController(){
    return _data;
  }

  ImageController._internal(){

  }
}