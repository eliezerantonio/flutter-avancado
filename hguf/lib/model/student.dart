class Student {

  
  String name;
  String genre;
  String courseId;

  Student.fromMap(Map<String, dynamic> map)
      : name = map["name"],
        genre = map["genre"],
        courseId = map["course"];
}
