import 'package:books_app/models/models.dart';
import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final String imageUrl =
      "https://static.toiimg.com/thumb/72975551.cms?width=680&height=512&imgsize=881753";
  final Book book;

  BookWidget({Key key, @required this.book})
      : assert(book != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 12, 16, 12),
      width: 200,
      height: 250,
      child: Stack(
        children: [
          Align(
            child: image(),
            alignment: Alignment.centerRight,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: descriptionCard(),
          )
        ],
      ),
    );
  }

  Container descriptionCard() {
    return Container(
      width: 230,
      height: 200,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 15)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            book.volumeInfo.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            maxLines: 3,
          ),
          Text(
            book.volumeInfo?.authors.toString(),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey),
            maxLines: 2,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Container image() {
    return Container(
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 0.7, color: Colors.black12),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(book.volumeInfo.imageLinks.smallThumbnail),
          )),
    );
  }
}
