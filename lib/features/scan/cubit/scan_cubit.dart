import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/models/user_model.dart';
import '../../../core/preferences/preferences.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  SingleUserDataModel? userDataModel;

  ScanCubit() : super(ScanInitial()){
    getuserData();  }
  getuserData() async {

    userDataModel=await Preferences.instance.getUserModel();
    emit(UserLoaded());
  }

}
