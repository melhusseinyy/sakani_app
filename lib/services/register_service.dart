import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:sakni/models/Auth_model/register_model.dart';

Future<dynamic> register(RegisterModel model) async {
  final uri = Uri.parse('http://127.0.0.1:8000/api/register');
  final response = await http.post(uri, body: model,headers: {'Accept':'application/json'});

  if (response.statusCode == 200) {
    print('تم التسجيل بنجاح');
  } else {
    print('فشل التسجيل');
  }
}