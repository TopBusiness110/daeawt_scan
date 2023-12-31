import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/user_model.dart';
import '../../../../core/remote/service_api.dart';



part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit( ) : super(MessagesInitial());
  bool isVisible = false;
  changeVisibility(){
    isVisible = !isVisible;
    emit(ChangingVisibilityState());
  }
  List<Invitees> invitees=[];
  List<Invitees> inviteess=[];
  void setdata(InvitationModel homeListItemModel) {
    inviteess.clear();
    invitees=homeListItemModel.inviteesMessages!;
    inviteess.addAll(homeListItemModel.inviteesMessages!);

    emit(MessageLoaded());
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
    emit(MessageLoaded());

  }
}
