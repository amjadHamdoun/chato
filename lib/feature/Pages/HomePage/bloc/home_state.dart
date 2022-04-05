



import 'package:built_value/built_value.dart';



part 'home_state.g.dart';


abstract class HomeState implements Built<HomeState, HomeStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
 int get selectedPage;



  HomeState._();

  factory HomeState([void Function(HomeStateBuilder) updates]) = _$HomeState;

  factory HomeState.initial() {
    return HomeState((b) => b
      ..isLoading = false
      ..isSuccess = false
        ..selectedPage=0

    );
  }
}


