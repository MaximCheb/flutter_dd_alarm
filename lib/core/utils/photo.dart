class Photo {
  final String url;
  final String name;
  final String type;
  Photo({required this.name, required this.url, required this.type});

  @override
  String toString() {
    // TODO: implement toString
    return "url = "+url+
    "\n name photo = "+ name+
    "\n type = "+type ;
  }
}