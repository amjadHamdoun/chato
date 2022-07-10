



import 'package:built_value/built_value.dart';

import '../model/update_coins_model.dart';



part 'store_state.g.dart';


abstract class StoreState implements Built<StoreState, StoreStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
   int get selectedPage;
  UpdateCoinsModel get updateCoinsModel;
  String get type;
  String get quantity;

  StoreState._();

  factory StoreState([void Function(StoreStateBuilder) updates]) = _$StoreState;

  factory StoreState.initial() {
    return StoreState((b) => b
      ..isLoading = false
      ..isSuccess = false
        ..selectedPage = 0
      ..type=''
      ..quantity=''
        ..updateCoinsModel=UpdateCoinsModel(message: '',
        error_code: 0,status: false
        )

    );
  }
}


