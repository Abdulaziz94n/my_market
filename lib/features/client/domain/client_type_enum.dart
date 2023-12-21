enum ClientType {
  companyClient('companyClient', 1),
  creditClient('creditClient', 2);

  const ClientType(this.type, this.typeIndex);
  final String type;
  final int typeIndex;

  static ClientType fromString(String val) {
    return switch (val) {
      'companyClient' => ClientType.companyClient,
      'creditClient' => ClientType.creditClient,
      _ => throw UnimplementedError()
    };
  }

  static ClientType fromInt(int val) {
    return switch (val) {
      1 => ClientType.companyClient,
      2 => ClientType.creditClient,
      _ => throw UnimplementedError()
    };
  }
}
