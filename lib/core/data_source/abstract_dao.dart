abstract class DAO<T> {
  Stream<List<T>> getAll();

  T getOne(int id);

  void update(T newData);

  void add(T data);

  void delete(dynamic id);
}
