import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/user_model.dart';


part 'scanned_state.dart';

class ScannedCubit extends Cubit<ScannedState> {
  ScannedCubit() : super(ScannedInitial());
  List<Invitees> invitees=[];
  List<Invitees> inviteess=[];
  void setdata(InvitationModel homeListItemModel) {
    inviteess.clear();
    invitees=homeListItemModel.allScanned!;
    inviteess.addAll(homeListItemModel.allScanned!);

    emit(ScannedLoaded());
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
    emit(ScannedLoaded());

  }
}
