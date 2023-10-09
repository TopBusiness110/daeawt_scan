import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/models/user_model.dart';


part 'appology_state.dart';

class AppologyCubit extends Cubit<AppologyState> {
  AppologyCubit() : super(AppologyInitial());
  List<Invitees> invitees=[];
  List<Invitees> inviteess=[];
  void setdata(InvitationModel homeListItemModel) {
    inviteess.clear();
    invitees=homeListItemModel.allApologized!;
    inviteess.addAll(homeListItemModel.allApologized!);

    emit(AppologyLoaded());
  }
  onSearchTextChanged(String text) async {
    invitees.clear();

    print("dlflfllf");
    print(inviteess.length);
    if(text.isEmpty){
     invitees.addAll(inviteess);
    }
    else{
    for (Invitees userDetail in inviteess) {
      print(text+"dddd");

      if (userDetail.name!.toLowerCase().contains(text.toLowerCase()))
        invitees.add(userDetail);
    }
    }
    emit(AppologyLoaded());

  }
}
