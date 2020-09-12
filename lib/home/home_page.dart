import 'package:books_app/blocs/home_bloc.dart';
import 'package:books_app/home/widgets/book.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> categories = [
    "Android",
    "Java",
    "Dart",
    "Javascript",
    "Kotlin",
    "PHP"
  ];

  final HomeBloc _homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 42, left: 20),
            child: Column(
              children: [
                textTitle(),
                streamBuilderIndexChip(context),
                ListView.builder(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                    itemBuilder: (context, index){
                      return BookWidget();
                    }
                )
              ],
            ),
          ),
        ));
  }

  Row textTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Browse",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 24,
        ),
        Text(
          "Recomended",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400]),
        )
      ],
    );
  }

  //code of list chips
  Container streamBuilderIndexChip(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20),
      height: 40,
      child: StreamBuilder<int>(
        stream: _homeBloc.streamIndex,
        builder: (context, snapshot) {
          return listChips(snapshot.data);
        },
      ),
    );
  }

  ListView listChips(selectedChip) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: GestureDetector(
            onTap: () {
              _homeBloc.setIndex(index);
            },
            child: Chip(
              padding: EdgeInsets.symmetric(horizontal: 8),
              backgroundColor:
                  index == selectedChip ? Colors.blue : Colors.grey[300],
              label: Text(
                categories.elementAt(index),
                style: TextStyle(
                    color: index == selectedChip
                        ? Colors.white70
                        : Colors.grey[500]),
              ),
            ),
          ),
        );
      },
    );
  }
}
