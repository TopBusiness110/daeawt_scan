import 'package:bloc/bloc.dart';
import 'package:daeawt_scan/core/remote/service_api.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/assets_manager.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial());
  ServiceApi api;

  List<String> detailsIconsList = [ImageAssests.messagesIcon,ImageAssests.invitedIcon,
    ImageAssests.scannedIcon,ImageAssests.confirmedIcon,ImageAssests.apologiesIcon,
    ImageAssests.waitingIcon,ImageAssests.notSentIcon,ImageAssests.failedIcon];

  List<String> detailsLabels = [AppStrings.theMessage,AppStrings.invited,AppStrings.scanned,
    AppStrings.confirmation,AppStrings.apologies,AppStrings.wait,AppStrings.notSent,AppStrings.failed];
}
