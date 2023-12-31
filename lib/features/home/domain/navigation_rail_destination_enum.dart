enum RailDestination {
  dashboard('dashboard'),
  stockProduct('stockProduct'),
  stockPerte('stockPerte'),
  clientsOnCredit('clientsOnCredit'),
  clientsCompany('clientsCompany'),
  clientsHistory('clientsHistory'),
  reports('reports'),
  users('users'),
  oldUsers('oldUsers'),
  cashier('cashier'),
  barCodeGen('barCodeGen'),
  authorizations('authorizations'),
  tickets('tickets'),
  categories('categories');

  const RailDestination(this.type);
  final String type;
}
