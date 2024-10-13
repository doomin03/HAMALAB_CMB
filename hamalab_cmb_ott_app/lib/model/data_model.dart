class Video {
  final String title;
  final String imageUrl;


  Video({required this.title, required this.imageUrl});

  Video.fromMap(Map<String, dynamic> map)
      :
        title = map['title'],
        imageUrl = map['imageUrl'];


}

class Game {
  final String title;
  final String imageUrl;


  Game({required this.title, required this.imageUrl});

  Game.fromMap(Map<String, dynamic> map):
        title = map['title'],
        imageUrl = map['imageUrl'];

}

