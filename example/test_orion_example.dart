import 'package:orion_client/src/users/user_web_service.dart';

void main() {
  var ws = new UsersWebService(false, false);
  ws.createUser('name', 'email', 'password');
}
