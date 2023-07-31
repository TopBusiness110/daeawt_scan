import 'package:bloc/bloc.dart';
import 'package:daeawt_scan/core/remote/service_api.dart';
import 'package:meta/meta.dart';

import '../../../core/models/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.api) : super(ProfileInitial());
  ServiceApi api;
  UserModel? userModel;
  String englishSymbol = "En";
  String arabicSymbol = "ع";
  bool isEnglish = true;
}
