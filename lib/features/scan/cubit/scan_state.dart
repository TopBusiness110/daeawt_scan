part of 'scan_cubit.dart';

@immutable
abstract class ScanState {}

class ScanInitial extends ScanState {}
class UserLoaded extends ScanState {}
class LoginLoaded extends ScanState {}
class LoginFailure extends ScanState {}
class OnLoginVaildFaild extends ScanState {}
class OnLoginVaild extends ScanState {}
