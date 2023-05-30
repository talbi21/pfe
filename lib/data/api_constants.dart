class ApiConstants {
  static const String baseUrl = 'http://192.168.1.112:3000/';

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
  static const String startFixTaskEndpoint = 'Task/update/';
  static const String fixTaskEndpoint = 'Task/fix/';
  static const String archiveTaskEndpoint = 'Task/archive/';
  static const String deleteArchiveTaskEndpoint = 'Task/delete/';
  static const String downloadAttachmentEndpoint = 'Task/downloadAttachment/';

// Define other endpoints here
}
