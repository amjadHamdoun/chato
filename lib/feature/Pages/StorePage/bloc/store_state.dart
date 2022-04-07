



import 'package:built_value/built_value.dart';



part 'store_state.g.dart';


abstract class StoreState implements Built<StoreState, StoreStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
 int get selectedPage;



  StoreState._();

  factory StoreState([void Function(StoreStateBuilder) updates]) = _$StoreState;

  factory StoreState.initial() {
    return StoreState((b) => b
      ..isLoading = false
      ..isSuccess = false
        ..selectedPage=0

    );
  }
}


