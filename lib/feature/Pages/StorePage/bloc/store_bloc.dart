import 'package:bloc/bloc.dart';
import '../../../../Globals.dart';
import '../api/update_coins_remote.dart';
import '../model/update_coins_model.dart';
import 'store_event.dart';
import 'store_state.dart';


 class StoreBloc extends Bloc<StoreEvent, StoreState> {
  UpdateCoinsRemoteDataSource updateCoinsRemoteDataSource;

  StoreBloc({
   required this.updateCoinsRemoteDataSource,
   }) : super(StoreState.initial())
  {
    on<ChangePageEvent>((event, emit) =>
        emit(state.rebuild((b) => b
      ..selectedPage=event.pageNumber
     )
    ));


    on<ChangeProductEvent>((event, emit) =>
        emit(state.rebuild((b) => b
          ..quantity=event.quantity
            ..type=event.type
        )
        ));

    on<UpdateCoinsEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccess = false
        ..isLoading = true
        ..updateCoinsModel=UpdateCoinsModel(message: '',
            error_code: 0,status: false
        )
      ));
      final result = await updateCoinsRemoteDataSource.updateCoins(
        quantity: state.quantity,
        type: state.type
      );
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isSuccess = false
          ..isLoading = false
        ));
      }, (r) async {
        print('r');
        if(state.type=='coins')
          {
            Global.userCoins=(double.parse(Global.userCoins!)+
                double.parse(state.quantity)).toString();
          }
        else{
          Global.userCoins=(double.parse(Global.userDiamond!)+
              double.parse(state.quantity)).toString();
        }
        emit(state.rebuild((b) => b
          ..isSuccess = true
          ..isLoading = false
          ..updateCoinsModel = r
        ));
        emit(state.rebuild((b) => b
          ..isSuccess = true
          ..isLoading = false
          ..updateCoinsModel = UpdateCoinsModel(message: '',
              error_code: 0,status: false
          )
        ));

      });

    });




  }

  void onChangePageEvent(int pageNumber) {
    add(ChangePageEvent(pageNumber));
  }

  void onUpdateCoinsEvent() {
    add(UpdateCoinsEvent());
  }
  void onChangeProductEvent(String type,String quantity) {
    add(ChangeProductEvent(type: type,quantity: quantity));
  }

}