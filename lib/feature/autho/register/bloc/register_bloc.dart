
import 'package:bloc/bloc.dart';
import 'package:chato/Preference.dart';
import '../../../../Globals.dart';
import '../api/register_remote.dart';
import '../model/register_data_model.dart';
import '../model/register_model.dart';
import 'register_event.dart';
import 'register_state.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterRemoteDataSource registerRemoteDataSource;

  RegisterBloc({
    required this.registerRemoteDataSource,
    }) : super(RegisterState.initial())
    {
    on<RegisterAccountEvent>((event, emit) async
    {
      emit(state.rebuild((b) => b
        ..isSuccess=false
        ..isLoading=true
        ..registerModel=RegisterModel(
            data: RegisterDataModel(
                email: '',
                name: '',
                id: 0,
                token: ''
            ),
            message: '',
            error_code: 0,
            status: false
        )
      )
      );
      final result = await registerRemoteDataSource.register(
          name: event.name,
        email: event.email,
        password: event.password,
        password_confirmation: event.passwordConfirm
      );
      print("result");
      print(result);
      print("result");

      return  result.fold((l) async {
         print('l');
         emit(state.rebuild((b) => b
           ..isSuccess=false
           ..isLoading=false
           ..error=l
         )
         );
      }, (r) async {
         print('r');
         if(r.data!=null)
           {
             if(r.data!.token!=null)
               {
                 Global.userToken=r.data!.token!;
                 Preferences.saveUserToken(r.data!.token!);
               }

           }

         emit(state.rebuild((b) => b
           ..isSuccess=true
           ..isLoading=false
           ..registerModel=r
         )
         );



      });

    }
        );


  }

  void onRegisterAccountEvent({required String name,
    required String email,required String password,
    required String passwordConfirm,}) {
    add(RegisterAccountEvent(
      name: name,
      password: password,
      email: email,
      passwordConfirm: passwordConfirm

    ));
  }
  void onChangePageEvent(int pageNumber) {
    add(ChangePageEvent(pageNumber));
  }



}