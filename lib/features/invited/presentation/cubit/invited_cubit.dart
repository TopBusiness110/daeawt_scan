import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/user_model.dart';


part 'invited_state.dart';

class InvitedCubit extends Cubit<InvitedState> {
  InvitedCubit() : super(InvitedInitial());
  List<Invitees> invitees=[];
  List<Invitees> inviteess=[];
  void setdata(InvitationModel homeListItemModel) {
    inviteess.clear();
    invitees=homeListItemModel.invitees!;
    inviteess.addAll(homeListItemModel.invitees!);

    emit(InvitedLoaded());
  }
  onSearchTextChanged(String text) async {
    invitees.clear();
    emit(InvitedLoaded());

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
    emit(InvitedLoaded());

  }

}
