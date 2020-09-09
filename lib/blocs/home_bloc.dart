

import 'dart:async';

class HomeBloc{

  HomeBloc(){
    _indexController.sink.add(index);
  }

  int index = 0;
  StreamController<int> _indexController = StreamController<int>();
  StreamSink get sinkIndex => _indexController.sink;
  Stream get streamIndex => _indexController.stream;

  setIndex(int index){
    this.index = index;
    sinkIndex.add(index);
  }

  dispose(){
    _indexController.close();
  }
}