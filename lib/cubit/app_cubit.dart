import 'package:bloc/bloc.dart';
import 'package:tembelea_goma/cubit/app_cubit_state.dart';

class AppCubit extends Cubit<CubitStates>{
  AppCubit() : super(InitialState()){
    emit(WelcomeState());
  }
}
