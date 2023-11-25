// ignore_for_file: file_names

import 'package:zosr/core/function/api.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';

abstract class RemoteDataSourcHome {
  Future<List<ProdectModel>> getAllProdect(String catgrayName);
}

class RemoteDataSourcHomeImpl extends RemoteDataSourcHome {
  @override
  Future<List<ProdectModel>> getAllProdect(String catgrayName) {
    Api api = Api();
    try {
      return api.GetData(catgrayName);
    } catch (e) {
      return Future(() => []);
    }
  }
}
