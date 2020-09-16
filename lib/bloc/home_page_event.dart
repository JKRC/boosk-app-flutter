import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
class HomePageEvent extends Equatable{
  HomePageEvent([List tmp = const []]): super(tmp);
}

class HomePageEventSearch extends HomePageEvent{
  final String query;
  final int index;

  HomePageEventSearch({
    @required this.query,
    @required this.index
  });

  @override
  String toString() {
    return "HomePageEventSearch";
  }
}