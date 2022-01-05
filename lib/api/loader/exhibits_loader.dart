import 'package:exhibit_app/api/model/Exhibit.dart';

abstract class ExhibitsLoader {

  Future<List<Exhibit>> getExhibitList();

}