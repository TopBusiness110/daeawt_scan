import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/models/user_model.dart';


part 'confirmed_state.dart';

class ConfirmedCubit extends Cubit<ConfirmedState> {
  ConfirmedCubit() : super(ConfirmedInitial());
  List<Invitee> invitees=[];
  List<Invitee> inviteess=[];
  void setdata(InvitationModel homeListItemModel) {
    inviteess.clear();
    invitees=homeListItemModel.allConfirmed;
    inviteess.addAll(homeListItemModel.allConfirmed);

    emit(ConfirmedLoaded());
  }
  onSearchTextChanged(String text) async {
    invitees.clear();

    print("dlflfllf");
    print(inviteess.length);
    if(text.isEmpty){
      invitees.addAll(inviteess);
    }
    else{
      for (Invitee userDetail in inviteess) {
        print(text+"dddd");

        if (userDetail.name.toLowerCase().contains(text.toLowerCase()))
          invitees.add(userDetail);
      }
    }
    emit(ConfirmedLoaded());

  }
}
