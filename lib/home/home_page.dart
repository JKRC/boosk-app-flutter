import 'package:books_app/blocs/home_bloc.dart';
import 'package:books_app/home/bloc/home_page_event.dart';
import 'package:books_app/home/widgets/book.dart';
import 'package:books_app/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_page_bloc.dart';
import 'bloc/home_page_state.dart';

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
  final HomePageBloc _bloc = HomePageBloc(repository: Repository());

  @override
  Widget build(BuildContext context) {
    _bloc.dispatch(HomePageEventSearch(query: categories[0]));
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 42, left: 20),
          child: Column(
            children: [
              textTitle(),
              streamBuilderIndexChip(context),
              BlocBuilder(
                bloc: _bloc,
                builder: (context, state) {
                  if (state is HomePageStateLoading)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  if (state is HomePageStateError)
                    return Center(
                      child: Text(
                        state.message,
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    );
                  if (state is HomePageStateSuccess) {
                    final books = state.books;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: books.length,
                          itemBuilder: (context, index) {
                            final book = books[index];
                            return BookWidget(book: book,);
                          }),
                    );
                  }
                  return SizedBox.shrink();
                },
              )
            ],
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
            onTap: () => _onCategorySelected(index),
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

  _onCategorySelected(int index) {
    _homeBloc.setIndex(index);
    _bloc.dispatch(HomePageEventSearch(query: categories[index]));
  }
}
