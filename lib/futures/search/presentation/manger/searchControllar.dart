
 // ignore_for_file: file_names
 
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zosr/futures/home/data/dataSource/remoteDataSource.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';

class SearchControllar extends GetxController {
  List<ProdectModel> prodects = [];
  @override
  void onInit() async {
    super.onInit();
    prodects = await RemoteDataSourcHomeImpl().getAllProdect('products');
  }
}
