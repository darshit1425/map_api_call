import 'package:flutter/foundation.dart';
import 'package:map_api_call/api_helper.dart';

class HomeProvider extends ChangeNotifier {
  List<dynamic> postapiList = [];

  Future<List> getapiData() async {
    postapiList = await ApiHelper.helper.Apicall();
    return postapiList;
  }
}
