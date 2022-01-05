import 'dart:async';
import 'package:exhibit_app/api/loader/exhibits_loader.dart';
import 'package:exhibit_app/api/model/Exhibit.dart';
import 'package:exhibit_app/api/network/RestProvider.dart';
import 'package:exhibit_app/utils/DI.dart';

class RestExhibitsLoader implements ExhibitsLoader {

  final RestProvider _restProvider = getIt<RestProvider>();

  @override
  Future<List<Exhibit>> getExhibitList() async {
    List<Exhibit> list = [];
    List<dynamic> response = await _restProvider.getRequest("/Reyst/exhibit_db/list");
    response.forEach((v) => list.add(Exhibit.fromJson(v)));
    return list;
  }
}