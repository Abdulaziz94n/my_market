// import '/core/constants/sizes.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart';

// const _phoneNumber = '+90 534 222 22 22';
// const _headers = ['Services', 'Date', 'Cost'];
// const _companyName = 'company name';
// const _websiteUrl = 'www.example.com';
// const _websiteText = 'CompanyName.com';
// const _address = 'Address: Address goes here';

// MultiPage generatePdf() {
//   return MultiPage(
//     margin: EdgeInsets.zero.copyWith(left: 6, right: 6),
//     pageFormat: PdfPageFormat.a4,
//     footer: (context) => _footer,
//     // header: (context) => Center(
//     //   child: Padding(
//     //       padding: const EdgeInsets.symmetric(vertical: Sizes.p16),
//     //       child: Image(height: 100, width: 100, MemoryImage(_logo))),
//     // ),
//     build: (context) {
//       return [
//         Padding(padding: const EdgeInsets.symmetric(vertical: Sizes.p16)),
//         Table.fromTextArray(
//           headers: _headers,
//           headerStyle: TextStyle(fontWeight: FontWeight.bold),
//           columnWidths: {
//             // 0:  FixedColumnWidth(125),
//           },
//           data: [],
//           cellAlignment: Alignment.center,
//         ),
//       ];
//     },
//   );
// }

// final _footer = Align(
//   alignment: Alignment.center,
//   child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//     RichText(
//       textAlign: TextAlign.center,
//       text: const TextSpan(children: [
//         TextSpan(text: '$_companyName\n'),
//         TextSpan(text: _address),
//       ]),
//     ),
//     UrlLink(
//         child: Text(
//           _websiteText,
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               decoration: TextDecoration.underline),
//         ),
//         destination: _websiteUrl),
//     Text('Phone Number : $_phoneNumber'),
//   ]),
// );
