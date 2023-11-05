// import 'package:url_launcher/url_launcher.dart';

// class UrlLauncherUtil {
//   static launchPhone(String phone) async {
//     final phoneNumber = Uri.parse('tel:$phone');
//     if (await canLaunchUrl(phoneNumber)) {
//       await launchUrl(phoneNumber);
//     } else {
//       throw 'Could not launch $phoneNumber';
//     }
//   }

//   static launchSms(String phone) async {
//     final sms = Uri.parse('sms:$phone');
//     if (await canLaunchUrl(sms)) {
//       await launchUrl(sms);
//     } else {
//       throw 'Could not launch $sms';
//     }
//   }

//   static launchEmail(
//       {required String subject,
//       required String body,
//       required String reciever}) async {
//     final email = Uri(
//       scheme: 'mailto',
//       path: reciever,
//       query: 'subject=$subject&body=$body',
//     );
//     if (await canLaunchUrl(email)) {
//       launchUrl(email);
//     } else {
//       throw 'Could not launch $email';
//     }
//   }

//   static launchUrL(String url) async {
//     final url0 = Uri.parse(url);
//     if (await canLaunchUrl(url0)) {
//       await launchUrl(url0);
//     } else {
//       throw 'Could not launch $url0';
//     }
//   }
// }
