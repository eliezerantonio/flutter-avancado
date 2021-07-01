class Course {
  String id;
  String name;

  Course.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"];


        
}
