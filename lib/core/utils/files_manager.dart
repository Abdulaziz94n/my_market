// import 'dart:io';

// import 'dart:convert';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/widgets.dart';
// import 'package:universal_html/html.dart' as html;

// import 'package:open_filex/open_filex.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/widgets.dart';

class FilesManager {
  // Future<void> saveAndOpenPdf(Document pdf, String fileName) async {
  //   try {
  //     final doc = await pdf.save();
  //     final dir = await getTemporaryDirectory();
  //     final file = File('${dir.path}/$fileName.pdf');
  //     final generatedPDF = await file.writeAsBytes(doc);
  //     await OpenFilex.open(generatedPDF.path);
  //   } catch (e) {
  //     // TODO;
  //   }
  // }

//   Future<File?> selectPDFFile() async {
//     try {
//       File? file;
//       final result = await FilePicker.platform.pickFiles(
//           allowMultiple: false,
//           type: FileType.custom,
//           allowedExtensions: ['pdf']);
//       if (result == null) return null;

//       final path = result.files.single.path;
//       file = File(path!);
//       return file;
//     } catch (e) {
//       return null;
//     }
//   }

//   Future<File?> selectFile() async {
//     try {
//       File? file;
//       final result = await FilePicker.platform.pickFiles(
//         allowMultiple: false,
//         type: FileType.any,
//       );
//       if (result == null) return null;

//       final path = result.files.single.path;
//       file = File(path!);
//       return file;
//     } catch (e) {
//       return null;
//     }
//   }

//   Future<PlatformFile?> selectPlatFormFile() async {
//     try {
//       PlatformFile? file;
//       final result = await FilePicker.platform.pickFiles(
//         allowMultiple: false,
//         type: FileType.any,
//       );
//       if (result == null) return null;
//       file = result.files.single;
//       return file;
//     } catch (e) {
//       // TODO: feedback
//       return null;
//     }
//   }

//   Future<File?> pickCameraImage() async {
//     try {
//       File? cameraImage;
//       final image = await ImagePicker().pickImage(source: ImageSource.camera);
//       if (image == null) return null;
//       final selectedImage = File(image.path);
//       cameraImage = selectedImage;
//       return cameraImage;
//     } on PlatformException {
//       return null;
//     }
//   }

//   Future<File?> pickGalleryImage() async {
//     try {
//       File? cameraImage;
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return null;
//       final selectedImage = File(image.path);
//       cameraImage = selectedImage;
//       return cameraImage;
//     } on PlatformException {
//       return null;
//     }
//   }

//   Future openFile({
//     required File? file,
//   }) async {
//     if (file == null) return;
//     OpenFilex.open(file.path);
//   }

//   Future<void> downloadFile(
//       {bool permenant = false, required File file}) async {
//     // TODO: Need work
//     final dir = permenant
//         ? getApplicationDocumentsDirectory()
//         : getTemporaryDirectory();
//     // File downloadedFile = File(file.path);
//   }

//   Future<void> saveAndLaunchPdfWeb(Document pdf, String fileName) async {
//     final bytes = await pdf.save();
//     html.AnchorElement(
//         href:
//             "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
//       ..setAttribute('download', '$fileName.pdf')
//       ..click();
//   }

//   Future<void> saveAndLaunchFileWeb(List<int> bytes, String fileName) async {
//     html.AnchorElement(
//         href:
//             "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
//       ..setAttribute("download", fileName)
//       ..click();
//   }

//   Future<void> saveAndViewPdfWeb(Document pdf, String fileName) async {
//     final bytes = await pdf.save();
//     final blob = html.Blob([bytes], 'application/pdf');
//     final url = html.Url.createObjectUrlFromBlob(blob);
//     html.window.open(url, "_blank");
//     html.Url.revokeObjectUrl(url);
//   }

//   void saveAndViewFileWeb(List<int> bytes, String fileName) {
//     final blob = html.Blob([bytes], 'application/pdf');
//     final url = html.Url.createObjectUrlFromBlob(blob);
//     html.window.open(url, "_blank");
//     html.Url.revokeObjectUrl(url);
//   }

  // Future downoadAndOpenFile(
  //     {required String url,
  //     required String? fileName,
  //     required BuildContext context}) async {
  //   final file = await downloadFile(url, fileName!, context);
  //   if (file == null) return;
  //   OpenFilex.open(file.path);
  // }

  // Future<File?> downloadFile(
  //     String url, String name, BuildContext context) async {
  //   final appStorage = await getApplicationDocumentsDirectory();
  //   final file = File('${appStorage.path}/$name');
  //   try {
  //     final response = await Dio().get(
  //       url,
  //       options: Options(
  //         responseType: ResponseType.bytes,
  //         followRedirects: false,
  //         receiveTimeout: 0,
  //       ),
  //     );
  //     final ref = file.openSync(mode: FileMode.write);
  //     ref.writeFromSync(response.data);
  //     await ref.close();
  //     return file;
  //   } catch (e) {
  //     return null;
  //   }
  // }
}
