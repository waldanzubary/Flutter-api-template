import 'package:flutter/material.dart';
import 'http_service.dart';
import 'post_model.dart';


class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buku"),
      ),
      body: FutureBuilder<List<Post>>(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text("No posts available."),
            );
          } else {
            List<Post> posts = snapshot.data!;

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: 0.7, // Aspect ratio of each grid item
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                Post post = posts[index];
                return InkWell( // Wrap BookCard with InkWell for onTap behavior
                  onTap: () {
                    
                  },
                  child: BookCard(
                    title: post.title,
                    id: post.id,
                    coverUrl: post.cover,

                    // You can add more properties if needed
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String coverUrl; // URL for the book cover image
  final int id;

  const BookCard({Key? key, required this.title, required this.coverUrl, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                 style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
                id.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                 style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),


            
            ],),
            
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(2)),
                image: DecorationImage(
                  image: NetworkImage(coverUrl), // Use NetworkImage for URL images
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
