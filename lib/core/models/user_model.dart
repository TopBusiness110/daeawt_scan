class UserDataModel {
  SingleUserDataModel data;
  String message;
  int code;

  UserDataModel({
    required this.data,
    required this.message,
    required this.code,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    data: SingleUserDataModel.fromJson(json["data"]),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "code": code,
  };
}

class SingleUserDataModel {
  UserModel? userModel;
  InvitationModel? invitationModel;

  SingleUserDataModel({
     this.userModel,
     this.invitationModel,
  });

  factory SingleUserDataModel.fromJson(Map<String, dynamic> json) => SingleUserDataModel(
    userModel: UserModel.fromJson(json["user-model"]),
    invitationModel: InvitationModel.fromJson(json["invitation-model"]),
  );

  Map<String, dynamic> toJson() => {
    "user-model": userModel!.toJson(),
    "invitation-model": invitationModel!.toJson(),
  };
}

class InvitationModel {
  int id;
  DateTime date;
  String title;
  String image;
  String hasQrcode;
  String qrcode;
  String sendDate;
  String address;
  String longitude;
  String latitude;
  String password;
  int userId;
  String status;
  int step;
  List<Invitee> invitees;
  List<Invitee> inviteesMessages;
  List<dynamic> allMessages;
  List<Invitee> allConfirmed;
  List<Invitee> allScanned;
  List<Invitee> allWaiting;
  List<Invitee> allApologized;
  List<Invitee> allFailed;
  List<Invitee> allNotSent;
  int messages;
  int inviteesCount;
  int scanned;
  int confirmed;
  int apologized;
  int waiting;
  int notSent;
  int failed;

  InvitationModel({
    required this.id,
    required this.date,
    required this.title,
    required this.image,
    required this.hasQrcode,
    required this.qrcode,
    required this.sendDate,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.password,
    required this.userId,
    required this.status,
    required this.step,
    required this.invitees,
    required this.inviteesMessages,
    required this.allMessages,
    required this.allConfirmed,
    required this.allScanned,
    required this.allWaiting,
    required this.allApologized,
    required this.allFailed,
    required this.allNotSent,
    required this.messages,
    required this.inviteesCount,
    required this.scanned,
    required this.confirmed,
    required this.apologized,
    required this.waiting,
    required this.notSent,
    required this.failed,
  });

  factory InvitationModel.fromJson(Map<String, dynamic> json) => InvitationModel(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    title: json["title"],
    image: json["image"],
    hasQrcode: json["has_qrcode"],
    qrcode: json["qrcode"],
    sendDate: json["send_date"],
    address: json["address"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    password: json["password"],
    userId: json["user_id"],
    status: json["status"],
    step: json["step"],
    invitees: List<Invitee>.from(json["invitees"].map((x) => Invitee.fromJson(x))),
    inviteesMessages: List<Invitee>.from(json["invitees_messages"].map((x) => Invitee.fromJson(x))),
    allMessages: List<Invitee>.from(json["all_messages"].map((x) => x)),
    allConfirmed: List<Invitee>.from(json["all_confirmed"].map((x) => x)),
    allScanned: List<Invitee>.from(json["all_scanned"].map((x) => x)),
    allWaiting: List<Invitee>.from(json["all_waiting"].map((x) => Invitee.fromJson(x))),
    allApologized: List<Invitee>.from(json["all_apologized"].map((x) => x)),
    allFailed: List<Invitee>.from(json["all_failed"].map((x) => x)),
    allNotSent: List<Invitee>.from(json["all_not_sent"].map((x) => x)),
    messages: json["messages"],
    inviteesCount: json["invitees_count"],
    scanned: json["scanned"],
    confirmed: json["confirmed"],
    apologized: json["apologized"],
    waiting: json["waiting"],
    notSent: json["not_sent"],
    failed: json["failed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "title": title,
    "image": image,
    "has_qrcode": hasQrcode,
    "qrcode": qrcode,
    "send_date": sendDate,
    "address": address,
    "longitude": longitude,
    "latitude": latitude,
    "password": password,
    "user_id": userId,
    "status": status,
    "step": step,
    "invitees": List<dynamic>.from(invitees.map((x) => x.toJson())),
    "invitees_messages": List<dynamic>.from(inviteesMessages.map((x) => x.toJson())),
    "all_messages": List<dynamic>.from(allMessages.map((x) => x)),
    "all_confirmed": List<dynamic>.from(allConfirmed.map((x) => x)),
    "all_scanned": List<dynamic>.from(allScanned.map((x) => x)),
    "all_waiting": List<dynamic>.from(allWaiting.map((x) => x.toJson())),
    "all_apologized": List<dynamic>.from(allApologized.map((x) => x)),
    "all_failed": List<dynamic>.from(allFailed.map((x) => x)),
    "all_not_sent": List<dynamic>.from(allNotSent.map((x) => x)),
    "messages": messages,
    "invitees_count": inviteesCount,
    "scanned": scanned,
    "confirmed": confirmed,
    "apologized": apologized,
    "waiting": waiting,
    "not_sent": notSent,
    "failed": failed,
  };
}

class Invitee {
  int id;
  int invitationId;
  String name;
  dynamic email;
  String phone;
  int inviteesNumber;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  List<Message>? messages;

  Invitee({
    required this.id,
    required this.invitationId,
    required this.name,
    this.email,
    required this.phone,
    required this.inviteesNumber,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.messages,
  });

  factory Invitee.fromJson(Map<String, dynamic> json) => Invitee(
    id: json["id"],
    invitationId: json["invitation_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    inviteesNumber: json["invitees_number"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    messages: json["messages"] == null ? [] : List<Message>.from(json["messages"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "invitation_id": invitationId,
    "name": name,
    "email": email,
    "phone": phone,
    "invitees_number": inviteesNumber,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x)),
  };
}

class UserModel {
  User user;
  String accessToken;
  String tokenType;

  UserModel({
    required this.user,
    required this.accessToken,
    required this.tokenType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    user: User.fromJson(json["user"]),
    accessToken: json["access_token"],
    tokenType: json["token_type"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "access_token": accessToken,
    "token_type": tokenType,
  };
}

class User {
  int id;
  String name;
  String phone;
  String email;
  int status;
  dynamic userType;
  String watts;
  String image;
  String address;
  dynamic aboutMe;
  int balance;
  dynamic city;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.status,
    this.userType,
    required this.watts,
    required this.image,
    required this.address,
    this.aboutMe,
    required this.balance,
    this.city,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    status: json["status"],
    userType: json["user_type"],
    watts: json["watts"],
    image: json["image"],
    address: json["address"],
    aboutMe: json["about_me"],
    balance: json["balance"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "status": status,
    "user_type": userType,
    "watts": watts,
    "image": image,
    "address": address,
    "about_me": aboutMe,
    "balance": balance,
    "city": city,
  };
}
class Message {
  int id;
  int invitationId;
  int inviteeId;
  String title;
  String message;
  DateTime createdAt;
  DateTime updatedAt;

  Message({
    required this.id,
    required this.invitationId,
    required this.inviteeId,
    required this.title,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    invitationId: json["invitation_id"],
    inviteeId: json["invitee_id"],
    title: json["title"],
    message: json["message"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "invitation_id": invitationId,
    "invitee_id": inviteeId,
    "title": title,
    "message": message,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
