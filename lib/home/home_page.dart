import 'package:books_app/blocs/home_bloc.dart';
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 42, left: 20),
          child: Column(
            children: [textTitle(), streamBuilderIndexChip(context)],
          ),
        ));
  }

  Row textTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Browse",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 24,
        ),
        Text(
          "Recomended",
          style: TextStyle(
              fontSize: 14,
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
      height: 80,
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
