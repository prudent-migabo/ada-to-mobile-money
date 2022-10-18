
import 'package:http/http.dart' as http;

String errorHandler(http.Response response){
  final statusCode = response.statusCode;
  final errorMessaging = response.reasonPhrase;

  String errorMsg = 'Response failed \n $statusCode $errorMessaging';
  return errorMsg;
}