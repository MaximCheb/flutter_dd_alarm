import 'package:flutter/material.dart';

import 'photo.dart';

class UtilsPhoto {

  Image? getImageFromUrl(String url){
    if(url.startsWith("spring://")){
      url.substring("spring://".length);
      print(url);
      return Image.asset(url);
    }
    return null;
  }

  ImageProvider? getImageFromPhoto(Photo photo){
    switch(photo.type){
      case "web":
        return NetworkImage(photo.url);
      case "asset":
        return AssetImage(photo.url);
      case "Spring":
        return AssetImage(photo.url.substring("Spring://".length));
        break;
    }

  }


}