import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final String imageUrl =
      "https://static.toiimg.com/thumb/72975551.cms?width=680&height=512&imgsize=881753";

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
            "Book Title",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "Book author",
            style: TextStyle(color: Colors.grey),
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

  ClipRRect image() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: Image.network(
        imageUrl,
        fit: BoxFit.fill,
        width: 200,
        height: 250,
      ),
    );
  }
}
