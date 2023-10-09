import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/user_model.dart';


part 'faild_state.dart';

class FaildCubit extends Cubit<FaildState> {
  FaildCubit() : super(FaildInitial());
  List<Invitees> invitees=[];
  List<Invitees> inviteess=[];
  void setdata(InvitationModel homeListItemModel) {
    inviteess.clear();
    invitees=homeListItemModel.allFailed!;
    inviteess.addAll(homeListItemModel.allFailed!);

    emit(FaildLoaded());
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
    emit(FaildLoaded());

  }
}
