import 'package:bloc/bloc.dart';
import 'package:daeawt_scan/core/remote/service_api.dart';
import 'package:meta/meta.dart';

import '../../../core/models/user_model.dart';
import '../../../core/preferences/preferences.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/assets_manager.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  SingleUserDataModel? userDataModel;
  HomeCubit(this.api) : super(HomeInitial()){
    getuserData();
  }
  ServiceApi api;
getuserData() async {

  userDataModel=await Preferences.instance.getUserModel();
  setdata(userDataModel!.invitationModel!);
}
  List<String> detailsIconsList = [ImageAssests.messagesIcon,ImageAssests.invitedIcon,
    ImageAssests.scannedIcon,ImageAssests.confirmedIcon,ImageAssests.apologiesIcon,
    ImageAssests.waitingIcon,ImageAssests.notSentIcon,ImageAssests.failedIcon];

  List<String> detailsLabels = [AppStrings.theMessage,AppStrings.invited,AppStrings.scanned,
    AppStrings.confirmation,AppStrings.apologies,AppStrings.wait,AppStrings.notSent,AppStrings.failed];
  List<String> detailsdata = [];
  void setdata(InvitationModel homeListItemModel) {

    detailsdata.clear();
    detailsdata.add(homeListItemModel.messages.toString());
    detailsdata.add(homeListItemModel.invitees.length.toString());
    detailsdata.add(homeListItemModel.scanned.toString());
    detailsdata.add(homeListItemModel.confirmed.toString());
    detailsdata.add(homeListItemModel.apologized.toString());
    detailsdata.add(homeListItemModel.waiting.toString());
    detailsdata.add(homeListItemModel.notSent.toString());
    detailsdata.add(homeListItemModel.failed.toString());
    emit(DetialsLoaded());

  }
}
