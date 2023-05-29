class ApiConstants {
  static const String baseUrl = 'http://192.168.1.180:3000/';

  //User
  static const String loginEndpoint = 'User/login';
  static const String loginPhoneEndpoint = 'User/loginPhone';
  static const String sendOtpEndpoint = 'User/sendOtp';
  static const String verifOtpEndpoint = 'User/VerifOtp';
  static const String updatePasswordEndpoint = 'User/updatePassword/';
  static const String updateUser = 'User/Update/';


  //Task
  static const String findTasksEndpoint = 'Task/find/';
  static const String findArchiveTasksEndpoint = 'Task/findArchive/';
  static const String StartFixTaskEndpoint = 'Task/update/';
  static const String FixTaskEndpoint = 'Task/fix/';
  static const String ArchiveTaskEndpoint = 'Task/archive/';
  static const String DeleteArchiveTaskEndpoint = 'Task/delete/';
  static const String downloadAttachmentEndpoint = 'Task/downloadAttachment/';





// Define other endpoints here
}