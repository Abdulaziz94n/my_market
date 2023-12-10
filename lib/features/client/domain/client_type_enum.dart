enum ClientType {
  companyClient('companyClient'),
  creditClient('creditClient');

  const ClientType(this.type);
  final String type;

  static ClientType fromString(String val) {
    return switch (val) {
      'companyClient' => ClientType.companyClient,
      'creditClient' => ClientType.creditClient,
      _ => throw UnimplementedError()
    };
  }
}
