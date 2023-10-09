class UserDataModel{
  SingleUserDataModel? data;
String? message;
int? code;

  UserDataModel({this.data, this.message, this.code});

  UserDataModel.fromJson(Map<String, dynamic> json) {
data = json['data'] != null ? new SingleUserDataModel.fromJson(json['data']) : null;
message = json['message'];
code = json['code'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
if (this.data != null) {
data['data'] = this.data!.toJson();
}
data['message'] = this.message;
data['code'] = this.code;
return data;
}
}

class SingleUserDataModel {
UserModel? userModel;
InvitationModel? invitationModel;

SingleUserDataModel({this.userModel, this.invitationModel});

SingleUserDataModel.fromJson(Map<String, dynamic> json) {
userModel = json['user-model'] != null
? new UserModel.fromJson(json['user-model'])
    : null;
invitationModel = json['invitation-model'] != null
? new InvitationModel.fromJson(json['invitation-model'])
    : null;
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
if (this.userModel != null) {
data['user-model'] = this.userModel!.toJson();
}
if (this.invitationModel != null) {
data['invitation-model'] = this.invitationModel!.toJson();
}
return data;
}
}

class UserModel {
User? user;
String? accessToken;
String? tokenType;

UserModel({this.user, this.accessToken, this.tokenType});

UserModel.fromJson(Map<String, dynamic> json) {
user = json['user'] != null ? new User.fromJson(json['user']) : null;
accessToken = json['access_token'];
tokenType = json['token_type'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
if (this.user != null) {
data['user'] = this.user!.toJson();
}
data['access_token'] = this.accessToken;
data['token_type'] = this.tokenType;
return data;
}
}

class User {
int? id;
String? name;
String? phone;
String? email;
int? status;
String? userType;
String? watts;
String? image;
String? address;
String? aboutMe;
int? balance;
String? city;

User(
{this.id,
this.name,
this.phone,
this.email,
this.status,
this.userType,
this.watts,
this.image,
this.address,
this.aboutMe,
this.balance,
this.city});

User.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
phone = json['phone'];
email = json['email'];
status = json['status'];
userType = json['user_type'];
watts = json['watts'];
image = json['image'];
address = json['address'];
aboutMe = json['about_me'];
balance = json['balance'];
city = json['city'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['name'] = this.name;
data['phone'] = this.phone;
data['email'] = this.email;
data['status'] = this.status;
data['user_type'] = this.userType;
data['watts'] = this.watts;
data['image'] = this.image;
data['address'] = this.address;
data['about_me'] = this.aboutMe;
data['balance'] = this.balance;
data['city'] = this.city;
return data;
}
}

class InvitationModel {
int? id;
String? date;
String? title;
String? image;
String? hasQrcode;
String? qrcode;
String? sendDate;
String? address;
String? longitude;
String? latitude;
String? password;
int? userId;
String? status;
int? step;
List<Invitees>? invitees;
List<Invitees>? inviteesMessages;
List<AllMessages>? allMessages;
List<Invitees>? allConfirmed;
List<Invitees>? allScanned;
List<Invitees>? allWaiting;
List<Invitees>? allApologized;
List<Invitees>? allFailed;
List<Invitees>? allNotSent;
int? messages;
int? inviteesCount;
int? scanned;
int? confirmed;
int? apologized;
String? shareLink;
int? waiting;
int? notSent;
int? failed;

InvitationModel(
{this.id,
this.date,
this.title,
this.image,
this.hasQrcode,
this.qrcode,
this.sendDate,
this.address,
this.longitude,
this.latitude,
this.password,
this.userId,
this.status,
this.step,
this.invitees,
this.inviteesMessages,
this.allMessages,
this.allConfirmed,
this.allScanned,
this.allWaiting,
this.allApologized,
this.allFailed,
this.allNotSent,
this.messages,
this.inviteesCount,
this.scanned,
this.confirmed,
this.apologized,
this.shareLink,
this.waiting,
this.notSent,
this.failed});

InvitationModel.fromJson(Map<String, dynamic> json) {
id = json['id'];
date = json['date'];
title = json['title'];
image = json['image'];
hasQrcode = json['has_qrcode'];
qrcode = json['qrcode'];
sendDate = json['send_date'];
address = json['address'];
longitude = json['longitude'];
latitude = json['latitude'];
password = json['password'];
userId = json['user_id'];
status = json['status'];
step = json['step'];
if (json['invitees'] != null) {
invitees = <Invitees>[];
json['invitees'].forEach((v) {
invitees!.add(new Invitees.fromJson(v));
});
}
if (json['invitees_messages'] != null) {
inviteesMessages = <Invitees>[];
json['invitees_messages'].forEach((v) {
inviteesMessages!.add(new Invitees.fromJson(v));
});
}
if (json['all_messages'] != null) {
allMessages = <AllMessages>[];
json['all_messages'].forEach((v) {
allMessages!.add(new AllMessages.fromJson(v));
});
}
if (json['all_confirmed'] != null) {
allConfirmed = <Invitees>[];
json['all_confirmed'].forEach((v) {
allConfirmed!.add(new Invitees.fromJson(v));
});
}
if (json['all_scanned'] != null) {
allScanned = <Invitees>[];
json['all_scanned'].forEach((v) {
allScanned!.add(new Invitees.fromJson(v));
});
}
if (json['all_waiting'] != null) {
allWaiting = <Invitees>[];
json['all_waiting'].forEach((v) {
allWaiting!.add(new Invitees.fromJson(v));
});
}
if (json['all_apologized'] != null) {
allApologized = <Invitees>[];
json['all_apologized'].forEach((v) {
allApologized!.add(new Invitees.fromJson(v));
});
}
if (json['all_failed'] != null) {
allFailed = <Invitees>[];
json['all_failed'].forEach((v) {
allFailed!.add(new Invitees.fromJson(v));
});
}
if (json['all_not_sent'] != null) {
allNotSent = <Invitees>[];
json['all_not_sent'].forEach((v) {
allNotSent!.add(new Invitees.fromJson(v));
});
}
messages = json['messages'];
inviteesCount = json['invitees_count'];
scanned = json['scanned'];
confirmed = json['confirmed'];
apologized = json['apologized'];
shareLink = json['share_link'];
waiting = json['waiting'];
notSent = json['not_sent'];
failed = json['failed'];
}


Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['date'] = this.date;
data['title'] = this.title;
data['image'] = this.image;
data['has_qrcode'] = this.hasQrcode;
data['qrcode'] = this.qrcode;
data['send_date'] = this.sendDate;
data['address'] = this.address;
data['longitude'] = this.longitude;
data['latitude'] = this.latitude;
data['password'] = this.password;
data['user_id'] = this.userId;
data['status'] = this.status;
data['step'] = this.step;
if (this.invitees != null) {
data['invitees'] = this.invitees!.map((v) => v.toJson()).toList();
}
if (this.inviteesMessages != null) {
data['invitees_messages'] =
this.inviteesMessages!.map((v) => v.toJson()).toList();
}
if (this.allMessages != null) {
data['all_messages'] = this.allMessages!.map((v) => v.toJson()).toList();
}
if (this.allConfirmed != null) {
data['all_confirmed'] =
this.allConfirmed!.map((v) => v.toJson()).toList();
}
if (this.allScanned != null) {
data['all_scanned'] = this.allScanned!.map((v) => v.toJson()).toList();
}
if (this.allWaiting != null) {
data['all_waiting'] = this.allWaiting!.map((v) => v.toJson()).toList();
}
if (this.allApologized != null) {
data['all_apologized'] =
this.allApologized!.map((v) => v.toJson()).toList();
}
if (this.allFailed != null) {
data['all_failed'] = this.allFailed!.map((v) => v.toJson()).toList();
}
if (this.allNotSent != null) {
data['all_not_sent'] = this.allNotSent!.map((v) => v.toJson()).toList();
}
data['messages'] = this.messages;
data['invitees_count'] = this.inviteesCount;
data['scanned'] = this.scanned;
data['confirmed'] = this.confirmed;
data['apologized'] = this.apologized;
data['share_link'] = this.shareLink;
data['waiting'] = this.waiting;
data['not_sent'] = this.notSent;
data['failed'] = this.failed;
return data;
}
}

class Invitees {
int? id;
int? invitationId;
String? name;
String? email;
String? phone;
int? inviteesNumber;
int? status;
String? createdAt;
String? updatedAt;
List<AllMessages>? messages;
Invitees(
{this.id,
this.invitationId,
this.name,
this.email,
this.phone,
this.inviteesNumber,
this.status,
this.createdAt,
this.updatedAt});

Invitees.fromJson(Map<String, dynamic> json) {
id = json['id'];
invitationId = json['invitation_id'];
name = json['name'];
email = json['email'];
phone = json['phone'];
inviteesNumber = json['invitees_number'];
status = json['status'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
if (json['all_messages'] != null) {
  messages = <AllMessages>[];
  json['all_messages'].forEach((v) {
    messages!.add(new AllMessages.fromJson(v));
  });
}
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['invitation_id'] = this.invitationId;
data['name'] = this.name;
data['email'] = this.email;
data['phone'] = this.phone;
data['invitees_number'] = this.inviteesNumber;
data['status'] = this.status;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
if (this.messages != null) {
  data['all_messages'] = this.messages!.map((v) => v.toJson()).toList();
}
return data;
}
}

class AllMessages {
  int? id;
  int? invitationId;
  int? inviteeId;
  String? title;
  String? message;
  String? createdAt;
  String? updatedAt;

  AllMessages({this.id,
    this.invitationId,
    this.inviteeId,
    this.title,
    this.message,
    this.createdAt,
    this.updatedAt});

  AllMessages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invitationId = json['invitation_id'];
    inviteeId = json['invitee_id'];
    title = json['title'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['invitation_id'] = this.invitationId;
    data['invitee_id'] = this.inviteeId;
    data['title'] = this.title;
    data['message'] = this.message;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}