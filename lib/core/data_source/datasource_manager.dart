import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_market/core/exceptions/app_exceptions.dart';

abstract class RemoteDataSource {} // used to ensure type safety for generic [DataSourceManager] class

abstract class LocalDataSource {} // used to ensure type safety for generic [DataSourceManager] class

class DataSourceManager<R extends RemoteDataSource, L extends LocalDataSource> {
  final R remoteDataSource;
  final L localDataSource;
  DataSourceManager({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  FutureOr<T> performWithConnectionCheck<T>({
    required FutureOr<T> Function() whenConnected,
    required FutureOr<T> Function() whenOffline,
  }) async {
    final hasConnection = await InternetConnectionChecker().hasConnection;
    if (hasConnection) {
      try {
        return await whenConnected();
      } catch (e) {
        throw CustomException(message: e.toString());
      }
    } else {
      return await whenOffline();
    }
  }
}

abstract class TodosRepo {
  Future<void> addTodo(Todo todo);

  // Other Methods ....
}

class TodosRepoImpl implements TodosRepo {
  TodosRepoImpl(this.dataSources);
  final DataSourceManager<TodoRemoteDatasource, TodoLocalDatasource>
      dataSources;

  TodoRemoteDatasource get remoteDataSource => dataSources.remoteDataSource;
  TodoLocalDatasource get localDataSource => dataSources.localDataSource;

  @override
  Future<void> addTodo(Todo todo) async {
    await dataSources.performWithConnectionCheck(
      whenConnected: () => remoteDataSource.addTodo(Todo()),
      whenOffline: () => localDataSource.addTodo(Todo()),
    );
  }
}

class TodoRemoteDatasource extends RemoteDataSource implements TodosRepo {
  @override
  Future<void> addTodo(Todo todo) {
    return Future.delayed(Duration.zero, () => print('Add from Remote'));
  }
}

class TodoLocalDatasource extends LocalDataSource implements TodosRepo {
  @override
  Future<void> addTodo(Todo todo) {
    return Future.delayed(Duration.zero, () => print('Add from Local'));
  }
}

class Todo {}
