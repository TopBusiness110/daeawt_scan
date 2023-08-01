import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/models/contact_us_model.dart';
import '../../../../core/remote/service_api.dart';
import '../../../../core/utils/appwidget.dart';
import '../contact_model.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit(this.api) : super(ContactUsInitial());
  ServiceApi api;
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  ContactUsModel contactUsModel = ContactUsModel();


  contactUs(BuildContext context) async {
    AppWidget.createProgressDialog(context, "Loading");
    final response = await api.postContactUs(ContactModel(message:messageController.text,
    phoneNumber: phoneNumberController.text,topic: topicController.text,
        userName: userNameController.text));
    response.fold(
          (failure) => {Navigator.pop(context), emit(ContactUsFailed())},
        (r){
          contactUsModel = r;
          if(contactUsModel.code==200){
            Navigator.pop(context);
            emit(ContactUsSuccess());
            Navigator.pushNamed(context, Routes.homeRoute);
          }
          else{
            Navigator.pop(context);
            emit(ContactUsFailed());
          }

        }
    );
  }
}
