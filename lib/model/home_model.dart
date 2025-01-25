class HomeModel {
  String? emoji;
  String? title;
  List<Map<String, dynamic>>? tasks;

  HomeModel({this.emoji, this.tasks, this.title});

  Map<String, dynamic> toMap() {
    return {"emoji": emoji, "title": title, "tasks": tasks};
  }
}

