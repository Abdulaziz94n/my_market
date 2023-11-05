import '/core/exceptions/app_exceptions.dart';

extension StringExtension on String {
  String get capFirst => isEmpty ? this : this[0].toUpperCase() + substring(1);

  String get capEach =>
      isEmpty ? this : split(' ').map((e) => e.capFirst).join(' ');

  String get trimAndLower => trim().toLowerCase();

  String get hardCoded => this;

  String get removeNumsFromString => replaceAll(RegExp(r'[-.,0-9 ]'), '');

  int get getNumsFromString => int.tryParse(replaceAll(RegExp(r'[^0-9]'), ''))!;

  String get getFirstWord => split(' ')[0];

  String get pathFromString {
    final parts = split(' ');
    final path = parts.firstWhere(
      (part) => part.contains('/') || part.contains(r'\'),
      orElse: () => '',
    );
    return path;
  }

  String get textBeforePath {
    final parts = split(' ');
    final pathIndex = parts.indexOf(parts.firstWhere(
        (part) => part.contains('/') || part.contains(r'\'),
        orElse: () => throw CustomException(message: 'No Path Found')));
    return parts.sublist(0, pathIndex).join(' ').trim();
  }

  String get textAfterPath {
    final parts = split(' ');
    final pathIndex = parts.indexOf(parts.firstWhere(
        (part) => part.contains('/') || part.contains(r'\'),
        orElse: () => throw CustomException(message: 'No Path Found')));
    return parts.sublist(pathIndex + 1).join(' ').trim();
  }

  // TODO: MAKE STRING TRANSLATION EXTENSION
  // String get trCapEach => tr.capFirstOfEach;
  // String get trCapFirst => tr.capFirst;

  // check isCurrency need modifiy to my needs
  // static bool isCurrency(String s) => hasMatch(s,
  //   r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R\$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]+)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$');
}

extension ImagePath on String {
  String get toSvg => "assets/icons/svg_$this.svg";

  String get toPng => "assets/images/ig_$this.png";

  String get toJpg => "assets/images/ig_$this.jpg";

  String get toJson => "assets/lottie/$this.json";
}

extension NumberParsing on String {
  int get parseInt => int.parse(this);

  int? get tryParseInt => int.tryParse(this);

  double get parseDouble => double.parse(this);

  double? get tryParseDouble => double.tryParse(this);
}

extension FileTypesChecker on String {
  bool get isVideo {
    var path = toLowerCase();

    return path.endsWith(".mp4") ||
        path.endsWith(".avi") ||
        path.endsWith(".wmv") ||
        path.endsWith(".rmvb") ||
        path.endsWith(".mpg") ||
        path.endsWith(".mpeg") ||
        path.endsWith(".3gp");
  }

  bool get isImage {
    final path = toLowerCase();
    return path.endsWith(".jpg") ||
        path.endsWith(".jpeg") ||
        path.endsWith(".png") ||
        path.endsWith(".gif") ||
        path.endsWith(".bmp");
  }

  bool get isVector {
    final path = toLowerCase();
    return path.endsWith(".svg");
  }

  bool get isPdf {
    final path = toLowerCase();
    return path.endsWith(".pdf");
  }

  bool get isAudio {
    final path = toLowerCase();
    return path.endsWith(".mp3") ||
        path.endsWith(".wav") ||
        path.endsWith(".wma") ||
        path.endsWith(".amr") ||
        path.endsWith(".ogg");
  }
}

extension NullableStringExtension on String? {
  bool get nullOrEmpty => this == null || this!.isEmpty ? true : false;
}
