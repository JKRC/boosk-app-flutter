import 'package:bloc/bloc.dart';
import 'package:books_app/home/bloc/home_page_event.dart';
import 'package:books_app/home/bloc/home_page_state.dart';
import 'package:books_app/repository.dart';
import 'package:flutter/cupertino.dart';


class HomePageBloc extends Bloc<HomePageEvent, HomePageState>{

  final Repository repository;
  HomePageBloc({@required this.repository});

  @override
  // TODO: implement initialState
  HomePageState get initialState => HomePageStateLoading();

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async*{
    if(event is HomePageEventSearch){
      yield HomePageStateLoading();
      var query = event.query;
      var books = await repository.getBooks(query);
      if(books != null){
        yield HomePageStateSuccess(books: books);
      }
      else{
        yield HomePageStateError(message: "Internet Error");
      }

    }
  }
  

}