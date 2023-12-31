enum Gender {
  male('male', 1),
  female('feminin', 2);

  const Gender(this.type, this.id);
  final String type;
  final int id;

  static Gender fromString(String val) {
    return switch (val) {
      'male' => Gender.male,
      'feminin' => Gender.female,
      _ => throw UnimplementedError()
    };
  }

  static Gender fromInt(int val) {
    return switch (val) {
      1 => Gender.male,
      2 => Gender.female,
      _ => throw UnimplementedError()
    };
  }
}
