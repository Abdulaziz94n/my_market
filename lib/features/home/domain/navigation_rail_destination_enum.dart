enum RailDestination {
  dashboard('dashboard'),
  stockProduct('stockProduct'),
  stockPerte('stockPerte'),
  clientsOnCredit('clientsOnCredit'),
  clientsCompany('clientsCompany'),
  clientsHistory('clientsHistory'),
  reports('reports'),
  users('users'),
  cashier('cashier'),
  settings('settings');

  const RailDestination(this.type);
  final String type;
}
