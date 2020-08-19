import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

class Api {
  final request = "https://api.hgbrasil.com/finance?key=6fffc76f";

  Future<Map> getData() async {
    http.Response response = await http.get(request);
    return json.decode(response.body);
  }
}
