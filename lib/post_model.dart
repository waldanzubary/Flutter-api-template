// change with ur type data and variables on ur api


class Post {
  final int id;
  final String bookCode;
  final String title;
  final String cover;
 


  Post({
    required this.id,
    required this.bookCode,
    required this.title,
    required this.cover,

 
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      bookCode: json['book_code'],
      title: json['title'],
      cover: json['cover'],
      
    );
  }
}
